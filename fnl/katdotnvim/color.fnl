(module katdotnvim.color
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   main katdotnvim.main}})

;;; This stores and exports all needed colors as functions

;; private values that hold the colors we want
;; only these need to be changed
;; foreground and background can change, simply set the light and dark you want
(def- light-fore-back "#daf6ff")
(def- dark-fore-back "#121c2d")

(def- red-primary "#eb4949")
(def- green-primary "#2ce0aa")
(def- orange-primary "#f2b15c")
(def- pink-primary "#f29cb1")
(def- purple-primary "#7a53a8")
(def- blue-primary "#2dacd2")

;; FN -- Define a table of primary colors
(defn- def-normal-colors [] "A table of regular color"
       (let [output {:red red-primary
                     :green green-primary
                     :orange orange-primary
                     :pink pink-primary
                     :purple purple-primary
                     :blue blue-primary}]
         output))

;; FN -- Define a table of background colors based on the current theme
(defn- def-back-colors [] "A table of background colors"
       (let [back (if (= (. main.background-mut 1) :dark)
                      (if (= (. main.contrast-mut 1) :soft)
                          [(ucolors.brighten dark-fore-back 0.1)
                           dark-fore-back
                           (ucolors.brighten dark-fore-back 0.3)
                           (ucolors.brighten dark-fore-back 0.5)
                           (ucolors.brighten dark-fore-back 0.7)
                           (ucolors.brighten dark-fore-back 0.9)]
                          (or (= (. main.contrast-mut 1) :hard)
                              (= (. main.contrast-mut 1) nil))
                          [dark-fore-back
                           (ucolors.brighten dark-fore-back 0.1)
                           (ucolors.brighten dark-fore-back 0.3)
                           (ucolors.brighten dark-fore-back 0.5)
                           (ucolors.brighten dark-fore-back 0.7)
                           (ucolors.brighten dark-fore-back 0.9)])
                      (= (. main.background-mut 1) :light)
                      (if (= (. main.contrast-mut 1) :soft)
                          [(-> light-fore-back
                               (ucolors.darken 0.1)
                               (ucolors.saturation -0.5))
                           light-fore-back
                           (-> light-fore-back
                               (ucolors.darken 0.3)
                               (ucolors.saturation -0.5))
                           (-> light-fore-back
                               (ucolors.darken 0.5)
                               (ucolors.saturation -0.5))
                           (-> light-fore-back
                               (ucolors.darken 0.7)
                               (ucolors.saturation -0.5))
                           (-> light-fore-back
                               (ucolors.darken 0.9)
                               (ucolors.saturation -0.5))]
                          (or (= (. main.contrast-mut 1) :hard)
                              (= (. main.contrast-mut 1) nil))
                          [light-fore-back
                           (-> light-fore-back
                               (ucolors.darken 0.1)
                               (ucolors.saturation -0.5))
                           (-> light-fore-back
                               (ucolors.darken 0.3)
                               (ucolors.saturation -0.5))
                           (-> light-fore-back
                               (ucolors.darken 0.5)
                               (ucolors.saturation -0.5))
                           (-> light-fore-back
                               (ucolors.darken 0.7)
                               (ucolors.saturation -0.5))
                           (-> light-fore-back
                               (ucolors.darken 0.9)
                               (ucolors.saturation -0.5))]))]
         back))

;; FN -- Define a table of background colors based on the current theme
(defn- def-fore-colors [] "A table of foreground colors"
       (let [fore (if (= (. main.background-mut 1) :dark)
                      (if (= (. main.contrast-mut 1) :soft)
                          [(-> light-fore-back
                               (ucolors.darken 0.1)
                               (ucolors.saturation -0.5))
                           light-fore-back
                           (-> light-fore-back
                               (ucolors.darken 0.3)
                               (ucolors.saturation -0.5))
                           (-> light-fore-back
                               (ucolors.darken 0.5)
                               (ucolors.saturation -0.5))
                           (-> light-fore-back
                               (ucolors.darken 0.7)
                               (ucolors.saturation -0.5))
                           (-> light-fore-back
                               (ucolors.darken 0.9)
                               (ucolors.saturation -0.5))]
                          (or (= (. main.contrast-mut 1) :hard)
                              (= (. main.contrast-mut 1) nil))
                          [light-fore-back
                           (-> light-fore-back
                               (ucolors.darken 0.1)
                               (ucolors.saturation -0.5))
                           (-> light-fore-back
                               (ucolors.darken 0.3)
                               (ucolors.saturation -0.5))
                           (-> light-fore-back
                               (ucolors.darken 0.5)
                               (ucolors.saturation -0.5))
                           (-> light-fore-back
                               (ucolors.darken 0.7)
                               (ucolors.saturation -0.5))
                           (-> light-fore-back
                               (ucolors.darken 0.9)
                               (ucolors.saturation -0.5))])
                      (= (. main.background-mut 1) :light)
                      (if (= (. main.contrast-mut 1) :soft)
                          [(ucolors.brighten dark-fore-back 0.1)
                           dark-fore-back
                           (ucolors.brighten dark-fore-back 0.3)
                           (ucolors.brighten dark-fore-back 0.5)
                           (ucolors.brighten dark-fore-back 0.7)
                           (ucolors.brighten dark-fore-back 0.9)]
                          (or (= (. main.contrast-mut 1) :hard)
                              (= (. main.contrast-mut 1) nil))
                          [dark-fore-back
                           (ucolors.brighten dark-fore-back 0.1)
                           (ucolors.brighten dark-fore-back 0.3)
                           (ucolors.brighten dark-fore-back 0.5)
                           (ucolors.brighten dark-fore-back 0.7)
                           (ucolors.brighten dark-fore-back 0.9)]))]
         fore))

;; FN -- specify which color
(defn init [table] (match table
                     :normalColors (do
                                     (def-normal-colors))
                     :background (do
                                   (def-back-colors))
                     :foreground (do
                                   (def-fore-colors))))

;; Call specific color tables
(defn normal-colors [] (def-normal-colors))

(defn background [] (def-back-colors))

(defn foreground [] (def-fore-colors))

;;; Handles outputting various colors

;;; Output colors as table
;;; We use a mutable table instead of variables since def is a const
;;; Each color variation can have a description
;;; Naming: color.match, color.mix_color-b, color.saturation-amount
;;; '_' is used, for maximum Lua compatibility
(def kat {:pink {}
          :red {}
          :blue {}
          :green {}
          :purple {}
          :orange {}
          :teal {}
          :plum {}
          :fg {}
          :bg {}})

(defn update [] ;;; Set base colors and fg/bg
      ;; Key -- key value table that holds all colors from the color table for easy access
      ;; values are:
      ;; red, blue, green, pink, orange, purple, pink
      ;; f1-f6, b1-b6
      (var color* (let [normal-colors (def-normal-colors)
                        foreground (def-back-colors)
                        background (def-fore-colors)
                        output {}]
                    (each [k v (pairs normal-colors)]
                      (tset output k v))
                    (for [i 1 6]
                      (tset output (.. :f (- i 1)) (. foreground i))
                      (tset output (.. :b (- i 1)) (. background i)))
                    output))
      (set kat.pink.base {:desc "Base color, no changes applied"
                          :color color*.pink})
      (set kat.red.base {:desc "Base color, no changes applied"
                         :color color*.red})
      (set kat.blue.base {:desc "Base color, no changes applied"
                          :color color*.blue})
      ;; Note, use green_match_auto if you just need green
      (set kat.green.base {:desc "Base color, no changes applied"
                           :color color*.green})
      (set kat.purple.base {:desc "Base color, no changes applied"
                            :color color*.purple})
      (set kat.orange.base {:desc "Base color, no changes applied"
                            :color color*.orange})
      (set kat.fg.base {:desc "Base color, no changes applied"
                        :color color*.f0})
      (set kat.bg.base {:desc "Base color, no changes applied"
                        :color color*.b0}) ;;; Set foreground variations
      ;; Naming: variation_fg
      (set kat.fg.umbra {:desc "Umbra/second color, lighter shadow variation"
                         :color color*.f1})
      (set kat.fg.shadow {:desc "Shadow/third color, used to contrast base fg"
                          :color color*.f2})
      (set kat.fg.meld {:desc "Meld/fourth, used to blend in with the base fg"
                        :color color*.f3})
      (set kat.fg.fifth {:desc "5th bg color, dark for dark background and bright for light background"
                         :color color*.f4})
      (set kat.fg.sixth {:desc "6th bg color, dark for dark background and bright for light background"
                         :color color*.f5})
      (set kat.fg.auto {:desc "Auto matching color, used to always maintain bright color regardless of contrast"
                        :color (if (and (= (. main.background-mut 1) :dark)
                                        (= (. main.contrast-mut 1) :soft))
                                   (-> color*.f0
                                       (ucolors.brighten 1))
                                   color*.f0)})
      ;;; Set background variations
      ;; Naming: variation_bg
      (set kat.bg.umbra {:desc "Umbra/second color, lighter shadow variation"
                         :color color*.b1})
      (set kat.bg.shadow {:desc "Shadow/third color, used to contrast base bg"
                          :color color*.b2})
      (set kat.bg.meld {:desc "Meld/fourth color, used to blend in with the base fg"
                        :color color*.b3})
      (set kat.bg.fifth {:desc "5th bg color, bright for dark background and dark for light background"
                         :color color*.b4})
      (set kat.bg.sixth {:desc "6th bg color, bright for dark background and dark for light background"
                         :color color*.b5}) ;;; Set color variations
      ;;; Green
      ;; Green that auto matches the background
      ;; Default green might not fit the background in use
      ;; This is the recommended green to use
      (set kat.green.auto
           {:desc "Auto matching color, used to increase contrast depending on background"
            :color (if (= (. main.background-mut 1) :light)
                       (-> color*.green
                           (ucolors.darken 0.5)
                           (ucolors.saturation 0.4))
                       (-> color*.green
                           (ucolors.brighten 0.5)
                           (ucolors.saturation -0.2)))}) ;; Green match fg
      (set kat.green.match_fg
           {:desc "Matches to base fg color"
            :color (ucolors.blend color*.green color*.f0 0.5)})
      ;; Green match bg
      (set kat.green.match_bg
           {:desc "Matches to base bg color"
            :color (ucolors.blend color*.green color*.b0 0.5)})
      ;; Green mix blue
      (set kat.green.mix_blue
           {:desc "Mixes in blue"
            :color (ucolors.blend color*.green color*.blue 0.5)})
      ;; Green mix red
      (set kat.green.mix_red
           {:desc "Mixes in red"
            :color (ucolors.blend color*.green color*.red 0.2)})
      ;; Green mix purple
      (set kat.green.mix_purple
           {:desc "Mixes in purple"
            :color (-> color*.green
                       (ucolors.blend color*.purple 0.3)
                       (ucolors.saturation 0.8))}) ;;; Blue
      ;; Blue that auto matches the background and mixed with orange
      ;; For emphasis, not needed for contrast
      (set kat.blue.mix_orange_match_fg
           {:desc "Mixes in orange, then matches to base fg color"
            :color (-> color*.orange
                       (ucolors.blend color*.f0 0.1)
                       (ucolors.blend color*.blue 0.2))}) ;; Darker blue
      (set kat.blue.darker
           {:desc "Darkens color by 20%"
            :color (ucolors.darken color*.blue 0.2)})
      ;; Blue matched with fg
      (set kat.blue.match_fg
           {:desc "Matches to base fg color"
            :color (ucolors.blend color*.blue color*.f0 0.5)})
      ;; Blue matched with bg
      (set kat.blue.match_bg
           {:desc "Matches to base bg color"
            :color (ucolors.blend color*.blue color*.b0 0.5)}) ;;; Teal
      (let [teal (ucolors.blend color*.blue color*.b5 0.65)]
        ;; Base color
        (set kat.teal.base {:desc "Base color, is a mix of blue and sixth background"
                            :color teal})
        ;; Teal matched to fg
        (set kat.teal.auto
             {:desc "Auto matches based on background"
              :color (if (= (. main.background-mut 1) :light)
                         (-> teal
                             (ucolors.blend color*.f5 0.5)
                             (ucolors.darken 0.4))
                         (-> teal
                             (ucolors.blend color*.f5 0.5)
                             (ucolors.brighten 0.4)))})
        ;; Teal mix purple
        (set kat.teal.mix_purple
             {:desc "Mixes in purple"
              :color (-> teal
                         (ucolors.blend color*.purple 0.2)
                         (ucolors.brighten 0.2))})
        ;; Teal mix red
        (set kat.teal.mix_red
             {:desc "Mixes in red"
              :color (-> teal
                         (ucolors.blend color*.red 0.3))})
        ;; Teal mix red, brighten
        (set kat.teal.mix_red_brighten
             {:desc "Mixes in red, brightens"
              :color (-> teal
                         (ucolors.blend color*.red 0.3)
                         (ucolors.brighten 0.1)
                         (ucolors.saturation 0.1))})
        ;; Teal mix pink
        (set kat.teal.mix_pink
             {:desc "Mixes in pink"
              :color (-> teal
                         (ucolors.blend color*.pink 0.8))})
        ;; Teal mix pink
        (set kat.teal.mix_pink
             {:desc "Mixes in pink"
              :color (-> teal
                         (ucolors.blend color*.pink 0.8))})
        ;; Teal mix shadow fg
        (set kat.teal.mix_shadow_fg
             {:desc "Mixes in shadow fg"
              :color (-> teal
                         (ucolors.blend color*.f2 0.8)
                         (ucolors.darken 0.2))})
        ;; Teal mix green
        (if (= (. main.background-mut 1) :light)
            (set kat.teal.mix_green
                 {:desc "Mixes in green, matches background"
                  :color (if (= (. main.background-mut 1) :light)
                             (-> teal
                                 (ucolors.blend color*.green 0.3)
                                 (ucolors.darken 0.4))
                             (-> teal
                                 (ucolors.blend color*.green 0.3)
                                 (ucolors.brighten 0.2)))}))) ;;; Red
      ;; Red matched with bg
      ;; In use for "Warning" groups
      (set kat.red.match_bg
           {:desc "Matches to base bg color"
            :color (ucolors.blend color*.red color*.b0 0.7)})
      ;; Red matched with fg
      (set kat.red.match_fg
           {:desc "Matches to base bg color"
            :color (ucolors.blend color*.red color*.f0 0.6)})
      ;; Red mix red
      (set kat.red.mix_red
           {:desc "Mixes in red"
            :color (-> color*.red
                       (ucolors.blend color*.red 0.2)
                       (ucolors.brighten 0.1))}) ;; Red mix orange
      (set kat.red.mix_orange
           {:desc "Mixes in orange"
            :color (-> color*.red
                       (ucolors.blend color*.orange 0.2)
                       (ucolors.brighten 0.3)
                       (ucolors.saturation 0.8))}) ;; Red mix pink
      (set kat.red.mix_pink
           {:desc "Mixes in pink"
            :color (-> color*.red
                       (ucolors.blend color*.pink 0.2)
                       (ucolors.saturation 1))}) ;; Red mix meld fg
      (set kat.red.mix_meld_fg
           {:desc "Mixes in meld fg color"
            :color (-> color*.red
                       (ucolors.blend color*.f3 0.2))}) ;; Red mix green
      (set kat.red.mix_green
           {:desc "Mixes in green, matches to background"
            :color (if (= (. main.background-mut 1) :light)
                       (-> color*.red
                           (ucolors.blend color*.green 0.2)
                           (ucolors.darken 0.5))
                       (-> color*.red
                           (ucolors.blend color*.green 0.2)
                           (ucolors.brighten 0.5)))}) ;; Red mix blue
      (set kat.red.mix_blue
           {:desc "Mixes in blue"
            :color (-> color*.red
                       (ucolors.blend color*.blue 0.1)
                       (ucolors.brighten 0.2))}) ;; Red darken
      (set kat.red.darken
           {:desc "Darkens red" :color (ucolors.darken color*.red 0.2)})
      ;;; Purple
      ;; Purple matched with bg
      (set kat.purple.match_bg
           {:desc "Matches to base bg color"
            :color (ucolors.blend color*.purple color*.b0 0.7)})
      ;; Purple matched with fg
      (set kat.purple.match_fg
           {:desc "Matches to base bg color"
            :color (ucolors.blend color*.purple color*.f0 0.7)}) ;;; Plum
      ;; Purple mixed with pink
      (let [plum (ucolors.blend color*.pink color*.purple 0.65)]
        (set kat.plum.base {:desc "Base color, mixes purple and pink"
                            :color plum})
        ;; Plum match fg
        (set kat.plum.match_fg
             {:desc "Matches to base fg color"
              :color (ucolors.blend plum color*.f0 0.8)})
        ;; Plum mix red
        (set kat.plum.mix_red
             {:desc "Mixes in red" :color (ucolors.blend plum color*.red 0.2)})
        ;; Plum mix meld bg
        (set kat.plum.mix_meld_bg
             {:desc "Mixes in meld bg"
              :color (ucolors.blend plum color*.b3 0.2)})
        ;; Plum mix green
        (set kat.plum.mix_green
             {:desc "Mixes in green"
              :color (ucolors.blend plum color*.green 0.2)})) ;;; Orange
      ;; Orange matched with fg
      (set kat.orange.match_fg
           {:desc "Matches to base bg color"
            :color (ucolors.blend color*.orange color*.f0 0.7)})
      ;; Orange matched with bg
      (set kat.orange.match_bg
           {:desc "Matches to base bg color"
            :color (ucolors.blend color*.orange color*.b0 0.7)})
      ;; Orange mix green
      (set kat.orange.mix_green
           {:desc "Mixes in green"
            :color (ucolors.blend color*.orange color*.green 0.2)})
      ;; Orange mix blue
      (set kat.orange.mix_blue
           {:desc "Mixes in blue"
            :color (ucolors.blend color*.orange color*.blue 0.2)})
      ;; Orange mix sixth bg
      (set kat.orange.mix_sixth_bg
           {:desc "Mixes in sixth bg"
            :color (-> color*.orange
                       (ucolors.blend color*.b5 0.2)
                       (ucolors.saturation 1))}) ;; Orange mix red
      (set kat.orange.mix_red
           {:desc "Mixes in red"
            :color (ucolors.blend color*.orange color*.red 0.4)}) ;;; Pink
      ;; Pink matched with fg
      (set kat.pink.match_fg
           {:desc "Matches to base bg color"
            :color (ucolors.blend color*.pink color*.f0 0.6)})
      ;; Pink matched with bg
      (set kat.pink.match_bg
           {:desc "Matches to base bg color"
            :color (ucolors.blend color*.pink color*.b0 0.6)})
      ;; Pink mix red
      (set kat.pink.mix_red
           {:desc "Mixes in red"
            :color (ucolors.blend color*.pink color*.red 0.2)})
      ;; Pink mix blue
      (set kat.pink.mix_blue
           {:desc "Mixes in blue"
            :color (ucolors.blend color*.pink color*.blue 0.2)})
      ;; Pink mix purple
      (set kat.pink.mix_purple
           {:desc "Mixes in purple"
            :color (ucolors.blend color*.pink color*.purple 0.2)})
      ;; Pink mix green
      (set kat.pink.mix_green
           {:desc "Mixes in green"
            :color (ucolors.blend color*.pink color*.green 0.2)})
      ;; Pink mix teal
      (let [teal (ucolors.blend color*.blue color*.b5 0.65)]
        (set kat.pink.mix_teal
             {:desc "Mixes in teal"
              :color (ucolors.blend color*.pink teal 0.2)}))
      ;; Pink mix meld fg
      (set kat.pink.mix_meld_fg
           {:desc "Mix meld fg"
            :color (ucolors.blend color*.pink color*.f3 0.2)})
      ;; Pink mix meld bg
      (set kat.pink.mix_meld_bg
           {:desc "Mix meld bg"
            :color (ucolors.blend color*.pink color*.b3 0.2)})
      ;; Pink mix sixth bg
      (set kat.pink.mix_sixth_bg
           {:desc "Mix sixth bg"
            :color (ucolors.blend color*.pink color*.b5 0.2)}))

(update)
