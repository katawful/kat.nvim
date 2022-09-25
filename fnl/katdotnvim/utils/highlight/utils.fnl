(module katdotnvim.utils.highlight.utils
        {autoload {hsl externals.hsluv}
         require-macros [katcros-fnl.macros.lispism.macros]})

;;; Utilities for color management

;; FN -- blend two hex colors based on some alpha value
;; -- higher alpha means the mix-color is preferred
;; @source-color -- the color we want to manipulate
;; @mix-color -- the color we want to mix with
;; @alpha -- a 0 - 1 decimal value that determines how much mix value is allowed
;; $output -- blended hex color
(defn blend [source-color mix-color alpha] "Blend two hex colors by some alpha
@source-color -- left color
@mix-color -- right color
@alpha -- decimal number. 0 blends in only right color, 1 blends in only left color
Returns hex color"
      (let [source-color (hsl.hex_to_rgb source-color)
            mix-color (hsl.hex_to_rgb mix-color)
            ;; Uses macros, puts arg 3 into for loop over i up to 3 and outputs it as a table
            return-color (value->table i 3
                                       (+ (* alpha (. source-color i))
                                          (* (- 1 alpha) (. mix-color i))))]
        (tostring (hsl.rgb_to_hex return-color))))

;; FN -- brighten a hex color
;; @color -- input hex color
;; @percent -- amount to adjust as a decimal percent
;; $output -- changed hex color
(defn brighten [color percent] "Brighten a hex color by some percent
@color -- hex color
@percent -- decimal
Returns hex color"
      (let [hsl-color (hsl.hex_to_hsluv color)
            luminance (- 100 (. hsl-color 3))
            input-luminance (let [mid-luminance (+ (. hsl-color 3)
                                                   (* luminance percent))]
                              (if (>= mid-luminance 100) 99.99 mid-luminance))]
        (tset hsl-color 3 input-luminance)
        (hsl.hsluv_to_hex hsl-color)))

(defn decimal-rgb->hex [rgb] "Converts single number decimal rgb number to hex
@rgb -- single number decimal"
      (string.format "#%x" rgb))

;; FN -- brighten a hsluv color table
;; @tuple -- input color as a 3 value sequential table
;; @percent -- amount to adjust as a decimal percent
;; $output -- changed hex color
(defn hsluv-brighten [tuple percent] "Brighten a hsluv color by some percent
@color -- hsluv color, a 3 key seq table
@percent -- decimal
Returns hex color"
      (let [hsl-color tuple
            luminance (- 100 (. hsl-color 3))
            input-luminance (let [mid-luminance (* (. hsl-color 3)
                                                   (+ 1 percent))]
                              ;; Don't let luminance go at or above 100
                              ;; Doing so makes math behave strangely
                              (if (>= mid-luminance 100) 99.99 mid-luminance))]
        (tset hsl-color 3 input-luminance)
        (hsl.hsluv_to_hex hsl-color)))

;; FN -- darken a hex color
;; @color -- input hex color
;; @percent -- amount to adjust as a decimal percent
;; $output -- changed hex color
(defn darken [color percent] "Darken a hex color by some percent
@color -- hex color
@percent -- decimal
Returns hex color"
      (let [hsl-color (hsl.hex_to_hsluv color)
            luminance (- 100 (. hsl-color 3))
            input-luminance (let [mid-luminance (* (. hsl-color 3)
                                                   (- 1 percent))]
                              ;; Don't let luminance go at or above 100
                              ;; Doing so makes math behave strangely
                              (if (>= mid-luminance 100) 99.99 mid-luminance))]
        (tset hsl-color 3 input-luminance)
        (hsl.hsluv_to_hex hsl-color)))

;; FN -- change the saturation of a hex color
;; @color -- input hex color
;; @percent -- amount to adjust as a decimal percent
;; $output -- changed hex color
(defn saturation [color percent] "Change saturation of hex color by some percent
@color -- hex color
@percent -- decimal
Returns hex color"
      (let [hsl-color (hsl.hex_to_hsluv color)
            saturation (. hsl-color 2)
            input-saturation (let [mid-saturation (+ (. hsl-color 2)
                                                     (* saturation percent))]
                               ;; Don't let saturation to go beyond 0 and 100
                               ;; Math breaks outside these bounds
                               (if (>= mid-saturation 100) 99.99
                                   (<= mid-saturation 0) 0.01
                                   mid-saturation))]
        (tset hsl-color 2 input-saturation)
        (hsl.hsluv_to_hex hsl-color)))
