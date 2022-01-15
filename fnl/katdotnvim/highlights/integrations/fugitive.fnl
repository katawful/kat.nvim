(module katdotnvim.highlights.integrations.fugitive
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main
                   }})

(defn init []
  (ucolors.highlight :fugitiveHunk :SKIP (groups.shadowBG) :nocombine)
  (ucolors.highlight :gitDiff :SKIP (groups.shadowBG) :nocombine))
