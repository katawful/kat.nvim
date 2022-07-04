(module katdotnvim.utils.export.colors
  {autoload {colors katdotnvim.color}})


;;; Handles getting various colors from the main color file

;; Key -- key value table that holds all colors from the color table for easy access
;; values are:
;; red, blue, green, pink, orange, purple, pink
;; f1-f6, b1-b6
(def- color* (let [normal-colors (colors.normal-colors)
                   foreground (colors.foreground)
                   background (colors.background)
                   output {}]
              (each [k v (pairs normal-colors)]
                (tset output k v))
              (for [i 1 6]
                (tset output (.. "f" (- i 1)) (. foreground  i))
                (tset output (.. "b" (- i 1)) (. background  i)))
              output))

;;; Output colors
;;; Naming: color_letter, color-a_color-b_mix-amount, color_saturation-amount
;;; Color is color name, optional character is variant descriptor
;;; 'b': bright, 'd': dark. nothing is assumed neutral
;;; Number is brighter background, darker foreground in 20% luminance steps
;;; also note that '_' is used, for maximum Lua compatibility

(def pink color*.pink)
(def red color*.red)
(def blue color*.blue)
(def green color*.green)
(def purple color*.purple)
(def orange color*.orange)
(def fg color*.f1)
(def bg color*.b1)
