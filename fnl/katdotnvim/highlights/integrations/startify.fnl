(module katdotnvim.highlights.integrations.startify
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

;;; This handles Startify

(defn high-colors [] [{:group :StartifyBracket
                       :fg colors.kat.blue.mix_meld_bg.color
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :StartifyFile
                       :fg colors.kat.purple.match_fg.color
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :StartifyNumber
                       :fg colors.kat.blue.base.color
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :StartifyPath
                       :fg colors.kat.bg.sixth.color
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP}
                      {:group :StartifySlash
                       :fg colors.kat.fg.meld.color
                       :bg :SKIP
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg :SKIP}
                      {:group :StartifySection
                       :fg colors.kat.red.match_fg.color
                       :bg :SKIP
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :StartifySpecial
                       :fg colors.kat.bg.sixth.color
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 3)
                       :ctermbg :SKIP}
                      {:group :StartifyHeader
                       :fg colors.kat.pink.base.color
                       :bg :SKIP
                       :ctermfg (. (groups.fillBG) 2)
                       :ctermbg :SKIP}
                      {:group :StartifyFooter
                       :fg colors.kat.bg.meld.color
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP}])

(defn init [] (run.highlight$<-table (high-colors)))
