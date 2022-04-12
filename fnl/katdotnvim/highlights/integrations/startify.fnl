(module katdotnvim.highlights.integrations.startify
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main}})

; This handles Startify

(defn init []
  (ucolors.highlight :StartifyBracket
                     (ucolors.blend  (. (groups.selectionBG) 1)
                                     (. (groups.meldBG) 1)
                                     0.5)
                     :SKIP
                     (. (groups.selectionBG) 2)
                     :SKIP
                     :bold)
  (ucolors.highlight :StartifyFile
                     (ucolors.blend  (. (groups.highlightBG) 1) (. (groups.mainFG) 1) 0.8)
                     :SKIP
                     (. (groups.highlightBG) 2)
                     :SKIP
                     :bold)
  (ucolors.highlight :StartifyNumber
                     (. (groups.selectionBG) 1)
                     :SKIP
                     (. (groups.selectionBG) 2)
                     :SKIP
                     :bold)
  (ucolors.highlight :StartifyPath
                     (. (colors.init :background) 6)
                     :SKIP
                     (. (groups.selectionBG) 2)
                     :SKIP)
  (ucolors.highlight :StartifySlash
                     (. (colors.init :foreground) 4)
                     :SKIP
                     (. (groups.mainFG) 2)
                     :SKIP)
  (ucolors.highlight :StartifySection
                     (ucolors.blend  (. (colors.init :normalColors) :red) (. (groups.mainFG) 1) 0.8)
                     :SKIP
                     (. (groups.warningBG) 2)
                     :SKIP
                     :bold)
  (ucolors.highlight :StartifySpecial
                     (. (colors.init :background) 6)
                     :SKIP
                     (. (groups.selectionBG) 3)
                     :SKIP)
  (ucolors.highlight :StartifyHeader
                     (. (groups.fillBG) 1)
                     :SKIP
                     (. (groups.fillBG) 2)
                     :SKIP)
  (ucolors.highlight :StartifyFooter
                     (. (colors.init :background) 4)
                     :SKIP
                     (. (groups.selectionBG) 2)
                     :SKIP))
