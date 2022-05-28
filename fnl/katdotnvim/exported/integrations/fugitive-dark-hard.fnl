(module katdotnvim.exported.integrations.fugitive-dark-hard
        {autoload {run katdotnvim.utils.highlight.run}})

(defn render [] [{:bg "#405881"
                  :ctermbg 8
                  :ctermfg :SKIP
                  :fg :SKIP
                  :group :fugitiveHunk
                  :nocombine true}
                 {:bg "#405881"
                  :ctermbg 8
                  :ctermfg :SKIP
                  :fg :SKIP
                  :group :gitDiff
                  :nocombine true}])

(defn init [] (run.highlight$<-table (render)))
