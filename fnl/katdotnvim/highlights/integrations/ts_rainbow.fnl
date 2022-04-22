(module katdotnvim.highlights.integrations.ts_rainbow
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main}})

; This file handles ts-rainbow colors

(defn init []
  (ucolors.highlight$ :rainbowcol1
                     (ucolors.blend  (. (colors.init :normalColors) :red)
                                     (. (groups.meldFG) 1)
                                     0.8)
                     :SKIP
                     1
                     :SKIP)
  (ucolors.highlight$ :rainbowcol2
                     (ucolors.blend  (. (colors.init :normalColors) :pink)
                                     (. (groups.meldFG) 1)
                                     0.8)
                     :SKIP
                     2
                     :SKIP)
  (ucolors.highlight$ :rainbowcol3
                     (ucolors.blend  (. (colors.init :normalColors) :purple)
                                     (. (groups.meldFG) 1)
                                     0.8)
                     :SKIP
                     3
                     :SKIP)
  (ucolors.highlight$ :rainbowcol4
                     (ucolors.blend  (. (colors.init :normalColors) :blue)
                                     (. (groups.meldFG) 1)
                                     0.8)
                     :SKIP
                     4
                     :SKIP)
  (ucolors.highlight$ :rainbowcol5
                     (ucolors.blend  (. (colors.init :normalColors) :green)
                                     (. (groups.meldFG) 1)
                                     0.8)
                     :SKIP
                     5
                     :SKIP)
  (ucolors.highlight$ :rainbowcol6
                     (ucolors.blend  (. (colors.init :normalColors) :orange)
                                     (. (groups.meldFG) 1)
                                     0.8)
                     :SKIP
                     6
                     :SKIP)
  (ucolors.highlight$ :rainbowcol7
                     (ucolors.blend  (. (colors.init :background) 6)
                                     (. (groups.meldFG) 1)
                                     0.8)
                     :SKIP
                     7
                     :SKIP))
