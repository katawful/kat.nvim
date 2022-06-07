(module katdotnvim.highlights.filetype.markdown
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

(defn high-colors []
      [{:group :markdownItalic
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
        :fg (ucolors.darken (. (colors.init :normalColors) :blue) 0.0)
        :bg :SKIP
        :ctermfg 4
        :ctermbg :SKIP
        :bold true}
       {:group :markdownH2
        :fg (ucolors.darken (. (colors.init :normalColors) :blue) 0.3)
        :bg :SKIP
        :ctermfg 12
        :ctermbg :SKIP
        :bold true}
       {:group :markdownH3
        :fg (ucolors.darken (. (colors.init :normalColors) :orange) 0.0)
        :bg :SKIP
        :ctermfg 3
        :ctermbg :SKIP
        :bold true}
       {:group :markdownH4
        :fg (ucolors.darken (. (colors.init :normalColors) :orange) 0.3)
        :bg :SKIP
        :ctermfg 11
        :ctermbg :SKIP
        :bold true}
       {:group :markdownH5
        :fg (ucolors.darken (. (colors.init :normalColors) :pink) 0.0)
        :bg :SKIP
        :ctermfg 5
        :ctermbg :SKIP
        :bold true}
       {:group :markdownH6
        :fg (ucolors.darken (. (colors.init :normalColors) :pink) 0.3)
        :bg :SKIP
        :ctermfg 13
        :ctermbg :SKIP
        :bold true}
       {:group :markdownCode
        :fg (. (groups.meldFG) 1)
        :bg (. (groups.shadowBG) 1)
        :ctermfg (. (groups.umbraFG) 2)
        :ctermbg (. (groups.umbraBG) 2)}
       {:group :markdownCodeDelimiter
        :fg (. (groups.shadowBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.umbraBG) 2)
        :ctermbg :SKIP}
       {:group :markdownBlockqutoe
        :fg (. (groups.umbraFG) 1)
        :bg :SKIP
        :ctermfg (. (groups.umbraFG) 2)
        :ctermbg :SKIP
        :bold true}
       {:group :markdownListMarker
        :fg (. (groups.fillBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.fillBG) 2)
        :ctermbg :SKIP
        :bold true}
       {:group :markdownOrderedListMarker
        :fg (. (groups.fillBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.fillBG) 2)
        :ctermbg :SKIP
        :bold true}
       {:group :markdownRule
        :fg (. (groups.errorBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.errorBG) 2)
        :ctermbg :SKIP}
       {:group :markdownHeadingRule
        :fg (. (groups.errorBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.errorBG) 2)
        :ctermbg :SKIP}
       {:group :markdownUrlDelimiter
        :fg (. (groups.meldBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.umbraFG) 2)
        :ctermbg :SKIP
        :bold true}
       {:group :markdownLinkDelimiter
        :fg (. (groups.meldBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.umbraFG) 2)
        :ctermbg :SKIP
        :bold true}
       {:group :markdownLinkTextDelimiter
        :fg (. (groups.meldBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.umbraFG) 2)
        :ctermbg :SKIP
        :bold true}
       {:group :markdownHeadingDelimiter
        :fg (. (groups.infoBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.infoBG) 2)
        :ctermbg :SKIP
        :bold true}
       {:group :markdownUrl
        :fg (. (groups.highlightBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.highlightBG) 2)
        :ctermbg :SKIP}
       {:group :markdownUrlTitleDelimiter
        :fg (. (groups.auxBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.auxBG) 2)
        :ctermbg :SKIP
        :bold true}
       {:group :markdownLinkText
        :fg (. (groups.shadowFG) 1)
        :bg :SKIP
        :ctermfg (. (groups.umbraFG) 2)
        :ctermbg :SKIP
        :underline true
        :sp (. (colors.init :foreground) 3)}
       {:group :markdownIdDeclaration
        :fg (. (groups.shadowFG) 1)
        :bg :SKIP
        :ctermfg (. (groups.umbraFG) 2)
        :ctermbg :SKIP
        :underline true
        :sp (. (colors.init :foreground) 3)}])

(defn init [] (run.highlight$<-table (high-colors)))
