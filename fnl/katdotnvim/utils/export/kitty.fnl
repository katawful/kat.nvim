(module katdotnvim.utils.export.kitty
  {autoload {hsl externals.hsluv
             ucolors katdotnvim.utils.color
             colors katdotnvim.color
             groups katdotnvim.highlights.main
             main katdotnvim.main
             exports katdotnvim.utils.export.init
             a aniseed.core}
   require-macros [katdotnvim.utils.macros]})

; This module exports the 16 colors for kitty

; require vim.loop
(def- loop vim.loop)

; FN -- generates a table of colors for kitty colors
; $output -- a table of colors where the key is the string for kitty group
(defn kittyColors []
  (let [output
    {:foreground (groups.mainFG)
     :background (groups.mainBG)
     :selection_foreground (groups.selectionFG)
     :selection_background (groups.selectionBG)
     :contrast main.katContrast
     :shade vim.o.background
     :cursor (groups.mainFG)
     :cursor_text_color :background
     :color0 (groups.mainBG)
     :color1 (. (colors.init :normalColors) :red)
     :color2 (. (colors.init :normalColors) :green)
     :color3 (. (colors.init :normalColors) :orange)
     :color4 (. (colors.init :normalColors) :blue)
     :color5 (. (colors.init :normalColors) :pink)
     :color6 (. (colors.init :normalColors) :purple)
     :color7 (groups.mainFG)
     :color8 (groups.umbraBG)
     :color15 (groups.umbraFG)
     }]
  (if (= vim.o.background :light)
    (do
      (tset output :color9 (ucolors.darken (. (colors.init :normalColors) :red) 0.2))
      (tset output :color10 (ucolors.darken (. (colors.init :normalColors) :green) 0.2))
      (tset output :color11 (ucolors.darken (. (colors.init :normalColors) :orange) 0.2))
      (tset output :color12 (ucolors.darken (. (colors.init :normalColors) :blue) 0.2))
      (tset output :color13 (ucolors.darken (. (colors.init :normalColors) :pink) 0.2))
      (tset output :color14 (ucolors.darken (. (colors.init :normalColors) :purple) 0.2)))
    (do
      (tset output :color9  (ucolors.brighten (. (colors.init :normalColors) :red) 0.2))
      (tset output :color10 (ucolors.brighten (. (colors.init :normalColors) :green) 0.2))
      (tset output :color11 (ucolors.brighten (. (colors.init :normalColors) :orange) 0.2))
      (tset output :color12 (ucolors.brighten (. (colors.init :normalColors) :blue) 0.2))
      (tset output :color13 (ucolors.brighten (. (colors.init :normalColors) :pink) 0.2))
      (tset output :color14 (ucolors.brighten (. (colors.init :normalColors) :purple) 0.2))))
  output))

; FN -- output kitty string to a file at the current working directory
(defn generateKittyTheme []
  (local openMode (+ loop.constants.O_CREAT
                     loop.constants.O_WRONLY
                     loop.constants.O_TRUNC))
  (local fileName (string.format "kitty-%s-%s.conf"
                                 (tostring vim.g.colors_name)
                                 (tostring vim.o.background)))
  ; open file object
  (local fd (assert (loop.fs_open fileName :w 0)))
  ; make file generally accessible
  (assert (loop.fs_chmod fileName 420))
  (assert (loop.fs_write fd (exports.generateString (kittyColors) :kitty)))
  (exports.userExportNotify :kitty))
