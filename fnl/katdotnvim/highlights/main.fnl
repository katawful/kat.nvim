(module katdotnvim.highlights.main
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.color
                   }})

; this covers the main highlight groups

(defn init []
  (ucolors.highlight :Normal (. colors.foreground 1) (ucolors.blendColors (. colors.background 1) (. colors.normalColors :red) 0.9)))
