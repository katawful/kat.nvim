(module katdotnvim.exported.integrations.indent_blankline-dark-hard
        {autoload {run katdotnvim.utils.highlight.run}})

(defn render [] [{:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 8
                  :fg "#405881"
                  :group :IndentBlanklineChar
                  :nocombine true}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 8
                  :fg "#405881"
                  :group :IndentBlanklineSpaceChar
                  :nocombine true}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 8
                  :fg "#405881"
                  :group :IndentBlanklineSpaceChar
                  :nocombine true}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 4
                  :fg "#2dacd2"
                  :group :IndentBlanklineContextChar
                  :nocombine true}])

(defn init [] (run.highlight$<-table (render)))
