(module katdotnvim.exported.filetype.vim-dark-soft
        {autoload {run katdotnvim.utils.highlight.run}})

(defn render [] [{:bg "#78aab8"
                  :bold true
                  :ctermbg 15
                  :ctermfg 8
                  :fg "#405881"
                  :group :vimCommentTitle
                  :italic true}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 5
                  :fg "#f1b8c7"
                  :group :vimBracket}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 5
                  :fg "#f2aec0"
                  :group :vimMapModKey}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 15
                  :fg "#daf6ff"
                  :group :vimFuncSID}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 15
                  :fg "#daf6ff"
                  :group :vimSetSep}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 15
                  :fg "#daf6ff"
                  :group :vimSep}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 15
                  :fg "#daf6ff"
                  :group :vimContinue}
                 {:group :vimOperParen :link :Variable}
                 {:group :vimFunction :link :Function}
                 {:group :vimIsCommand :link :Identifier}
                 {:group :vimUserFunc :link :Function}])

(defn init [] (run.highlight$<-table (render)))
