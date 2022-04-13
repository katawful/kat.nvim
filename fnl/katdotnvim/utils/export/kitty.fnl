(module katdotnvim.utils.export.kitty
  {autoload {hsl externals.hsluv
             ucolors katdotnvim.utils.color
             colors katdotnvim.color
             groups katdotnvim.highlights.main
             main katdotnvim.main
             export katdotnvim.utils.export.init
             errors katdotnvim.utils.errors
             a aniseed.core}})

;;; This module exports the 16 colors for kitty

;; require vim.loop
(def- loop vim.loop)

(def comment-type "#")

;; FN -- generates a table of colors for kitty colors
;; $output -- a table of colors where the key is the string for kitty group
(defn gen-colors []
  "Export a table of strings for kitty"
  (let [output {:foreground  (. (groups.mainFG) 1)
                :background (. (groups.mainBG) 1)
                :selection_foreground (. (groups.selectionFG) 1)
                :selection_background (. (groups.selectionBG) 1)
                :contrast main.contrast
                :shade vim.o.background
                :cursor (. (. (groups.mainFG) 1) 1)
                :cursor_text_color :background
                :color0 (. (groups.mainBG) 1)
                :color1 (. (colors.normal-colors) :red)
                :color2 (. (colors.normal-colors) :green)
                :color3 (. (colors.normal-colors) :orange)
                :color4 (. (colors.normal-colors) :blue)
                :color5 (. (colors.normal-colors) :pink)
                :color6 (. (colors.normal-colors) :purple)
                :color7 (. (groups.mainFG) 1)
                :color8 (. (groups.umbraBG) 1)
                :color15 (. (groups.umbraFG) 1)}]
    (if (= vim.o.background :light)
      (do
        (tset output :color9 (ucolors.darken (. (colors.normal-colors) :red) 0.2))
        (tset output :color10 (ucolors.darken (. (colors.normal-colors) :green) 0.2))
        (tset output :color11 (ucolors.darken (. (colors.normal-colors) :orange) 0.2))
        (tset output :color12 (ucolors.darken (. (colors.normal-colors) :blue) 0.2))
        (tset output :color13 (ucolors.darken (. (colors.normal-colors) :pink) 0.2))
        (tset output :color14 (ucolors.darken (. (colors.normal-colors) :purple) 0.2)))
      (do
        (tset output :color9  (ucolors.brighten (. (colors.normal-colors) :red) 0.2))
        (tset output :color10 (ucolors.brighten (. (colors.normal-colors) :green) 0.2))
        (tset output :color11 (ucolors.brighten (. (colors.normal-colors) :orange) 0.2))
        (tset output :color12 (ucolors.brighten (. (colors.normal-colors) :blue) 0.2))
        (tset output :color13 (ucolors.brighten (. (colors.normal-colors) :pink) 0.2))
        (tset output :color14 (ucolors.brighten (. (colors.normal-colors) :purple) 0.2))))
    output))

;; FN -- output kitty string to a file at the current working directory
(defn output! []
  (let [file-name (string.format "kitty-%s-%s.conf"
                                 (tostring vim.g.colors_name)
                                 (tostring vim.o.background))
        fd (assert (loop.fs_open file-name :w 0))]
    (assert (loop.fs_chmod file-name 420))
    (assert (loop.fs_write fd (export.string->one-line-color (gen-colors) :kitty) 0))
    (export.notify$ :kitty)
    (assert (loop.fs_close fd))))
