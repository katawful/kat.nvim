(module katdotnvim.highlights.startify
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main
                   }})

; This handles Startify

(defn init []
  (ucolors.highlight :StartifyBracket (ucolors.blendColors groups.selectionBG groups.meldBG 0.5) :SKIP :bold)
  (ucolors.highlight :StartifyFile (ucolors.blendColors groups.highlightBG groups.mainFG 0.8) :SKIP :bold)
  (ucolors.highlight :StartifyNumber groups.selectionBG :SKIP :bold)
  (ucolors.highlight :StartifyPath (. colors.background 6) :SKIP)
  (ucolors.highlight :StartifySlash (. colors.foreground 4) :SKIP)
  (ucolors.highlight :StartifySection (ucolors.blendColors (. colors.normalColors :red) groups.mainFG 0.8) :SKIP :bold)
  (ucolors.highlight :StartifySpecial (. colors.background 6) :SKIP)
  (ucolors.highlight :StartifyHeader groups.fillBG :SKIP)
  (ucolors.highlight :StartifyFooter (. colors.background 4) :SKIP)
  )
