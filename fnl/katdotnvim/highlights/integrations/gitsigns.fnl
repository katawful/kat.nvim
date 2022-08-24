(module katdotnvim.highlights.integrations.gitsigns
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

(defn high-colors [] [{:group :GitSignsAdd
                       :fg (. (groups.auxBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.auxBG) 3)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :GitSignsAddLn
                       :fg :SKIP
                       :bg (ucolors.blend (. (groups.auxBG) 1)
                                          (. (groups.mainBG) 1) 0.4)
                       :ctermfg :SKIP
                       :ctermbg (. (groups.auxBG) 3)}
                      {:group :GitSignsAddLnInline
                       :fg :SKIP
                       :bg (ucolors.blend (. (groups.auxBG) 1)
                                          (. (groups.mainBG) 1) 0.6)
                       :ctermfg :SKIP
                       :ctermbg (. (groups.auxBG) 3)}
                      {:group :GitSignsChange
                       :fg (. (groups.selectionBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 3)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :GitSignsChangeLn
                       :fg :SKIP
                       :bg (ucolors.blend (. (groups.selectionBG) 1)
                                          (. (groups.mainBG) 1) 0.4)
                       :ctermfg :SKIP
                       :ctermbg (. (groups.selectionBG) 3)}
                      {:group :GitSignsChangeLnInline
                       :fg :SKIP
                       :bg (ucolors.blend (. (groups.selectionBG) 1)
                                          (. (groups.mainBG) 1) 0.6)
                       :ctermfg :SKIP
                       :ctermbg (. (groups.selectionBG) 3)}
                      {:group :GitSignsDelete
                       :fg (. (groups.errorBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :GitSignsDeleteLn
                       :fg :SKIP
                       :bg (ucolors.blend (. (groups.errorBG) 1)
                                          (. (groups.mainBG) 1) 0.4)
                       :ctermfg :SKIP
                       :ctermbg (. (groups.errorBG) 3)}
                      {:group :GitSignsDeleteLnInline
                       :fg :SKIP
                       :bg (ucolors.blend (. (groups.errorBG) 1)
                                          (. (groups.mainBG) 1) 0.6)
                       :ctermfg :SKIP
                       :ctermbg (. (groups.errorBG) 3)}])

(defn init [] (run.highlight$<-table (high-colors)))
