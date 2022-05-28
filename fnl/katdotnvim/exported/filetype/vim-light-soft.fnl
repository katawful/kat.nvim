(module katdotnvim.exported.filetype.vim-light-soft
        {autoload {run katdotnvim.utils.highlight.run}})

(defn render [] [{:bg "#405881"
                  :bold true
                  :ctermbg 15
                  :ctermfg 8
                  :fg "#78aab8"
                  :group :vimCommentTitle
                  :italic true}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 5
                  :fg "#b37b91"
                  :group :vimBracket}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 5
                  :fg "#c8869c"
                  :group :vimMapModKey}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 15
                  :fg "#121c2d"
                  :group :vimFuncSID}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 15
                  :fg "#121c2d"
                  :group :vimSetSep}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 15
                  :fg "#121c2d"
                  :group :vimSep}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 15
                  :fg "#121c2d"
                  :group :vimContinue}
                 {:group :vimOperParen :link :Variable}
                 {:group :vimFunction :link :Function}
                 {:group :vimIsCommand :link :Identifier}
                 {:group :vimUserFunc :link :Function}])

(defn init [] (run.highlight$<-table (render)))
