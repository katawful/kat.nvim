(module katdotnvim.highlights.integrations.cmp
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

;;; This handles nvim-cmp

(defn high-colors [] [{:group :CmpItemKind
                       :fg colors.kat.blue.base.color
                       :bg (ucolors.brighten colors.kat.pink.base.color 0.1)
                       :ctermfg 4
                       :ctermbg 5}])

(defn init [] (run.highlight$<-table (high-colors)))
