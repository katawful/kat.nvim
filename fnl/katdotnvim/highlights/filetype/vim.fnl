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
        :ctermfg 8
        :ctermbg 15
        :bold true
        :italic true}
       {:group :vimBracket
        :fg colors.kat.pink.match_fg.color
        :bg :SKIP
        :ctermfg 5
        :ctermbg :SKIP}
       {:group :vimMapModKey
        :fg colors.kat.pink.match_fg.color
        :bg :SKIP
        :ctermfg 5
        :ctermbg :SKIP}
       {:group :vimFuncSID
        :fg colors.kat.fg.umbra.color
        :bg :SKIP
        :ctermfg 15
        :ctermbg :SKIP}
       {:group :vimSetSep
        :fg colors.kat.fg.umbra.color
        :bg :SKIP
        :ctermfg 15
        :ctermbg :SKIP}
       {:group :vimSep
        :fg colors.kat.fg.umbra.color
        :bg :SKIP
        :ctermfg 15
        :ctermbg :SKIP}
       {:group :vimContinue
        :fg colors.kat.fg.umbra.color
        :bg :SKIP
        :ctermfg 15
        :ctermbg :SKIP}
       {:group :vimOperParen :link :Variable}
       {:group :vimFunction :link :Function}
       {:group :vimIsCommand :link :Identifier}
       {:group :vimUserFunc :link :Function}])

(defn init [] (run.highlight$<-table (high-colors)))
