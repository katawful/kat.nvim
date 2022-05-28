(module katdotnvim.exported.integrations.cmp-light-soft
        {autoload {run katdotnvim.utils.highlight.run}})

(defn render [] [{:bg "#f3a7b9"
                  :ctermbg 5
                  :ctermfg 4
                  :fg "#2dacd2"
                  :group :CmpItemKind}])

(defn init [] (run.highlight$<-table (render)))
