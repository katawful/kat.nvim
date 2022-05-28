(module katdotnvim.exported.integrations.startify-light-hard
        {autoload {run katdotnvim.utils.highlight.run}})

(defn render [] [{:bg :SKIP
                  :bold true
                  :ctermbg :SKIP
                  :ctermfg 4
                  :fg "#4091a9"
                  :group :StartifyBracket}
                 {:bg :SKIP
                  :bold true
                  :ctermbg :SKIP
                  :ctermfg 6
                  :fg "#65488f"
                  :group :StartifyFile}
                 {:bg :SKIP
                  :bold true
                  :ctermbg :SKIP
                  :ctermfg 4
                  :fg "#2dacd2"
                  :group :StartifyNumber}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 4
                  :fg "#111c1f"
                  :group :StartifyPath}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 7
                  :fg "#6285c0"
                  :group :StartifySlash}
                 {:bg :SKIP
                  :bold true
                  :ctermbg :SKIP
                  :ctermfg 9
                  :fg "#c04043"
                  :group :StartifySection}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 12
                  :fg "#111c1f"
                  :group :StartifySpecial}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 5
                  :fg "#f29cb1"
                  :group :StartifyHeader}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 4
                  :fg "#537680"
                  :group :StartifyFooter}])

(defn init [] (run.highlight$<-table (render)))
