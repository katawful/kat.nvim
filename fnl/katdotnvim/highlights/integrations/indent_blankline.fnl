(module katdotnvim.highlights.integrations.indent_blankline
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

(defn high-colors [] [{:group :IndentBlanklineChar
                       :fg colors.kat.bg.shadow.color
                       :bg :SKIP
                       :ctermfg 8
                       :ctermbg :SKIP
                       :nocombine true}
                      {:group :IndentBlanklineSpaceChar
                       :fg colors.kat.bg.shadow.color
                       :bg :SKIP
                       :ctermfg 8
                       :ctermbg :SKIP
                       :nocombine true}
                      {:group :IndentBlanklineSpaceChar
                       :fg colors.kat.bg.shadow.color
                       :bg :SKIP
                       :ctermfg 8
                       :ctermbg :SKIP
                       :nocombine true}
                      {:group :IndentBlanklineContextChar
                       :fg colors.kat.blue.base.color
                       :bg :SKIP
                       :ctermfg 4
                       :ctermbg :SKIP
                       :nocombine true}])

(defn init [] (run.highlight$<-table (high-colors)))
