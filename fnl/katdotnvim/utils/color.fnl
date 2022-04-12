(module katdotnvim.utils.color
  {autoload {hsl externals.hsluv
             colors katdotnvim.color
             a aniseed.core}
   require-macros [katdotnvim.utils.macros]})

;;; Utilities for color management

;; FN -- blend two hex colors based on some alpha value
;; -- higher alpha means the mix-color is preferred
;; @source-color -- the color we want to manipulate
;; @mix-color -- the color we want to mix with
;; @alpha -- a 0 - 1 decimal value that determines how much mix value is allowed
;; $output -- blended hex color
(defn blend  [source-color mix-color alpha]
  ; set each color to rgb for blending
  (let [source-color (hsl.hex_to_rgb source-color)
        mix-color (hsl.hex_to_rgb mix-color)]
    (var returnColor [])
    ; for each RGB value
    (for [i 1 3]
      (var currentColor (+ (* alpha (. source-color i))
                           (* (- 1 alpha) (. mix-color i))))
      ; (set currentColor (math.floor (+ (math.min (math.max 0 currentColor) 255) 0.5)))
      (tset returnColor i currentColor))
    (local output (tostring (hsl.rgb_to_hex returnColor)))
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
  (local group (tostring gr))
  (var gui-fore " ")
  (var gui-back " ")
  (var c-fore " ")
  (var c-back " ")
  (when (not= guifg :SKIP)
    (set gui-fore (string.format " guifg=%s" guifg)))
  (when (not= guibg :SKIP)
    (set gui-back (string.format " guibg=%s" guibg)))
  (when (not= cfg :SKIP)
    (set c-fore (string.format " ctermfg=%s" cfg)))
  (when (not= cbg :SKIP)
    (set c-back (string.format " ctermbg=%s" cbg)))
  (var extra "")
  (local args [...])
  (if (> (length args) 0)
    (each [k v (pairs args)]
      (if (= (string.sub v 1 1) :#)
      ; match color means guisp
        (do (set extra (string.format "%s guisp=%s" 
                                  extra
                                  v)))
          ; if a string, e.g. italics
        (= (a.string? v) true)
        (do (set extra (string.format "%s gui=%s cterm=%s"
                                      extra
                                      (tostring v)
                                      (tostring v))))
          ; else means blend
        (do (set extra (string.format "%s blend=%s" 
                                      extra
                                      v))))))
  (local output (.. "highlight " group gui-fore gui-back c-fore c-back extra))
  (vim.cmd (tostring output)))

;; FN -- generate a highlight with the appropriate hex color inputs and group
;; -- Has sideffects, only takes and sets GUI colors
;; @gr -- highlight as a string
;; @guifg -- hex color for foreground
;; @guibg -- hex color for background
;; @... -- handles extra highlighting options as a string
(defn highlight-gui$ [gr guifg guibg ...]
  (local group (tostring gr))
  (var gui-fore " ")
  (var gui-back " ")
  (when (not= guifg :SKIP)
    (set gui-fore (string.format " guifg=%s" guifg)))
  (when (not= guibg :SKIP)
    (set gui-back (string.format " guibg=%s" guibg)))
  (var extra "")
  (local args [...])
  (if (> (length args) 0)
    (each [k v (pairs args)]
      (if (= (string.sub v 1 1) :#)
      ; match color means guisp
        (do (set extra (string.format "%s guisp=%s" 
                                  extra
                                  v)))
          ; if a string, e.g. italics
        (= (a.string? v) true)
        (do (set extra (string.format "%s gui=%s"
                                      extra
                                      (tostring v))))
          ; else means blend
        (do (set extra (string.format "%s blend=%s" 
                                      extra
                                      v))))))
  (local output (.. "highlight " group gui-fore gui-back extra))
  (vim.cmd (tostring output)))

;; FN -- brighten a hex color
;; @color -- input hex color
;; @percent -- amount to adjust as a decimal percent
;; $output -- changed hex color
(defn brighten [color percent]
  (local hslColor (hsl.hex_to_hsluv color))
  (local luminance (- 100 (. hslColor 3)))

  (var inputLuminance (+ (. hslColor 3)
                         (* luminance percent)))
  (when (>= inputLuminance 100)
    (set inputLuminance 99.99))
  (tset hslColor 3 inputLuminance)
  (local output (hsl.hsluv_to_hex hslColor))
  output)

;; FN -- brighten a hsluv color table
;; @tuple -- input color as a 3 value sequential table
;; @percent -- amount to adjust as a decimal percent
;; $output -- changed hex color
(defn hsluv-brighten [tuple percent]
  (var hslColor tuple)
  (local luminance (- 100 (. hslColor 3)))

  (var inputLuminance (* (. hslColor 3)
                         (+ 1 percent)))
  (when (>= inputLuminance 100)
    (set inputLuminance 99.99))
  (tset hslColor 3 inputLuminance)
  (local output (hsl.hsluv_to_hex hslColor))
  output)

;; FN -- darken a hex color
;; @color -- input hex color
;; @percent -- amount to adjust as a decimal percent
;; $output -- changed hex color
(defn darken [color percent]
  (local hslColor (hsl.hex_to_hsluv color))
  (local luminance (- 100 (. hslColor 3)))

  (var inputLuminance (* (. hslColor 3)
                         (- 1 percent)))
  (when (>= inputLuminance 100)
    (set inputLuminance 99.99))
  (tset hslColor 3 inputLuminance)
  (local output (hsl.hsluv_to_hex hslColor))
  output)

;; FN -- change the saturation of a hex color
;; @color -- input hex color
;; @percent -- amount to adjust as a decimal percent
;; $output -- changed hex color
(defn saturation [color percent]
  (local hslColor (hsl.hex_to_hsluv color))
  (local sat (. hslColor 2))

  (var inputSaturation (+ (. hslColor 2)
                          (* sat percent)))
  (if (>= inputSaturation 100)
    (set inputSaturation 99.99)
    (<= inputSaturation 0)
    (set inputSaturation 0.01))
  (tset hslColor 2 inputSaturation)
  (local output (hsl.hsluv_to_hex hslColor))
  output)
