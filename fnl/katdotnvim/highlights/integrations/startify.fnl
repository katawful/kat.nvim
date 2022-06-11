(module katdotnvim.highlights.integrations.startify
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

; This handles Startify

(defn high-colors [] [{:group :StartifyBracket
                       :fg (ucolors.blend (. (groups.selectionBG) 1)
                                          (. (groups.meldBG) 1) 0.5)
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :StartifyFile
                       :fg (ucolors.blend (. (groups.highlightBG) 1)
                                          (. (groups.mainFG) 1) 0.8)
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :StartifyNumber
                       :fg (. (groups.selectionBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :StartifyPath
                       :fg (. (colors.background) 6)
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP}
                      {:group :StartifySlash
                       :fg (. (colors.foreground) 4)
                       :bg :SKIP
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg :SKIP}
                      {:group :StartifySection
                       :fg (ucolors.blend (. (colors.normal-colors) :red)
                                          (. (groups.mainFG) 1) 0.8)
                       :bg :SKIP
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :StartifySpecial
                       :fg (. (colors.background) 6)
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 3)
                       :ctermbg :SKIP}
                      {:group :StartifyHeader
                       :fg (. (groups.fillBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.fillBG) 2)
                       :ctermbg :SKIP}
                      {:group :StartifyFooter
                       :fg (. (colors.background) 4)
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP}])

(defn init [] (run.highlight$<-table (high-colors)))
