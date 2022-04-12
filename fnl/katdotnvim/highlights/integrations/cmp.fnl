(module katdotnvim.highlights.integrations.cmp
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main}})

; This handles nvim-cmp

(defn init []
  (ucolors.highlight$ :CmpItemKind
                     (. (groups.selectionBG) 1)
                     (ucolors.brighten (. (groups.fillBG) 1) 0.1)
                     (. (groups.selectionBG) 2)
                     (. (groups.fillBG) 2)))
