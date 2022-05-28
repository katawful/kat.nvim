(module katdotnvim.color
        {autoload {ucolors katdotnvim.utils.color main katdotnvim.main}})

;;; This stores and exports all needed colors as functions

;; private values that hold the colors we want
;; only these need to be changed
;; foreground and background can change, simply set the light and dark you want
(def- light-fore-back "#121c2d")
(def- dark-fore-back "#daf6ff")

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
       (let [back (if (= vim.o.background :dark)
                      (if (= main.contrast :soft)
                          [(ucolors.brighten light-fore-back 0.1)
                           light-fore-back
                           (ucolors.brighten light-fore-back 0.3)
                           (ucolors.brighten light-fore-back 0.5)
                           (ucolors.brighten light-fore-back 0.7)
                           (ucolors.brighten light-fore-back 0.9)]
                          (or (= main.contrast :hard) (= main.contrast nil))
                          [light-fore-back
                           (ucolors.brighten light-fore-back 0.1)
                           (ucolors.brighten light-fore-back 0.3)
                           (ucolors.brighten light-fore-back 0.5)
                           (ucolors.brighten light-fore-back 0.7)
                           (ucolors.brighten light-fore-back 0.9)])
                      (= vim.o.background :light)
                      (if (= main.contrast :soft)
                          [(-> dark-fore-back
                               (ucolors.darken 0.1)
                               (ucolors.saturation -0.5))
                           dark-fore-back
                           (-> dark-fore-back
                               (ucolors.darken 0.3)
                               (ucolors.saturation -0.5))
                           (-> dark-fore-back
                               (ucolors.darken 0.5)
                               (ucolors.saturation -0.5))
                           (-> dark-fore-back
                               (ucolors.darken 0.7)
                               (ucolors.saturation -0.5))
                           (-> dark-fore-back
                               (ucolors.darken 0.9)
                               (ucolors.saturation -0.5))]
                          (or (= main.contrast :hard) (= main.contrast nil))
                          [dark-fore-back
                           (-> dark-fore-back
                               (ucolors.darken 0.1)
                               (ucolors.saturation -0.5))
                           (-> dark-fore-back
                               (ucolors.darken 0.3)
                               (ucolors.saturation -0.5))
                           (-> dark-fore-back
                               (ucolors.darken 0.5)
                               (ucolors.saturation -0.5))
                           (-> dark-fore-back
                               (ucolors.darken 0.7)
                               (ucolors.saturation -0.5))
                           (-> dark-fore-back
                               (ucolors.darken 0.9)
                               (ucolors.saturation -0.5))]))]
         back))

;; FN -- Define a table of background colors based on the current theme
(defn- def-fore-colors [] "A table of foreground colors"
       (let [fore (if (= vim.o.background :dark)
                      (if (= main.contrast :soft)
                          [(-> dark-fore-back
                               (ucolors.darken 0.1)
                               (ucolors.saturation -0.5))
                           dark-fore-back
                           (-> dark-fore-back
                               (ucolors.darken 0.3)
                               (ucolors.saturation -0.5))
                           (-> dark-fore-back
                               (ucolors.darken 0.5)
                               (ucolors.saturation -0.5))
                           (-> dark-fore-back
                               (ucolors.darken 0.7)
                               (ucolors.saturation -0.5))
                           (-> dark-fore-back
                               (ucolors.darken 0.9)
                               (ucolors.saturation -0.5))]
                          (or (= main.contrast :hard) (= main.contrast nil))
                          [dark-fore-back
                           (-> dark-fore-back
                               (ucolors.darken 0.1)
                               (ucolors.saturation -0.5))
                           (-> dark-fore-back
                               (ucolors.darken 0.3)
                               (ucolors.saturation -0.5))
                           (-> dark-fore-back
                               (ucolors.darken 0.5)
                               (ucolors.saturation -0.5))
                           (-> dark-fore-back
                               (ucolors.darken 0.7)
                               (ucolors.saturation -0.5))
                           (-> dark-fore-back
                               (ucolors.darken 0.9)
                               (ucolors.saturation -0.5))])
                      (= vim.o.background :light)
                      (if (= main.contrast :soft)
                          [(ucolors.brighten light-fore-back 0.1)
                           light-fore-back
                           (ucolors.brighten light-fore-back 0.3)
                           (ucolors.brighten light-fore-back 0.5)
                           (ucolors.brighten light-fore-back 0.7)
                           (ucolors.brighten light-fore-back 0.9)]
                          (or (= main.contrast :hard) (= main.contrast nil))
                          [light-fore-back
                           (ucolors.brighten light-fore-back 0.1)
                           (ucolors.brighten light-fore-back 0.3)
                           (ucolors.brighten light-fore-back 0.5)
                           (ucolors.brighten light-fore-back 0.7)
                           (ucolors.brighten light-fore-back 0.9)]))]
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
