(module katdotnvim.highlights.integrations.indent_blankline
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main}})

(defn init []
  (ucolors.highlight$ :IndentBlanklineChar
                     (. (groups.shadowBG) 1)
                     :SKIP
                     (. (groups.umbraBG) 2)
                     :SKIP
                     :nocombine)
  (ucolors.highlight$ :IndentBlanklineSpaceChar
                     (. (groups.shadowBG) 1)
                     :SKIP
                     (. (groups.umbraBG) 2)
                     :SKIP
                     :nocombine)
  (ucolors.highlight$ :IndentBlanklineSpaceChar
                     (. (groups.shadowBG) 1)
                     :SKIP
                     (. (groups.umbraBG) 2)
                     :SKIP
                     :nocombine)
  (ucolors.highlight$ :IndentBlanklineContextChar
                     (. (groups.selectionBG) 1)
                     :SKIP
                     (. (groups.selectionBG) 2)
                     :SKIP
                     :nocombine))
