(module katdotnvim.highlights.integrations.cmp
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

; This handles nvim-cmp

(defn high-colors [] [{:group :CmpItemKind
                       :fg (. (groups.selectionBG) 1)
                       :bg (ucolors.brighten (. (groups.fillBG) 1) 0.1)
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg (. (groups.fillBG) 2)}])

(defn init [] (run.highlight$<-table (high-colors)))
