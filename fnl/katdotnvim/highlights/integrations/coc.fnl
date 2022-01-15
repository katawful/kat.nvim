(module katdotnvim.highlights.integrations.coc
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main}})

; This handles coc.nvim colors

(defn init []
  (ucolors.highlight :CocErrorSign (groups.errorBG) :SKIP :bold)
  (ucolors.highlight :CocWarningSign (groups.warningBG) :SKIP :bold)
  (ucolors.highlight :CocInfoSign (groups.infoBG) :SKIP :bold)
  (ucolors.highlight :CocHintSign (groups.auxBG) :SKIP :bold)

  (ucolors.highlight :CocErrorFloat (groups.errorBG) (groups.umbraBG))
  (ucolors.highlight :CocWarningFloat (groups.warningBG) (groups.umbraBG))
  (ucolors.highlight :CocInfoFloat (groups.infoBG) (groups.umbraBG))
  (ucolors.highlight :CocHintFloat (groups.auxBG) (groups.umbraBG))

  (ucolors.highlight :CocDiagnosticsError (groups.errorBG) :SKIP)
  (ucolors.highlight :CocDiagnosticsWarning (groups.warningBG) :SKIP)
  (ucolors.highlight :CocDiagnosticsInfo (groups.infoBG) :SKIP)
  (ucolors.highlight :CocDiagnosticsHint (groups.auxBG) :SKIP)

  (ucolors.highlight :CocErrorHighlight :SKIP :SKIP :undercurl (groups.errorBG))
  (ucolors.highlight :CocWarningHighlight :SKIP :SKIP :undercurl (groups.warningBG))
  (ucolors.highlight :CocInfoHighlight :SKIP :SKIP :undercurl (groups.infoBG))
  (ucolors.highlight :CocHintHighlight :SKIP :SKIP :undercurl (groups.auxBG))

  (ucolors.highlight :CocSelectedText :SKIP (ucolors.darken (. (colors.init :normalColors) :red) 0.2))
  (ucolors.highlight :CocCodeLens (groups.meldBG) :SKIP))
