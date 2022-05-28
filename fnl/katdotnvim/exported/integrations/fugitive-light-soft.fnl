(module katdotnvim.exported.integrations.fugitive-light-soft
        {autoload {run katdotnvim.utils.highlight.run}})

(defn render [] [{:bg "#78aab8"
                  :ctermbg 8
                  :ctermfg :SKIP
                  :fg :SKIP
                  :group :fugitiveHunk
                  :nocombine true}
                 {:bg "#78aab8"
                  :ctermbg 8
                  :ctermfg :SKIP
                  :fg :SKIP
                  :group :gitDiff
                  :nocombine true}])

(defn init [] (run.highlight$<-table (render)))
