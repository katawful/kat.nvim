(module katdotnvim.highlights.filetype.vim
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

; this handles the vim filetype

(defn high-colors []
      [{:group :vimCommentTitle
        :fg colors.kat.bg.shadow.color
        :bg colors.kat.fg.shadow.color
        :ctermfg (. (groups.umbraBG) 2)
        :ctermbg (. (groups.umbraFG) 2)
        :bold true
        :italic true}
       {:group :vimBracket
        :fg (ucolors.blend (. (colors.init :normalColors) :pink)
                           colors.kat.fg.auto.color 0.7)
        :bg :SKIP
        :ctermfg (. (groups.fillBG) 2)
        :ctermbg :SKIP}
       {:group :vimMapModKey
        :fg (ucolors.blend (. (colors.init :normalColors) :pink)
                           colors.kat.fg.auto.color 0.8)
        :bg :SKIP
        :ctermfg (. (groups.fillBG) 2)
        :ctermbg :SKIP}
       {:group :vimFuncSID
        :fg colors.kat.fg.umbra.color
        :bg :SKIP
        :ctermfg (. (groups.umbraFG) 2)
        :ctermbg :SKIP}
       {:group :vimSetSep
        :fg colors.kat.fg.umbra.color
        :bg :SKIP
        :ctermfg (. (groups.umbraFG) 2)
        :ctermbg :SKIP}
       {:group :vimSep
        :fg colors.kat.fg.umbra.color
        :bg :SKIP
        :ctermfg (. (groups.umbraFG) 2)
        :ctermbg :SKIP}
       {:group :vimContinue
        :fg colors.kat.fg.umbra.color
        :bg :SKIP
        :ctermfg (. (groups.umbraFG) 2)
        :ctermbg :SKIP}
       {:group :vimOperParen :link :Variable}
       {:group :vimFunction :link :Function}
       {:group :vimIsCommand :link :Identifier}
       {:group :vimUserFunc :link :Function}])

(defn init [] (run.highlight$<-table (high-colors)))
