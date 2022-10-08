(module katdotnvim.highlights.integrations.gitsigns
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

(defn high-colors [] [{:group :GitSignsAdd
                       :fg colors.kat.green.auto.color
                       :bg :SKIP
                       :ctermfg 10
                       :ctermbg :SKIP
                       :bold true}
                      {:group :GitSignsAddLn
                       :fg :SKIP
                       :bg (ucolors.blend colors.kat.green.auto.color
                                          colors.kat.bg.base.color 0.4)
                       :ctermfg :SKIP
                       :ctermbg 10}
                      {:group :GitSignsAddLnInline
                       :fg :SKIP
                       :bg (ucolors.blend colors.kat.green.auto.color
                                          colors.kat.bg.base.color 0.6)
                       :ctermfg :SKIP
                       :ctermbg 10}
                      {:group :GitSignsChange
                       :fg colors.kat.blue.base.color
                       :bg :SKIP
                       :ctermfg 12
                       :ctermbg :SKIP
                       :bold true}
                      {:group :GitSignsChangeLn
                       :fg :SKIP
                       :bg (ucolors.blend colors.kat.blue.base.color
                                          colors.kat.bg.base.color 0.4)
                       :ctermfg :SKIP
                       :ctermbg 12}
                      {:group :GitSignsChangeLnInline
                       :fg :SKIP
                       :bg (ucolors.blend colors.kat.blue.base.color
                                          colors.kat.bg.base.color 0.6)
                       :ctermfg :SKIP
                       :ctermbg 12}
                      {:group :GitSignsDelete
                       :fg colors.kat.red.base.color
                       :bg :SKIP
                       :ctermfg 1
                       :ctermbg :SKIP
                       :bold true}
                      {:group :GitSignsDeleteLn
                       :fg :SKIP
                       :bg (ucolors.blend colors.kat.red.base.color
                                          colors.kat.bg.base.color 0.4)
                       :ctermfg :SKIP
                       :ctermbg 9}
                      {:group :GitSignsDeleteLnInline
                       :fg :SKIP
                       :bg (ucolors.blend colors.kat.red.base.color
                                          colors.kat.bg.base.color 0.6)
                       :ctermfg :SKIP
                       :ctermbg 9}])

(defn init [] (run.highlight$<-table (high-colors)))
