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
(tset kat.fg :auto (if (and (= vim.o.background :dark) (= vim.o.background :soft))
                     (-> color*.f0
                         (ucolors.brighten 1))
                     color*.f0))

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
;; Green match fg
(tset kat.green :match_fg (ucolors.blend color*.green color*.f0))
;; Green match bg
(tset kat.green :match_bg (ucolors.blend color*.green color*.b0))

;; Blue that auto matches the background and mixed with orange
;; For emphasis, not needed for contrast
(tset kat.blue :mix_orange_match_fg (-> color*.orange
                                       (ucolors.blend color*.f0 0.1)
                                       (ucolors.blend color*.blue 0.2)))
;; Darker blue
(tset kat.blue :darker (ucolors.darken color*.blue 0.2))
;; Blue matched with fg
(tset kat.blue :match_fg (ucolors.blend color*.blue color*.f0 0.5))
;; Blue matched with bg
(tset kat.blue :match_bg (ucolors.blend color*.blue color*.b0 0.5))

;; Red matched with bg
;; In use for "Warning" groups
(tset kat.red :match_bg (ucolors.blend color*.red color*.b0 0.7))
;; Red matched with fg
(tset kat.red :match_fg (ucolors.blend color*.red color*.f0 0.6))

;; Purple matched with bg
(tset kat.purple :match_bg (ucolors.blend color*.purple color*.b0 0.7))
;; Purple matched with fg
(tset kat.purple :match_fg (ucolors.blend color*.purple color*.f0 0.7))

;; Orange matched with fg
(tset kat.orange :match_fg (ucolors.blend color*.orange color*.f0 0.7))
;; Orange matched with bg
(tset kat.orange :match_bg (ucolors.blend color*.orange color*.b0 0.7))

;; Pink matched with fg
(tset kat.pink :match_fg (ucolors.blend color*.pink color*.f0 0.6))
;; Pink matched with bg
(tset kat.pink :match_bg (ucolors.blend color*.pink color*.b0 0.6))

(print (vim.inspect kat))
