(module katdotnvim.highlights.integrations.coc
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main}})

; This handles coc.nvim colors

(defn init []
  (ucolors.highlight :CocErrorSign
                     (. (groups.errorBG) 1)
                     :SKIP
                     (. (groups.errorBG) 2)
                     :SKIP
                     :bold)
  (ucolors.highlight :CocWarningSign
                     (. (groups.warningBG) 1)
                     :SKIP
                     (. (groups.warningBG) 2)
                     :SKIP
                     :bold)
  (ucolors.highlight :CocInfoSign
                     (. (groups.infoBG) 1)
                     :SKIP
                     (. (groups.infoBG) 2)
                     :SKIP
                     :bold)
  (ucolors.highlight :CocHintSign
                     (. (groups.auxBG) 1)
                     :SKIP
                     (. (groups.auxBG) 2)
                     :SKIP
                     :bold)

  (ucolors.highlight :CocErrorFloat
                     (. (groups.errorBG) 1)
                     (. (groups.umbraBG) 1)
                     (. (groups.errorBG) 2)
                     (. (groups.umbraBG) 2))
  (ucolors.highlight :CocWarningFloat
                     (. (groups.warningBG) 1)
                     (. (groups.umbraBG) 1)
                     (. (groups.warningBG) 2)
                     (. (groups.umbraBG) 2))
  (ucolors.highlight :CocInfoFloat
                     (. (groups.infoBG) 1)
                     (. (groups.umbraBG) 1)
                     (. (groups.infoBG) 2)
                     (. (groups.umbraBG) 2))
  (ucolors.highlight :CocHintFloat
                     (. (groups.auxBG) 1)
                     (. (groups.umbraBG) 1)
                     (. (groups.auxBG) 2)
                     (. (groups.umbraBG) 2))

  (ucolors.highlight :CocDiagnosticsError
                     (. (groups.errorBG) 1)
                     :SKIP
                     (. (groups.errorBG) 2)
                     :SKIP)
  (ucolors.highlight :CocDiagnosticsWarning
                     (. (groups.warningBG) 1)
                     :SKIP
                     (. (groups.warningBG) 2)
                     :SKIP)
  (ucolors.highlight :CocDiagnosticsInfo
                     (. (groups.infoBG) 1)
                     :SKIP
                     (. (groups.infoBG) 2)
                     :SKIP)
  (ucolors.highlight :CocDiagnosticsHint
                     (. (groups.auxBG) 1)
                     :SKIP
                     (. (groups.auxBG) 2)
                     :SKIP)

  (ucolors.highlight :CocErrorHighlight
                     :SKIP
                     :SKIP
                     :SKIP
                     :NONE
                     :undercurl
                     (. (groups.errorBG) 1))
  (ucolors.highlight :CocWarningHighlight
                     :SKIP
                     :SKIP
                     :SKIP
                     :NONE
                     :undercurl
                     (. (groups.warningBG) 1))
  (ucolors.highlight :CocInfoHighlight
                     :SKIP
                     :SKIP
                     :SKIP
                     :NONE
                     :undercurl
                     (. (groups.infoBG) 1))
  (ucolors.highlight :CocHintHighlight
                     :SKIP
                     :SKIP
                     :SKIP
                     :NONE
                     :undercurl
                     (. (groups.auxBG) 1))

  (ucolors.highlight :CocSelectedText
                     :SKIP
                     (ucolors.darken (. (colors.init :normalColors) :red) 0.2)
                     :SKIP
                     (. (groups.warningBG) 2))

  (ucolors.highlight :CocCodeLens
                     (. (groups.meldBG) 1)
                     :SKIP
                     (. (groups.umbraFG) 2)
                     :SKIP))
