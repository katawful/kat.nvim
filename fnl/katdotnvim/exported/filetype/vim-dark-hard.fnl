(module katdotnvim.exported.filetype.vim-dark-hard
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
                  :fg "#ebb7c8"
                  :group :vimBracket}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 5
                  :fg "#edaec1"
                  :group :vimMapModKey}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 15
                  :fg "#b0ddeb"
                  :group :vimFuncSID}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 15
                  :fg "#b0ddeb"
                  :group :vimSetSep}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 15
                  :fg "#b0ddeb"
                  :group :vimSep}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 15
                  :fg "#b0ddeb"
                  :group :vimContinue}
                 {:group :vimOperParen :link :Variable}
                 {:group :vimFunction :link :Function}
                 {:group :vimIsCommand :link :Identifier}
                 {:group :vimUserFunc :link :Function}])

(defn init [] (run.highlight$<-table (render)))
