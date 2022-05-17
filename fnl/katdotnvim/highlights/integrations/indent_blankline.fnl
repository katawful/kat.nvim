(module katdotnvim.highlights.integrations.indent_blankline
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

(defn high-colors []
  [
    {:group :IndentBlanklineChar
     :fg (. (groups.shadowBG) 1)
     :bg :SKIP
     :ctermfg (. (groups.umbraBG) 2)
     :ctermbg :SKIP
     :nocombine true}
    {:group :IndentBlanklineSpaceChar
     :fg (. (groups.shadowBG) 1)
     :bg :SKIP
     :ctermfg (. (groups.umbraBG) 2)
     :ctermbg :SKIP
     :nocombine true}
    {:group :IndentBlanklineSpaceChar
     :fg (. (groups.shadowBG) 1)
     :bg :SKIP
     :ctermfg (. (groups.umbraBG) 2)
     :ctermbg :SKIP
     :nocombine true}
    {:group :IndentBlanklineContextChar
     :fg (. (groups.selectionBG) 1)
     :bg :SKIP
     :ctermfg (. (groups.selectionBG) 2)
     :ctermbg :SKIP
     :nocombine true}])

(defn init []
  (run.highlight$<-table (high-colors)))
