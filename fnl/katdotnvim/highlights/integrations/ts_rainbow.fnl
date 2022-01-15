(module katdotnvim.highlights.integrations.ts_rainbow
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main}})

; This file handles ts-rainbow colors

(defn init []
  (ucolors.highlight :rainbowcol1 (ucolors.blendColors (. (colors.init :normalColors) :red) (groups.meldFG) 0.8) :SKIP)
  (ucolors.highlight :rainbowcol2 (ucolors.blendColors (. (colors.init :normalColors) :pink) (groups.meldFG) 0.8) :SKIP)
  (ucolors.highlight :rainbowcol3 (ucolors.blendColors (. (colors.init :normalColors) :purple) (groups.meldFG) 0.8) :SKIP)
  (ucolors.highlight :rainbowcol4 (ucolors.blendColors (. (colors.init :normalColors) :blue) (groups.meldFG) 0.8) :SKIP)
  (ucolors.highlight :rainbowcol5 (ucolors.blendColors (. (colors.init :normalColors) :green) (groups.meldFG) 0.8) :SKIP)
  (ucolors.highlight :rainbowcol6 (ucolors.blendColors (. (colors.init :normalColors) :orange) (groups.meldFG) 0.8) :SKIP)
  (ucolors.highlight :rainbowcol7 (ucolors.blendColors (. (colors.init :background) 6) (groups.meldFG) 0.8) :SKIP))
