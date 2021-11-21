(module katdotnvim.color
        {autoload {ucolors katdotnvim.utils.color
                   main katdotnvim.main
                   }})

; this file contains all the pre-defined colors

; define colors
(defn defineNormalColors []
  (def output
    {:red :#eb4949
     :green :#2ce0aa
     :orange :#f2b15c
     :pink :#f29cb1
     :purple :#7a53a8
     :blue :#2dacd2
     })
  output
  )


(defn defineBack []
  (var back {})
  ; back and foreground colors
  (when (= main.katStyle :dark)
    (do
      (when (= main.katContrast :soft)
        (set back
             {1 (ucolors.brighten "#121c2d" 0.1)
              2 "#121c2d"
              3 (ucolors.brighten "#121c2d" 0.3)
              4 (ucolors.brighten "#121c2d" 0.5)
              5 (ucolors.brighten "#121c2d" 0.7)
              6 (ucolors.brighten "#121c2d" 0.9)
              }))
      (when (= main.katContrast :hard)
        (set back
             {1 "#121c2d"
              2 (ucolors.brighten "#121c2d" 0.1)
              3 (ucolors.brighten "#121c2d" 0.3)
              4 (ucolors.brighten "#121c2d" 0.5)
              5 (ucolors.brighten "#121c2d" 0.7)
              6 (ucolors.brighten "#121c2d" 0.9)
              }))
      ))

  ; else if color is light
  (when (= main.katStyle :light)
    (do
      (when (= main.katContrast :soft)
        (set back
             {1 (ucolors.saturation (ucolors.darken "#daf6ff" 0.1) -0.5)
              2 "#daf6ff"
              3 (ucolors.saturation (ucolors.darken "#daf6ff" 0.3) -0.5)
              4 (ucolors.saturation (ucolors.darken "#daf6ff" 0.5) -0.5)
              5 (ucolors.saturation (ucolors.darken "#daf6ff" 0.7) -0.5)
              6 (ucolors.saturation (ucolors.darken "#daf6ff" 0.9) -0.5)
              }))
      (when (= main.katContrast :hard)
        (set back
             {1 "#daf6ff"
              2 (ucolors.saturation (ucolors.darken "#daf6ff" 0.1) -0.5)
              3 (ucolors.saturation (ucolors.darken "#daf6ff" 0.3) -0.5)
              4 (ucolors.saturation (ucolors.darken "#daf6ff" 0.5) -0.5)
              5 (ucolors.saturation (ucolors.darken "#daf6ff" 0.7) -0.5)
              6 (ucolors.saturation (ucolors.darken "#daf6ff" 0.9) -0.5)
              }))
      ))
  back
  )

(defn defineFore []
  (var fore {})
  (when (= main.katStyle :dark)
    (do
      (when (= main.katContrast :soft)
        (set fore
             {1 (ucolors.saturation (ucolors.darken "#daf6ff" 0.1) -0.5)
              2 "#daf6ff"
              3 (ucolors.saturation (ucolors.darken "#daf6ff" 0.3) -0.5)
              4 (ucolors.saturation (ucolors.darken "#daf6ff" 0.5) -0.5)
              5 (ucolors.saturation (ucolors.darken "#daf6ff" 0.7) -0.5)
              6 (ucolors.saturation (ucolors.darken "#daf6ff" 0.9) -0.5)
              }))
      (when (= main.katContrast :hard)
        (set fore
             {1 "#daf6ff"
              2 (ucolors.saturation (ucolors.darken "#daf6ff" 0.1) -0.5)
              3 (ucolors.saturation (ucolors.darken "#daf6ff" 0.3) -0.5)
              4 (ucolors.saturation (ucolors.darken "#daf6ff" 0.5) -0.5)
              5 (ucolors.saturation (ucolors.darken "#daf6ff" 0.7) -0.5)
              6 (ucolors.saturation (ucolors.darken "#daf6ff" 0.9) -0.5)
              }))
      ))

  (when (= main.katStyle :light)
    (do
      (when (= main.katContrast :soft)
        (set fore
             {1 (ucolors.brighten "#121c2d" 0.1)
              2 "#121c2d"
              3 (ucolors.brighten "#121c2d" 0.3)
              4 (ucolors.brighten "#121c2d" 0.5)
              5 (ucolors.brighten "#121c2d" 0.7)
              6 (ucolors.brighten "#121c2d" 0.9)
              }))
      (when (= main.katContrast :hard)
        (set fore
             {1 "#121c2d"
              2 (ucolors.brighten "#121c2d" 0.1)
              3 (ucolors.brighten "#121c2d" 0.3)
              4 (ucolors.brighten "#121c2d" 0.5)
              5 (ucolors.brighten "#121c2d" 0.7)
              6 (ucolors.brighten "#121c2d" 0.9)
              }))
      ))
  fore
  )

(defn init [table]
  (match table
    :normalColors (do
                    (defineNormalColors))
    :background (do
                  (defineBack))
    :foreground (do
                  (defineFore))))

(def normalColors (defineNormalColors))
(def background (defineBack))
(def foreground (defineFore))
