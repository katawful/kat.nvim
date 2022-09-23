(module katdotnvim.highlights.integrations.coc
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

;;; This handles coc.nvim colors

(defn high-colors [] [{:group :CocErrorSign
                       :fg (. (groups.errorBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :CocWarningSign
                       :fg (. (groups.warningBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :CocInfoSign
                       :fg (. (groups.infoBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :CocHintSign
                       :fg (. (groups.auxBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.auxBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :CocErrorFloat
                       :fg (. (groups.errorBG) 1)
                       :bg (. (groups.umbraBG) 1)
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg (. (groups.umbraBG) 2)}
                      {:group :CocWarningFloat
                       :fg (. (groups.warningBG) 1)
                       :bg (. (groups.umbraBG) 1)
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg (. (groups.umbraBG) 2)}
                      {:group :CocInfoFloat
                       :fg (. (groups.infoBG) 1)
                       :bg (. (groups.umbraBG) 1)
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg (. (groups.umbraBG) 2)}
                      {:group :CocHintFloat
                       :fg (. (groups.auxBG) 1)
                       :bg (. (groups.umbraBG) 1)
                       :ctermfg (. (groups.auxBG) 2)
                       :ctermbg (. (groups.umbraBG) 2)}
                      {:group :CocDiagnosticsError
                       :fg (. (groups.errorBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP}
                      {:group :CocDiagnosticsWarning
                       :fg (. (groups.warningBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg :SKIP}
                      {:group :CocDiagnosticsInfo
                       :fg (. (groups.infoBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg :SKIP}
                      {:group :CocDiagnosticsHint
                       :fg (. (groups.auxBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.auxBG) 2)
                       :ctermbg :SKIP}
                      {:group :CocErrorHighlight
                       :fg :SKIP
                       :bg :SKIP
                       :ctermfg :SKIP
                       :ctermbg :NONE
                       :undercurl true
                       :sp (. (groups.errorBG) 1)}
                      {:group :CocWarningHighlight
                       :fg :SKIP
                       :bg :SKIP
                       :ctermfg :SKIP
                       :ctermbg :NONE
                       :undercurl true
                       :sp (. (groups.warningBG) 1)}
                      {:group :CocInfoHighlight
                       :fg :SKIP
                       :bg :SKIP
                       :ctermfg :SKIP
                       :ctermbg :NONE
                       :undercurl true
                       :sp (. (groups.infoBG) 1)}
                      {:group :CocHintHighlight
                       :fg :SKIP
                       :bg :SKIP
                       :ctermfg :SKIP
                       :ctermbg :NONE
                       :undercurl true
                       :sp (. (groups.auxBG) 1)}
                      {:group :CocSelectedText
                       :fg :SKIP
                       :bg (ucolors.darken (. (colors.init :normalColors) :red)
                                           0.2)
                       :ctermfg :SKIP
                       :ctermbg (. (groups.warningBG) 2)}
                      {:group :CocCodeLens
                       :fg (. (groups.meldBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.umbraFG) 2)
                       :ctermbg :SKIP}])

(defn init [] (run.highlight$<-table (high-colors)))
