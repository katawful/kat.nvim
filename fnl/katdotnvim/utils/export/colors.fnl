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

;;; Output colors as table
;;; We use a mutable table instead of variables since def is a const
;;; Naming: color_letter, color-a_color-b_mix-amount, color_saturation-amount
;;; Color is color name, optional character is variant descriptor
;;; 'b': bright, 'd': dark. nothing is assumed neutral
;;; Number is brighter background, darker foreground in 20% luminance steps
;;; also note that '_' is used, for maximum Lua compatibility
(def kat {})

(tset kat :pink color*.pink)
(tset kat :red color*.red)
(tset kat :blue color*.blue)
(tset kat :green color*.green)
(tset kat :purple color*.purple)
(tset kat :orange color*.orange)
(tset kat :fg color*.f1)
(tset kat :bg color*.b1)
