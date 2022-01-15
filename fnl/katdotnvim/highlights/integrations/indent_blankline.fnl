(module katdotnvim.highlights.integrations.indent_blankline
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main}})

(defn init []
  (ucolors.highlight :IndentBlanklineChar (groups.shadowBG) :SKIP :nocombine)
  (ucolors.highlight :IndentBlanklineSpaceChar (groups.shadowBG) :SKIP :nocombine)
  (ucolors.highlight :IndentBlanklineSpaceChar (groups.shadowBG) :SKIP :nocombine)
  (ucolors.highlight :IndentBlanklineContextChar (groups.selectionBG) :SKIP :nocombine))
