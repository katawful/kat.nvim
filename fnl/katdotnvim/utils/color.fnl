(module katdotnvim.utils.color
  {autoload {hsl externals.hsluv
             colors katdotnvim.color
             a aniseed.core}
   require-macros [katdotnvim.utils.macros
                   katdotnvim.utils.macros.iterator.macros]})

;;; Utilities for color management

; (macrodebug (value->table i 3 (let [test i] test)))
;; FN -- blend two hex colors based on some alpha value
;; -- higher alpha means the mix-color is preferred
;; @source-color -- the color we want to manipulate
;; @mix-color -- the color we want to mix with
;; @alpha -- a 0 - 1 decimal value that determines how much mix value is allowed
;; $output -- blended hex color
(defn blend [source-color mix-color alpha]
  (let [source-color (hsl.hex_to_rgb source-color)
        mix-color (hsl.hex_to_rgb mix-color)
        return-color (value->table i 3
                                   (let [current-color (+ (* alpha (. source-color i))
                                                          (* (- 1 alpha) (. mix-color i)))] current-color))
        output (tostring (hsl.rgb_to_hex return-color))]
    output))

;; FN -- generate a highlight with the appropriate hex color inputs and group
;; -- Has sideffects
;; @gr -- highlight as a string
;; @guifg -- hex color for foreground
;; @guibg -- hex color for background
;; @cfg -- terminal color number for foreground
;; @cbg -- terminal color number for background
;; @... -- handles extra highlighting options as a string
(defn highlight$ [gr guifg guibg cfg cbg ...]
  (let [group (tostring gr)
        gui-fore (if (not= guifg :SKIP)
                   (string.format " guifg=%s" guifg)
                   " ")
        gui-back (if (not= guibg :SKIP)
                   (string.format " guibg=%s" guibg)
                   " ")
        c-fore (if (not= cfg :SKIP)
                 (string.format " ctermfg=%s" cfg)
                 " ")
        c-back (if (not= cbg :SKIP)
                 (string.format " ctermbg=%s" cbg)
                 " ")
        args [...]
        extra (if (> (length args) 0)
                (do (var string "")
                  (each [_ v (pairs args)]
                    ; match color means guisp
                    (if (= (string.sub v 1 1) "#")
                      (do (set string (string.format "% s guisp=%s"
                                                     string
                                                     v)))
                        ; if a string, e.g. italics
                      (= (a.string? v) true)
                      (do (set string (string.format "%s gui=%s cterm=%s"
                                                     string
                                                     (tostring v)
                                                     (tostring v))))
                      ; else means blend
                      (do (set string (string.format "%s blend=%s" 
                                                     string
                                                     v)))))
                  string)
                (do ""))]
    (let [output (.. "highlight " group gui-fore gui-back c-fore c-back extra)]
      (vim.cmd (tostring output))
      output)))

;; FN -- generate a highlight with the appropriate hex color inputs and group
;; -- Has sideffects, only takes and sets GUI colors
;; @gr -- highlight as a string
;; @guifg -- hex color for foreground
;; @guibg -- hex color for background
;; @... -- handles extra highlighting options as a string
(defn highlight-gui$ [gr guifg guibg ...]
  (let [group (tostring gr)
        gui-fore (if (not= guifg :SKIP)
                   (string.format " guifg=%s" guifg)
                   " ")
        gui-back (if (not= guibg :SKIP)
                   (string.format " guibg=%s" guibg)
                   " ")
        args [...]
        extra (if (> (length args) 0)
                (do (var string "")
                  (each [_ v (pairs args)]
                    ; match color means guisp
                    (if (= (string.sub v 1 1) "#")
                      (do (set string (string.format "% s guisp=%s"
                                                     string
                                                     v)))
                        ; if a string, e.g. italics
                      (= (a.string? v) true)
                      (do (set string (string.format "%s gui=%s cterm=%s"
                                                     string
                                                     (tostring v)
                                                     (tostring v))))
                      ; else means blend
                      (do (set string (string.format "%s blend=%s" 
                                                     string
                                                     v)))))
                  string)
                (do ""))]
    (let [output (.. "highlight " group gui-fore gui-back c-fore c-back extra)]
      (vim.cmd (tostring output))
      output)))

;; FN -- brighten a hex color
;; @color -- input hex color
;; @percent -- amount to adjust as a decimal percent
;; $output -- changed hex color
(defn brighten [color percent]
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
