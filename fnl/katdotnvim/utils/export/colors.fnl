(module katdotnvim.utils.export.colors
  {autoload {colors katdotnvim.color
             ucolors katdotnvim.utils.highlight.utils}})


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
;;; Naming: color_match, color-a_color-b_mix-amount, color_saturation-amount
;;; Number is brighter background, darker foreground in 20% luminance steps
;;; also note that '_' is used, for maximum Lua compatibility
(def kat {:pink {}
          :red {}
          :blue {}
          :green {}
          :purple {}
          :orange {}
          :fg {}
          :bg {}})

;; Set base colors and fg/bg
(tset kat.pink :base color*.pink)
(tset kat.red :base color*.red)
(tset kat.blue :base color*.blue)
(tset kat.green :base color*.green) ; Note, use green_match_auto if you just need green
(tset kat.purple :base color*.purple)
(tset kat.orange :base color*.orange)
(tset kat.fg :base color*.f0)
(tset kat.bg :base color*.b0)

;; Set foreground variations
;; Naming: variation_fg
;; TODO: rename last two variations

(tset kat.fg :umbra color*.f1)
(tset kat.fg :shadow color*.f2)
(tset kat.fg :meld color*.f3)
(tset kat.fg :BADNAME4 color*.f4)
(tset kat.fg :BADNAME5 color*.f5)

;; Set background variations
;; Naming: variation_bg
;; TODO: rename last two variations

(tset kat.bg :umbra color*.b1)
(tset kat.bg :shadow color*.b2)
(tset kat.bg :meld color*.b3)
(tset kat.bg :BADNAME4 color*.b4)
(tset kat.bg :BADNAME5 color*.b5)

;; Set color variations

;; Green that auto matches the background
;; Default green might not fit the background in use
;; This is the recommended green to use
(tset kat.green :auto (if (= vim.o.background :light)
                        (-> color*.green
                            (ucolors.darken 0.5)
                            (ucolors.saturation 0.4))
                        (-> color*.green
                            (ucolors.brighten 0.5)
                            (ucolors.saturation -0.2))))

;; Blue that auto matches the background
;; For emphasis, not needed for contrast
(tset kat.blue :match_fg (-> color*.orange
                            (ucolors.blend color*.f0 0.1)
                            (ucolors.blend color*.blue 0.2)))

;; Darker blue
(tset kat.blue :darker (ucolors.darken color*.blue 0.2))

;; Purple matched with bg
;; In use for "Warning" groups
(tset kat.red :match_bg (ucolors.blend color*.red color*.b0 0.7))

;; Purple matched with bg
(tset kat.purple :match_bg (ucolors.blend color*.purple color*.b0 0.7))
