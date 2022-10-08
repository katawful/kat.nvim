(module katdotnvim.highlights.filetype.markdown
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

(defn high-colors [] [{:group :markdownItalic
                       :fg :SKIP
                       :bg :SKIP
                       :ctermfg :SKIP
                       :ctermbg :SKIP
                       :italic true}
                      {:group :markdownBold
                       :fg :SKIP
                       :bg :SKIP
                       :ctermfg :SKIP
                       :ctermbg :SKIP
                       :bold true}
                      {:group :markdownBoldItalic
                       :fg :SKIP
                       :bg :SKIP
                       :ctermfg :SKIP
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :markdownH1
                       :fg (ucolors.darken colors.kat.blue.base.color 0.0)
                       :bg :SKIP
                       :ctermfg 4
                       :ctermbg :SKIP
                       :bold true}
                      {:group :markdownH2
                       :fg (ucolors.darken colors.kat.blue.base.color 0.3)
                       :bg :SKIP
                       :ctermfg 12
                       :ctermbg :SKIP
                       :bold true}
                      {:group :markdownH3
                       :fg (ucolors.darken colors.kat.orange.base.color 0.0)
                       :bg :SKIP
                       :ctermfg 3
                       :ctermbg :SKIP
                       :bold true}
                      {:group :markdownH4
                       :fg (ucolors.darken colors.kat.orange.base.color 0.3)
                       :bg :SKIP
                       :ctermfg 11
                       :ctermbg :SKIP
                       :bold true}
                      {:group :markdownH5
                       :fg (ucolors.darken colors.kat.pink.base.color 0.0)
                       :bg :SKIP
                       :ctermfg 5
                       :ctermbg :SKIP
                       :bold true}
                      {:group :markdownH6
                       :fg (ucolors.darken colors.kat.pink.base.color 0.3)
                       :bg :SKIP
                       :ctermfg 13
                       :ctermbg :SKIP
                       :bold true}
                      {:group :markdownCode
                       :fg colors.kat.fg.meld.color
                       :bg colors.kat.bg.shadow.color
                       :ctermfg 15
                       :ctermbg 8}
                      {:group :markdownCodeDelimiter
                       :fg colors.kat.bg.shadow.color
                       :bg :SKIP
                       :ctermfg 8
                       :ctermbg :SKIP}
                      {:group :markdownBlockqutoe
                       :fg colors.kat.fg.umbra.color
                       :bg :SKIP
                       :ctermfg 15
                       :ctermbg :SKIP
                       :bold true}
                      {:group :markdownListMarker
                       :fg colors.kat.pink.base.color
                       :bg :SKIP
                       :ctermfg 5
                       :ctermbg :SKIP
                       :bold true}
                      {:group :markdownOrderedListMarker
                       :fg colors.kat.pink.base.color
                       :bg :SKIP
                       :ctermfg 5
                       :ctermbg :SKIP
                       :bold true}
                      {:group :markdownRule
                       :fg colors.kat.red.base.color
                       :bg :SKIP
                       :ctermfg 1
                       :ctermbg :SKIP}
                      {:group :markdownHeadingRule
                       :fg colors.kat.red.base.color
                       :bg :SKIP
                       :ctermfg 1
                       :ctermbg :SKIP}
                      {:group :markdownUrlDelimiter
                       :fg colors.kat.bg.meld.color
                       :bg :SKIP
                       :ctermfg 15
                       :ctermbg :SKIP
                       :bold true}
                      {:group :markdownLinkDelimiter
                       :fg colors.kat.bg.meld.color
                       :bg :SKIP
                       :ctermfg 15
                       :ctermbg :SKIP
                       :bold true}
                      {:group :markdownLinkTextDelimiter
                       :fg colors.kat.bg.meld.color
                       :bg :SKIP
                       :ctermfg 15
                       :ctermbg :SKIP
                       :bold true}
                      {:group :markdownHeadingDelimiter
                       :fg colors.kat.orange.base.color
                       :bg :SKIP
                       :ctermfg 3
                       :ctermbg :SKIP
                       :bold true}
                      {:group :markdownUrl
                       :fg colors.kat.purple.base.color
                       :bg :SKIP
                       :ctermfg 6
                       :ctermbg :SKIP}
                      {:group :markdownUrlTitleDelimiter
                       :fg colors.kat.green.auto.color
                       :bg :SKIP
                       :ctermfg 2
                       :ctermbg :SKIP
                       :bold true}
                      {:group :markdownLinkText
                       :fg colors.kat.fg.shadow.color
                       :bg :SKIP
                       :ctermfg 15
                       :ctermbg :SKIP
                       :underline true
                       :sp colors.kat.fg.shadow.color}
                      {:group :markdownIdDeclaration
                       :fg colors.kat.fg.shadow.color
                       :bg :SKIP
                       :ctermfg 15
                       :ctermbg :SKIP
                       :underline true
                       :sp colors.kat.fg.shadow.color}])

(defn init [] (run.highlight$<-table (high-colors)))
