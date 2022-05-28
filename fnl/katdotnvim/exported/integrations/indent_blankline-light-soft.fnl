(module katdotnvim.exported.integrations.indent_blankline-light-soft
        {autoload {run katdotnvim.utils.highlight.run}})

(defn render [] [{:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 8
                  :fg "#78aab8"
                  :group :IndentBlanklineChar
                  :nocombine true}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 8
                  :fg "#78aab8"
                  :group :IndentBlanklineSpaceChar
                  :nocombine true}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 8
                  :fg "#78aab8"
                  :group :IndentBlanklineSpaceChar
                  :nocombine true}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 4
                  :fg "#2dacd2"
                  :group :IndentBlanklineContextChar
                  :nocombine true}])

(defn init [] (run.highlight$<-table (render)))
