(module katdotnvim.utils.color
  {autoload {hsl externals.hsluv
             colors katdotnvim.color
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
;; @gr -- highlight as a string
;; @guifg -- hex color for foreground
;; @guibg -- hex color for background
;; @cfg -- terminal color number for foreground
;; @cbg -- terminal color number for background
;; @args -- handles extra highlighting options as a string
(defn highlight$<-vimscript [gr guifg guibg cfg cbg args]
  "Nested function that uses vimscript highlight functions to handle
highlighting for pre-0.7 users"
 (let [group (tostring gr)
       output {:group group}
       gui-fore (if (not= guifg :SKIP)
                  (do (tset output :fg guifg)
                    (string.format " guifg=%s" guifg))
                  " ")
       gui-back (if (not= guibg :SKIP)
                  (do (tset output :bg guibg)
                    (string.format " guibg=%s" guibg))
                  " ")
       c-fore (if (not= cfg :SKIP)
                (do (tset output :ctermfg cfg)
                  (string.format " ctermfg=%s" cfg))
                " ")
       c-back (if (not= cbg :SKIP)
                (do (tset output :ctermbg cbg)
                  (string.format " ctermbg=%s" cbg))
                " ")
       extra (if (> (length args) 0)
               (do (var string "")
                 (each [_ v (pairs args)]
                   ; match color means guisp
                   (if (= (string.sub v 1 1) "#")
                     (do (tset output :sp v)
                       (set string (string.format "%s guisp=%s"
                                                  string
                                                  v)))
                       ; if a string, e.g. italics
                     (= (a.string? v) true)
                     (do (if (= v :NONE)
                           (tset output :reverse true)
                           (let [gui (s.split v ",")]
                            (each [_ gui-val (pairs gui)]
                              (tset output gui-val true))))
                         (set string (string.format "%s gui=%s cterm=%s"
                                                    string
                                                    (tostring v)
                                                    (tostring v))))
                     ; else means blend
                     (do (tset output :blend v)
                       (set string (string.format "%s blend=%s"
                                                  string
                                                  v))))
                   string)
                 (do "")))]

   ; actually highlight
   (let [highlight (.. "highlight " group gui-fore gui-back c-fore c-back extra)]
     (vim.cmd (tostring highlight)))

   ; output table of values for unit testing
   output))

;; FN -- generate a highlight with the appropriate hex color inputs and group
;; -- Warning, this is only public for testing, use highlight$ instead
;; -- Uses nvim api for users of Neovim 0.7 and newer
;; -- Has sideffects
;; @gr -- highlight as a string
;; @guifg -- hex color for foreground
;; @guibg -- hex color for background
;; @cfg -- terminal color number for foreground
;; @cbg -- terminal color number for background
;; @args -- handles extra highlighting options as a string
;; $opts -- output of everything used to pass to the highlight function
(defn highlight$<-api [gr guifg guibg cfg cbg args]
  "Nested highlight function that uses nvim api function to handle
highlighting for Neovim 0.7 and newer users"
 (let [group gr
       gui-fore (if (and (not= guifg :NONE)
                       (not= guifg :SKIP))
                 guifg
                 nil)
       gui-back (if (and (not= guibg :NONE)
                        (not= guibg :SKIP))
                  guibg
                  nil)
       c-fore (if (and (not= cfg :NONE)
                     (not= cfg :SKIP))
               cfg
               nil)
       c-back (if (and (not= cbg :NONE)
                      (not= cbg :SKIP))
                cbg
                nil)
       opts {:fg gui-fore
             :bg gui-back
             :ctermfg c-fore
             :ctermbg c-back}]

   ; handle arguments
   (each [_ value (pairs args)]
     ; match color means guisp
     (if (= (string.sub value 1 1) "#")
       (do (tset opts :sp value))
         ; if a string, e.g. italics
       (= (a.string? value) true)
       (do
         ; need to split up if there's a ','
         (if (and (not= value :NONE)
                  (string.find value ","))
           (let [gui (s.split value ",")]
             (each [_ gui-val (pairs gui)]
               (tset opts gui-val true)))
           ; for some reason reverse does stuff without asking
           ; try to get it here
           (= value :NONE)
           (do
             (tset opts :reverse false))
           (tset opts value true)))
       ; else means blend
       (do (tset opts :blend value))))

   ; actually highlight
   (vim.api.nvim_set_hl 0 group opts)

   ; output table for unit testing
   (tset opts :group gr)
   opts))

;; FN -- generate a highlight with the appropriate hex color inputs and group
;; -- Has sideffects
;; -- Runs Vimscript for users Neovim 0.6.1 and earlier
;; @gr -- highlight as a string
;; @guifg -- hex color for foreground
;; @guibg -- hex color for background
;; @cfg -- terminal color number for foreground
;; @cbg -- terminal color number for background
;; @... -- handles extra highlighting options as a string
;; $... -- returns a table of highlight values
(defn highlight$ [gr guifg guibg cfg cbg ...]
  "Generate a highlight using term and GUI colors"
  (let [args [...]]
    (if (= (vim.fn.has "nvim-0.7") 0)
      (highlight$<-vimscript gr guifg guibg cfg cbg args)
      (highlight$<-api gr guifg guibg cfg cbg args))))


;; FN -- generate a highlight with the appropriate hex color inputs and group, GUI only
;; -- Warning, this is only public for testing, use highlight$ instead
;; -- Uses nvim api for users of Neovim 0.7 and newer
;; -- Has sideffects
;; @gr -- highlight as a string
;; @guifg -- hex color for foreground
;; @guibg -- hex color for background
;; @cfg -- terminal color number for foreground
;; @cbg -- terminal color number for background
;; @args -- handles extra highlighting options as a string
;; $opts -- output of everything used to pass to the highlight function
(defn highlight-gui$<-api [gr guifg guibg args]
  "Nested highlight function that uses nvim api function to handle
highlighting for Neovim 0.7 and newer users"
 (let [group gr
       gui-fore (if (and (not= guifg :NONE)
                       (not= guifg :SKIP))
                 guifg
                 nil)
       gui-back (if (and (not= guibg :NONE)
                        (not= guibg :SKIP))
                  guibg
                  nil)
       opts {:fg gui-fore
             :bg gui-back}]

   ; handle arguments
   (each [_ value (pairs args)]
     ; match color means guisp
     (if (= (string.sub value 1 1) "#")
       (do (tset opts :sp value))
         ; if a string, e.g. italics
       (= (a.string? value) true)
       (do
         ; need to split up if there's a ','
         (if (and (not= value :NONE)
                  (string.find value ","))
           (let [gui (s.split value ",")]
             (each [_ gui-val (pairs gui)]
               (tset opts gui-val true)))
           ; for some reason reverse does stuff without asking
           ; try to get it here
           (= value :NONE)
           (do
             (tset opts :reverse false))
           (tset opts value true)))
       ; else means blend
       (do (tset opts :blend value))))

   ; actually highlight
   (vim.api.nvim_set_hl 0 group opts)

   ; output table for unit testing
   (tset opts :group gr)
   opts))

;; FN -- generate a highlight with the appropriate hex color inputs and group, GUI only
;; -- Warning, this is only public for testing, use highlight$ instead
;; -- Uses vimscript for users of Neovim older than 0.7
;; -- Has sideffects
;; @gr -- highlight as a string
;; @guifg -- hex color for foreground
;; @guibg -- hex color for background
;; @cfg -- terminal color number for foreground
;; @cbg -- terminal color number for background
;; @args -- handles extra highlighting options as a string
(defn highlight-gui$<-vimscript [gr guifg guibg args]
  "Nested function that uses vimscript highlight functions to handle
highlighting for pre-0.7 users"
 (let [group (tostring gr)
       output {:group group}
       gui-fore (if (not= guifg :SKIP)
                  (do (tset output :fg guifg)
                    (string.format " guifg=%s" guifg))
                  " ")
       gui-back (if (not= guibg :SKIP)
                  (do (tset output :bg guibg)
                    (string.format " guibg=%s" guibg))
                  " ")
       extra (if (> (length args) 0)
               (do (var string "")
                 (each [_ v (pairs args)]
                   ; match color means guisp
                   (if (= (string.sub v 1 1) "#")
                     (do (tset output :sp v)
                       (set string (string.format "%s guisp=%s"
                                                  string
                                                  v)))
                       ; if a string, e.g. italics
                     (= (a.string? v) true)
                     (do (if (= v :NONE)
                           (tset output :reverse true)
                           (let [gui (s.split v ",")]
                            (each [_ gui-val (pairs gui)]
                              (tset output gui-val true))))
                         (set string (string.format "%s gui=%s cterm=%s"
                                                    string
                                                    (tostring v)
                                                    (tostring v))))
                     ; else means blend
                     (do (tset output :blend v)
                       (set string (string.format "%s blend=%s"
                                                  string
                                                  v))))
                   string)
                 (do "")))]

   ; actually highlight
   (let [highlight (.. "highlight " group gui-fore gui-back extra)]
     (vim.cmd (tostring highlight)))

   ; output table of values for unit testing
   output))

;; FN -- generate a highlight with the appropriate hex color inputs and group, GUI only
;; -- Has sideffects, only takes and sets GUI colors
;; @gr -- highlight as a string
;; @guifg -- hex color for foreground
;; @guibg -- hex color for background
;; @... -- handles extra highlighting options as a string
;; $... -- returns a table of highlight values
(defn highlight-gui$ [gr guifg guibg ...]
  "Generate a highlight using GUI colors"
  (let [args [...]]
    (if (= (vim.fn.has "nvim-0.7") 0)
      (highlight-gui$<-vimscript gr guifg guibg args)
      (highlight-gui$<-api gr guifg guibg args))))

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
