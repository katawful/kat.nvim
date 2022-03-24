(module katdotnvim.utils.color
  {autoload {hsl externals.hsluv
             colors katdotnvim.color
             a aniseed.core}
   require-macros [katdotnvim.utils.macros]})

; this function handles color manipulation

; sourceColor is the color we want to manipulate
; mixColor is the color we want to mix with
; alpha is a 0 - 1 decimal value that determines how much mix value is allowed
; 1 is full sourceColor, 0 is full mixColor
; returns a hex string
(defn blendColors [sourceColor mixColor alpha]
  ; set each color to rgb for blending
  (let [sourceColor (hsl.hex_to_rgb sourceColor)
        mixColor (hsl.hex_to_rgb mixColor)]
    (var returnColor [])
    ; for each RGB value
    (for [i 1 3]
      (var currentColor (+ (* alpha (. sourceColor i))
                           (* (- 1 alpha) (. mixColor i))))
      ; (set currentColor (math.floor (+ (math.min (math.max 0 currentColor) 255) 0.5)))
      (tset returnColor i currentColor))
    (local output (tostring (hsl.rgb_to_hex returnColor)))
    output))

; this function handles highlight manipulation
; fairly self explanatory, variarg is for GUI and GUISP stuff
(defn highlight [gr guifg guibg cfg cbg ...]
  (local group (tostring gr))
  (var guiFore " ")
  (var guiBack " ")
  (var cFore " ")
  (var cBack " ")
  (when (not= guifg :SKIP)
    (set guiFore (string.format " guifg=%s" guifg)))
  (when (not= guibg :SKIP)
    (set guiBack (string.format " guibg=%s" guibg)))
  (when (not= cfg :SKIP)
    (set cFore (string.format " ctermfg=%s" cfg)))
  (when (not= cbg :SKIP)
    (set cBack (string.format " ctermbg=%s" cbg)))
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
  (local output (.. "highlight " group guiFore guiBack cFore cBack extra))
  (vim.cmd (tostring output)))

; a GUI only version of the above
(defn highlightGUI [gr guifg guibg ...]
  (local group (tostring gr))
  (var guiFore " ")
  (var guiBack " ")
  (when (not= guifg :SKIP)
    (set guiFore (string.format " guifg=%s" guifg)))
  (when (not= guibg :SKIP)
    (set guiBack (string.format " guibg=%s" guibg)))
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
  (local output (.. "highlight " group guiFore guiBack extra))
  (vim.cmd (tostring output)))

; this function brightens a color by some percent
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

(defn hsluvBrighten [tuple percent]
  (var hslColor tuple)
  (local luminance (- 100 (. hslColor 3)))

  (var inputLuminance (* (. hslColor 3)
                         (+ 1 percent)))
  (when (>= inputLuminance 100)
    (set inputLuminance 99.99))
  (tset hslColor 3 inputLuminance)
  (local output (hsl.hsluv_to_hex hslColor))
  output)

; this function darkens a color by some percent
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

; this function changes the saturation of a color by some percent
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
