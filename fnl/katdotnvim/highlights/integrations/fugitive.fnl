(module katdotnvim.highlights.integrations.fugitive
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

(defn high-colors [] [{:group :fugitiveHunk
                       :fg :SKIP
                       :bg colors.kat.bg.shadow.color
                       :ctermfg :SKIP
                       :ctermbg 8
                       :nocombine true}
                      {:group :gitDiff
                       :fg :SKIP
                       :bg colors.kat.bg.shadow.color
                       :ctermfg :SKIP
                       :ctermbg 8
                       :nocombine true}])

(defn init [] (run.highlight$<-table (high-colors)))
