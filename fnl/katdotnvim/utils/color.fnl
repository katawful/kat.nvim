(module katdotnvim.utils.color
        {autoload {hsl externals.hsluv
                   colors katdotnvim.color
                   a aniseed.core
                   }
         require-macros [katdotnvim.utils.macros]
         })

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
    (def output (tostring (hsl.rgb_to_hex returnColor)))
    output))

; this function handles highlight manipulation
; fairly self explanatory, variarg is for GUI and GUISP stuff
(defn highlight [gr fg bg ...]
  (def group (tostring gr))
  (def fore (.. " guifg=" fg))
  (def back (.. " guibg=" bg))
  (var extra "")
  (def args [...])
  (if (> (length args) 0)
    (each [k v (pairs args)]
      (if (= (string.sub v 1 1) :#)
        ; match color means guisp
        (do
          (set extra (.. extra " guisp=" v)))
        ; if a string, e.g. italics
        (= (a.string? v) false)
        (do
          (set extra (.. extra " gui=" (tostring v))))
        ; else means blend
        (do
          (set extra (.. extra " blend" v))))))
  (def output (.. "highlight " group fore back extra))
  (vim.cmd (tostring output)))
