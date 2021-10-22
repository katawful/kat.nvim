(module katdotnvim.highlights.ts_rainbow
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main
                   }})

; This file handles ts-rainbow colors

(defn init []
  (ucolors.highlight :rainbowcol1 (ucolors.blendColors (. colors.normalColors :red) groups.meldFG 0.8) :SKIP)
  (ucolors.highlight :rainbowcol2 (ucolors.blendColors (. colors.normalColors :pink) groups.meldFG 0.8) :SKIP)
  (ucolors.highlight :rainbowcol3 (ucolors.blendColors (. colors.normalColors :purple) groups.meldFG 0.8) :SKIP)
  (ucolors.highlight :rainbowcol4 (ucolors.blendColors (. colors.normalColors :blue) groups.meldFG 0.8) :SKIP)
  (ucolors.highlight :rainbowcol5 (ucolors.blendColors (. colors.normalColors :green) groups.meldFG 0.8) :SKIP)
  (ucolors.highlight :rainbowcol6 (ucolors.blendColors (. colors.background 6) groups.meldFG 0.8) :SKIP)
  (ucolors.highlight :rainbowcol7 (ucolors.blendColors (. colors.foreground 6) groups.meldFG 0.8) :SKIP)
		; rainbowcol1 = {bg = cpt.bg, fg = cpt.red},
		; rainbowcol2 = {bg = cpt.bg, fg = cpt.green},
		; rainbowcol3 = {bg = cpt.bg, fg = cpt.yellow},
		; rainbowcol4 = {bg = cpt.bg, fg = cpt.blue},
		; rainbowcol5 = {bg = cpt.bg, fg = cpt.magenta},
		; rainbowcol6 = {bg = cpt.bg, fg = cpt.cyan},
		; rainbowcol7 = {bg = cpt.bg, fg = cpt.white},
  )
