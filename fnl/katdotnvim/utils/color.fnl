(module katdotnvim.utils.color
  {autoload {hsl externals.hsluv
             colors katdotnvim.color
             get katdotnvim.utils.highlight.init
             a aniseed.core
             s aniseed.string}
   require-macros [katdotnvim.katcros-fnl.macros.lispism.macros]})

;;; Utilities for color management

;; FN -- blend two hex colors based on some alpha value
;; -- higher alpha means the mix-color is preferred
;; @source-color -- the color we want to manipulate
;; @mix-color -- the color we want to mix with
;; @alpha -- a 0 - 1 decimal value that determines how much mix value is allowed
;; $output -- blended hex color
(defn blend [source-color mix-color alpha]
  "Blend two colors by some alpha"
  (let [source-color (hsl.hex_to_rgb source-color)
        mix-color (hsl.hex_to_rgb mix-color)
        return-color (value->table i 3
                                   (let [current-color (+ (* alpha (. source-color i))
                                                          (* (- 1 alpha) (. mix-color i)))] current-color))
        output (tostring (hsl.rgb_to_hex return-color))]
    output))

;; FN -- generate a highlight with the appropriate hex color inputs and group
;; -- Warning, this is only public for testing, use highlight$ instead
;; -- Uses vimscript for users of Neovim older than 0.7
;; -- Has sideffects
;; @opts -- a neovim standard table of highlight values
(defn highlight$<-vimscript [opts]
  "Nested function that uses vimscript highlight functions to handle
highlighting for pre-0.7 users"
 (let [group opts.group
       gui-fore (if (and (not= (get.gui-fg opts) nil)
                         (not= opts.fg :SKIP))
                  (string.format " guifg=%s" opts.fg)
                  "")
       gui-back (if (and (not= (get.gui-bg opts) nil)
                         (not= opts.bg :SKIP))
                  (string.format " guibg=%s" opts.bg)
                  "")
       c-fore (if (and (not= (get.term-fg opts) nil)
                       (not= opts.ctermfg :SKIP))
                (string.format " ctermfg=%s" opts.ctermfg)
                "")
       c-back (if (and (not= (get.term-bg opts) nil)
                       (not= opts.ctermbg :SKIP))
                (string.format " ctermbg=%s" opts.ctermbg)
                "")
       special (if (not= (get.special opts) nil)
                 (string.format " guisp=%s" (get.special opts))
                 "")
       blend (if (not= (get.blend opts) nil)
               (string.format " blend=%s" (get.blend opts))
               "")
       attr (let [attr-string (get.attr->string opts)]
              (if (not= attr-string nil)
                (string.format " gui=%s cterm=%s" attr-string attr-string)
                ""))]
   ; actually highlight
   (let [highlight (.. "highlight " group gui-fore gui-back c-fore c-back attr special blend)]
     (vim.cmd (tostring highlight)))))

;; FN -- generate a highlight with the appropriate hex color inputs and group
;; -- Warning, this is only public for testing, use highlight$ instead
;; -- Uses nvim api for users of Neovim 0.7 and newer
;; -- Has sideffects
;; @opts -- Neovim standard table of highlight values
(defn highlight$<-api [opts]
  "Nested highlight function that uses nvim api function to handle
highlighting for Neovim 0.7 and newer users"
 (let [group opts.group
       gui-fore (if (and (not= (get.gui-fg opts) nil)
                         (not= opts.fg :NONE)
                         (not= opts.fg :SKIP))
                  opts.fg
                  nil)
       gui-back (if (and (not= (get.gui-bg opts) nil)
                         (not= opts.bg :NONE)
                         (not= opts.bg :SKIP))
                  opts.bg
                  nil)
       c-fore (if (and (not= (get.term-fg opts) nil)
                       (not= opts.ctermfg :NONE)
                       (not= opts.ctermfg :SKIP))
                opts.ctermfg
                nil)
       c-back (if (and (not= (get.term-bg opts) nil)
                       (not= opts.ctermbg :NONE)
                       (not= opts.ctermbg :SKIP))
                opts.ctermbg
                nil)
       args {:fg gui-fore
             :bg gui-back
             :ctermfg c-fore
             :ctermbg c-back
             :special (get.special opts)
             :blend (get.blend opts)}]

   (each [k v (pairs (get.all-attr->table opts))]
     (tset args k v))
   (vim.api.nvim_set_hl 0 group args)))

;; FN -- generate a highlight with the appropriate hex color inputs and group
;; -- Has sideffects
;; -- Runs Vimscript for users Neovim 0.6.1 and earlier
;; @opts -- Neovim standard table of highlight values
(defn highlight$ [opts]
  "Generate a highlight using term and GUI colors"
  (if (= (vim.fn.has "nvim-0.7") 0)
    (highlight$<-vimscript opts)
    (highlight$<-api opts)))

;; FN -- brighten a hex color
;; @color -- input hex color
;; @percent -- amount to adjust as a decimal percent
;; $output -- changed hex color
(defn brighten [color percent]
  "Brighten a hex color by some percent"
  (let [hsl-color (hsl.hex_to_hsluv color)
        luminance (- 100 (. hsl-color 3))
        input-luminance (let [mid-luminance (+ (. hsl-color 3)
                                              (* luminance percent))]
                          (if (>= mid-luminance 100)
                            99.99
                            mid-luminance))]
    (tset hsl-color 3 input-luminance)
    (let [output (hsl.hsluv_to_hex hsl-color)]
      output)))

;; FN -- brighten a hsluv color table
;; @tuple -- input color as a 3 value sequential table
;; @percent -- amount to adjust as a decimal percent
;; $output -- changed hex color
(defn hsluv-brighten [tuple percent]
  "Brighten a hsluv color by some percent"
  (let [hsl-color tuple
        luminance (- 100 (. hsl-color 3))
        input-luminance (let [mid-luminance (* (. hsl-color 3)
                                              (+ 1 percent))]
                          (if (>= mid-luminance 100)
                            99.99
                            mid-luminance))]
    (tset hsl-color 3 input-luminance)
    (let [output (hsl.hsluv_to_hex hsl-color)]
      output)))

;; FN -- darken a hex color
;; @color -- input hex color
;; @percent -- amount to adjust as a decimal percent
;; $output -- changed hex color
(defn darken [color percent]
  "Darken a hex color by some percent"
  (let [hsl-color (hsl.hex_to_hsluv color)
        luminance (- 100 (. hsl-color 3))
        input-luminance (let [mid-luminance (* (. hsl-color 3)
                                              (- 1 percent))]
                          (if (>= mid-luminance 100)
                            99.99
                            mid-luminance))]
    (tset hsl-color 3 input-luminance)
    (let [output (hsl.hsluv_to_hex hsl-color)]
      output)))

;; FN -- change the saturation of a hex color
;; @color -- input hex color
;; @percent -- amount to adjust as a decimal percent
;; $output -- changed hex color
(defn saturation [color percent]
  "Change saturation of hex color by some percent"
  (let [hsl-color (hsl.hex_to_hsluv color)
        saturation (. hsl-color 2)
        input-saturation (let [mid-saturation (+ (. hsl-color 2)
                                                 (* saturation percent))]
                          (if (>= mid-saturation 100)
                            99.99
                            (<= mid-saturation 0)
                            0.01
                            mid-saturation))]
    (tset hsl-color 2 input-saturation)
    (let [output (hsl.hsluv_to_hex hsl-color)]
      output)))
