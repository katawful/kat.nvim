(module katdotnvim.highlights.integrations.cmp
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main}})

; This handles nvim-cmp

(defn init []
  (ucolors.highlight :CmpItemKind (groups.selectionBG) (ucolors.brighten (groups.fillBG) 0.1)))
