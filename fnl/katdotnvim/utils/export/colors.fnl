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
;;; Each color variation can have a description
;;; Naming: color_match, mix_color-a_color-b, color_saturation-amount
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
(set kat.pink.base {:desc "Base color, no changes applied" :color color*.pink})
(set kat.red.base {:desc "Base color, no changes applied" :color color*.red})
(set kat.blue.base {:desc "Base color, no changes applied" :color color*.blue})
(set kat.green.base {:desc "Base color, no changes applied" :color color*.green}) ; Note, use green_match_auto if you just need green
(set kat.purple.base {:desc "Base color, no changes applied" :color color*.purple})
(set kat.orange.base {:desc "Base color, no changes applied" :color color*.orange})
(set kat.fg.base {:desc "Base color, no changes applied" :color color*.f0})
(set kat.bg.base {:desc "Base color, no changes applied" :color color*.b0})

;; Set foreground variations
;; Naming: variation_fg
;; TODO: rename last two variations

(set kat.fg.umbra {:desc "Umbra/second color, lighter shadow variation" :color color*.f1})
(set kat.fg.shadow {:desc "Shadow/third color, used to contrast base fg" :color color*.f2})
(set kat.fg.meld {:desc "Meld/fourth, used to blend in with the base fg" :color color*.f3})
(set kat.fg.fifth {:desc  "5th bg color, dark for dark background and bright for light background"
                   :color color*.f4})
(set kat.fg.sixth {:desc "6th bg color, dark for dark background and bright for light background"
                   :color color*.f5})
(set kat.fg.auto {:desc "Auto matching color, used to always maintain bright color regardless of contrast" 
                  :color (if (and (= vim.o.background :dark) (= vim.o.background :soft))
                          (-> color*.f0
                              (ucolors.brighten 1))
                          color*.f0)})

;; Set background variations
;; Naming: variation_bg
;; TODO: rename last two variations

(set kat.bg.umbra {:desc "Umbra/second color, lighter shadow variation"  :color color*.b1})
(set kat.bg.shadow {:desc "Shadow/third color, used to contrast base bg"  :color color*.b2})
(set kat.bg.meld {:desc "Meld/fourth color, used to blend in with the base fg"  :color color*.b3})
(set kat.bg.fifth {:desc "5th bg color, bright for dark background and dark for light background"
                   :color color*.b4})
(set kat.bg.sixth {:desc "6th bg color, bright for dark background and dark for light background"
                      :color color*.b5})

;; Set color variations

;; Green that auto matches the background
;; Default green might not fit the background in use
;; This is the recommended green to use
(set kat.green.auto {:desc "Auto matching color, used to increase contrast depending on background" 
                     :color (if (= vim.o.background :light)
                              (-> color*.green
                                  (ucolors.darken 0.5)
                                  (ucolors.saturation 0.4))
                              (-> color*.green
                                  (ucolors.brighten 0.5)
                                  (ucolors.saturation -0.2)))})
;; Green match fg
(set kat.green.match_fg {:desc "Matches to base fg color" 
                         :color (ucolors.blend color*.green color*.f0 0.5)})
;; Green match bg
(set kat.green.match_bg {:desc "Matches to base bg color" 
                         :color (ucolors.blend color*.green color*.b0 0.5)})

;; Blue that auto matches the background and mixed with orange
;; For emphasis, not needed for contrast
(set kat.blue.mix_orange_match_fg {:desc "Mixes in orange, then matches to base fg color" 
                                   :color (-> color*.orange
                                           (ucolors.blend color*.f0 0.1)
                                           (ucolors.blend color*.blue 0.2))})
;; Darker blue
(set kat.blue.darker {:desc "Darkens color by 20%" :color (ucolors.darken color*.blue 0.2)})
;; Blue matched with fg
(set kat.blue.match_fg {:desc "Matches to base bg color" 
                        :color (ucolors.blend color*.blue color*.f0 0.5)})
;; Blue matched with bg
(set kat.blue.match_bg {:desc "Matches to base bg color" 
                        :color (ucolors.blend color*.blue color*.b0 0.5)})
;; Blue mixed with bg5
(set kat.blue.mix_bg6 {:desc "Mixes in 6th bg color" 
                       :color (ucolors.blend color*.blue color*.b5 0.65)})

;; Red matched with bg
;; In use for "Warning" groups
(set kat.red.match_bg {:desc "Matches to base bg color" 
                       :color (ucolors.blend color*.red color*.b0 0.7)})
;; Red matched with fg
(set kat.red.match_fg {:desc "Matches to base bg color" 
                       :color (ucolors.blend color*.red color*.f0 0.6)})

;; Purple matched with bg
(set kat.purple.match_bg {:desc "Matches to base bg color" 
                          :color (ucolors.blend color*.purple color*.b0 0.7)})
;; Purple matched with fg
(set kat.purple.match_fg {:desc "Matches to base bg color" 
                          :color (ucolors.blend color*.purple color*.f0 0.7)})
;; Purple mixed with pink
(set kat.purple.mix_pink {:desc "Mixes in pink"
                          :color (ucolors.blend color*.pink color*.purple 0.65)})

;; Orange matched with fg
(set kat.orange.match_fg {:desc "Matches to base bg color" 
                          :color (ucolors.blend color*.orange color*.f0 0.7)})
;; Orange matched with bg
(set kat.orange.match_bg {:desc "Matches to base bg color" 
                          :color (ucolors.blend color*.orange color*.b0 0.7)})

;; Pink matched with fg
(set kat.pink.match_fg {:desc "Matches to base bg color" 
                        :color (ucolors.blend color*.pink color*.f0 0.6)})
;; Pink matched with bg
(set kat.pink.match_bg {:desc "Matches to base bg color" 
                        :color (ucolors.blend color*.pink color*.b0 0.6)})
