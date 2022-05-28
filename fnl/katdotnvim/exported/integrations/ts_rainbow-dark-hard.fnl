(module katdotnvim.exported.integrations.ts_rainbow-dark-hard
        {autoload {run katdotnvim.utils.highlight.run}})

(defn render [] [{:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 1
                  :fg "#cd5254"
                  :group :rainbowcol1}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 2
                  :fg "#d294a7"
                  :group :rainbowcol2}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 3
                  :fg "#725aa0"
                  :group :rainbowcol3}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 4
                  :fg "#35a1c2"
                  :group :rainbowcol4}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 5
                  :fg "#34cba2"
                  :group :rainbowcol5}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 6
                  :fg "#d2a563"
                  :group :rainbowcol6}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 7
                  :fg "#c4cfdd"
                  :group :rainbowcol7}])

(defn init [] (run.highlight$<-table (render)))
