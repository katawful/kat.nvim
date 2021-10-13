(module katdotnvim.utils.color
        {autoload {hsl externals.hsluv}})

; this function handles color manipulation

; sourceColor is the color we want to manipulate
; mixColor is the color we want to mix with
; alpha is a 0 - 1 decimal value that determines how much mix value is allowed
; 0 is full sourceColor, 1 is full mixColor
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
    (def output (tostring (hsl.rgb_to_hex returnColor)))))
