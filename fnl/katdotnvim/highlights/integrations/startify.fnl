(module katdotnvim.highlights.integrations.startify
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main}})

; This handles Startify

(defn init []
  (ucolors.highlight :StartifyBracket (ucolors.blendColors (groups.selectionBG) (groups.meldBG) 0.5) :SKIP :bold)
  (ucolors.highlight :StartifyFile (ucolors.blendColors (groups.highlightBG) (groups.mainFG) 0.8) :SKIP :bold)
  (ucolors.highlight :StartifyNumber (groups.selectionBG) :SKIP :bold)
  (ucolors.highlight :StartifyPath (. (colors.init :background) 6) :SKIP)
  (ucolors.highlight :StartifySlash (. (colors.init :foreground) 4) :SKIP)
  (ucolors.highlight :StartifySection (ucolors.blendColors (. (colors.init :normalColors) :red) (groups.mainFG) 0.8) :SKIP :bold)
  (ucolors.highlight :StartifySpecial (. (colors.init :background) 6) :SKIP)
  (ucolors.highlight :StartifyHeader (groups.fillBG) :SKIP)
  (ucolors.highlight :StartifyFooter (. (colors.init :background) 4) :SKIP))
