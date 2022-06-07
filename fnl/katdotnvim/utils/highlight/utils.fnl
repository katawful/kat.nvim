(module katdotnvim.utils.highlight.utils
        {autoload {hsl externals.hsluv
                   colors katdotnvim.color
                   get katdotnvim.utils.highlight.get
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
(defn blend [source-color mix-color alpha] "Blend two colors by some alpha"
      (let [source-color (hsl.hex_to_rgb source-color)
            mix-color (hsl.hex_to_rgb mix-color)
            return-color (value->table i 3
                                       (let [current-color (+ (* alpha
                                                                 (. source-color
                                                                    i))
                                                              (* (- 1 alpha)
                                                                 (. mix-color i)))]
                                         current-color))
            output (tostring (hsl.rgb_to_hex return-color))]
        output))

;; FN -- brighten a hex color
;; @color -- input hex color
;; @percent -- amount to adjust as a decimal percent
;; $output -- changed hex color
(defn brighten [color percent] "Brighten a hex color by some percent"
      (let [hsl-color (hsl.hex_to_hsluv color)
            luminance (- 100 (. hsl-color 3))
            input-luminance (let [mid-luminance (+ (. hsl-color 3)
                                                   (* luminance percent))]
                              (if (>= mid-luminance 100) 99.99 mid-luminance))]
        (tset hsl-color 3 input-luminance)
        (let [output (hsl.hsluv_to_hex hsl-color)]
          output)))

;; FN -- brighten a hsluv color table
;; @tuple -- input color as a 3 value sequential table
;; @percent -- amount to adjust as a decimal percent
;; $output -- changed hex color
(defn hsluv-brighten [tuple percent] "Brighten a hsluv color by some percent"
      (let [hsl-color tuple
            luminance (- 100 (. hsl-color 3))
            input-luminance (let [mid-luminance (* (. hsl-color 3)
                                                   (+ 1 percent))]
                              (if (>= mid-luminance 100) 99.99 mid-luminance))]
        (tset hsl-color 3 input-luminance)
        (let [output (hsl.hsluv_to_hex hsl-color)]
          output)))

;; FN -- darken a hex color
;; @color -- input hex color
;; @percent -- amount to adjust as a decimal percent
;; $output -- changed hex color
(defn darken [color percent] "Darken a hex color by some percent"
      (let [hsl-color (hsl.hex_to_hsluv color)
            luminance (- 100 (. hsl-color 3))
            input-luminance (let [mid-luminance (* (. hsl-color 3)
                                                   (- 1 percent))]
                              (if (>= mid-luminance 100) 99.99 mid-luminance))]
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
                               (if (>= mid-saturation 100) 99.99
                                   (<= mid-saturation 0) 0.01
                                   mid-saturation))]
        (tset hsl-color 2 input-saturation)
        (let [output (hsl.hsluv_to_hex hsl-color)]
          output)))
