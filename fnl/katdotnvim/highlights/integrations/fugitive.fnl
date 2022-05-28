(module katdotnvim.highlights.integrations.fugitive
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

(defn high-colors [] [{:group :fugitiveHunk
                       :fg :SKIP
                       :bg (. (groups.shadowBG) 1)
                       :ctermfg :SKIP
                       :ctermbg (. (groups.umbraBG) 2)
                       :nocombine true}
                      {:group :gitDiff
                       :fg :SKIP
                       :bg (. (groups.shadowBG) 1)
                       :ctermfg :SKIP
                       :ctermbg (. (groups.umbraBG) 2)
                       :nocombine true}])

(defn init [] (run.highlight$<-table (high-colors)))
