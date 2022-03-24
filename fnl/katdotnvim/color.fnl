(module katdotnvim.color
  {autoload {ucolors katdotnvim.utils.color
             main katdotnvim.main}})

; this file contains all the pre-defined colors

; private values that hold the colors we want
; only these need to be changed

; foreground and background can change, simply set the light and dark you want
(def- lightForeBack "#121c2d")
(def- darkForeBack "#daf6ff")

(def- redPrimary :#eb4949)
(def- greenPrimary :#2ce0aa)
(def- orangePrimary :#f2b15c)
(def- pinkPrimary :#f29cb1)
(def- purplePrimary :#7a53a8)
(def- bluePrimary :#2dacd2)

; This defines and outputs a table of primary colors
(defn- defineNormalColors []
  (local output {:red redPrimary
                 :green greenPrimary
                 :orange orangePrimary
                 :pink pinkPrimary
                 :purple purplePrimary
                 :blue bluePrimary})
  output)

; This defines and outputs a table of background colors dependent upon the current theme
(defn- defineBack []
  (var back {})
  ; back and foreground colors
  (when (= vim.o.background :dark)
    (do (when (= main.katContrast :soft)
          (set back {1 (ucolors.brighten lightForeBack 0.1)
                     2 lightForeBack
                     3 (ucolors.brighten lightForeBack 0.3)
                     4 (ucolors.brighten lightForeBack 0.5)
                     5 (ucolors.brighten lightForeBack 0.7)
                     6 (ucolors.brighten lightForeBack 0.9)}))
      (when (or (= main.katContrast :hard)
                (= main.katContrast nil))
        (set back {1 lightForeBack
                   2 (ucolors.brighten lightForeBack 0.1)
                   3 (ucolors.brighten lightForeBack 0.3)
                   4 (ucolors.brighten lightForeBack 0.5)
                   5 (ucolors.brighten lightForeBack 0.7)
                   6 (ucolors.brighten lightForeBack 0.9)}))))

  ; else if color is light
  (when (= vim.o.background :light)
    (do (when (= main.katContrast :soft)
          (set back {1 (ucolors.saturation (ucolors.darken darkForeBack 0.1) -0.5)
                     2 darkForeBack
                     3 (ucolors.saturation (ucolors.darken darkForeBack 0.3) -0.5)
                     4 (ucolors.saturation (ucolors.darken darkForeBack 0.5) -0.5)
                     5 (ucolors.saturation (ucolors.darken darkForeBack 0.7) -0.5)
                     6 (ucolors.saturation (ucolors.darken darkForeBack 0.9) -0.5)}))
      (when (= main.katContrast :hard)
        (set back {1 darkForeBack
                   2 (ucolors.saturation (ucolors.darken darkForeBack 0.1) -0.5)
                   3 (ucolors.saturation (ucolors.darken darkForeBack 0.3) -0.5)
                   4 (ucolors.saturation (ucolors.darken darkForeBack 0.5) -0.5)
                   5 (ucolors.saturation (ucolors.darken darkForeBack 0.7) -0.5)
                   6 (ucolors.saturation (ucolors.darken darkForeBack 0.9) -0.5)}))))
  back)

; This defines and outputs a table of foreground colors dependent upon the current theme
(defn- defineFore []
  (var fore {})
  (when (= vim.o.background :dark)
    (do (when (= main.katContrast :soft)
          (set fore {1 (ucolors.saturation (ucolors.darken darkForeBack 0.1) -0.5)
                     2 darkForeBack
                     3 (ucolors.saturation (ucolors.darken darkForeBack 0.3) -0.5)
                     4 (ucolors.saturation (ucolors.darken darkForeBack 0.5) -0.5)
                     5 (ucolors.saturation (ucolors.darken darkForeBack 0.7) -0.5)
                     6 (ucolors.saturation (ucolors.darken darkForeBack 0.9) -0.5)}))
      (when (= main.katContrast :hard)
        (set fore {1 darkForeBack
                   2 (ucolors.saturation (ucolors.darken darkForeBack 0.1) -0.5)
                   3 (ucolors.saturation (ucolors.darken darkForeBack 0.3) -0.5)
                   4 (ucolors.saturation (ucolors.darken darkForeBack 0.5) -0.5)
                   5 (ucolors.saturation (ucolors.darken darkForeBack 0.7) -0.5)
                   6 (ucolors.saturation (ucolors.darken darkForeBack 0.9) -0.5)}))))

  (when (= vim.o.background :light)
    (do (when (= main.katContrast :soft)
          (set fore {1 (ucolors.brighten lightForeBack 0.1)
                     2 lightForeBack
                     3 (ucolors.brighten lightForeBack 0.3)
                     4 (ucolors.brighten lightForeBack 0.5)
                     5 (ucolors.brighten lightForeBack 0.7)
                     6 (ucolors.brighten lightForeBack 0.9)}))
      (when (= main.katContrast :hard)
        (set fore {1 lightForeBack
                   2 (ucolors.brighten lightForeBack 0.1)
                   3 (ucolors.brighten lightForeBack 0.3)
                   4 (ucolors.brighten lightForeBack 0.5)
                   5 (ucolors.brighten lightForeBack 0.7)
                   6 (ucolors.brighten lightForeBack 0.9)}))))
  fore)

(defn init [table]
  (match table
    :normalColors (do (defineNormalColors))
    :background (do (defineBack))
    :foreground (do (defineFore))))

(defn normal-colors []
  (defineNormalColors))

(defn background []
  (defineBack))

(defn foreground []
  (defineFore))
