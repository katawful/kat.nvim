(module katdotnvim.highlights.integrations.coc
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

;;; This handles coc.nvim colors

(defn high-colors [] [{:group :CocErrorSign
                       :fg colors.kat.red.base.color
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :CocWarningSign
                       :fg colors.kat.red.match_bg.color
                       :bg :SKIP
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :CocInfoSign
                       :fg colors.kat.orange.base.color
                       :bg :SKIP
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :CocHintSign
                       :fg colors.kat.green.auto.color
                       :bg :SKIP
                       :ctermfg (. (groups.auxBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :CocErrorFloat
                       :fg colors.kat.red.base.color
                       :bg colors.kat.bg.umbra.color
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg (. (groups.umbraBG) 2)}
                      {:group :CocWarningFloat
                       :fg colors.kat.red.match_bg.color
                       :bg colors.kat.bg.umbra.color
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg (. (groups.umbraBG) 2)}
                      {:group :CocInfoFloat
                       :fg colors.kat.orange.base.color
                       :bg colors.kat.bg.umbra.color
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg (. (groups.umbraBG) 2)}
                      {:group :CocHintFloat
                       :fg colors.kat.green.auto.color
                       :bg colors.kat.bg.umbra.color
                       :ctermfg (. (groups.auxBG) 2)
                       :ctermbg (. (groups.umbraBG) 2)}
                      {:group :CocDiagnosticsError
                       :fg colors.kat.red.base.color
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP}
                      {:group :CocDiagnosticsWarning
                       :fg colors.kat.red.match_bg.color
                       :bg :SKIP
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg :SKIP}
                      {:group :CocDiagnosticsInfo
                       :fg colors.kat.orange.base.color
                       :bg :SKIP
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg :SKIP}
                      {:group :CocDiagnosticsHint
                       :fg colors.kat.green.auto.color
                       :bg :SKIP
                       :ctermfg (. (groups.auxBG) 2)
                       :ctermbg :SKIP}
                      {:group :CocErrorHighlight
                       :fg :SKIP
                       :bg :SKIP
                       :ctermfg :SKIP
                       :ctermbg :NONE
                       :undercurl true
                       :sp colors.kat.red.base.color}
                      {:group :CocWarningHighlight
                       :fg :SKIP
                       :bg :SKIP
                       :ctermfg :SKIP
                       :ctermbg :NONE
                       :undercurl true
                       :sp colors.kat.red.match_bg.color}
                      {:group :CocInfoHighlight
                       :fg :SKIP
                       :bg :SKIP
                       :ctermfg :SKIP
                       :ctermbg :NONE
                       :undercurl true
                       :sp colors.kat.orange.base.color}
                      {:group :CocHintHighlight
                       :fg :SKIP
                       :bg :SKIP
                       :ctermfg :SKIP
                       :ctermbg :NONE
                       :undercurl true
                       :sp colors.kat.green.auto.color}
                      {:group :CocSelectedText
                       :fg :SKIP
                       :bg (ucolors.darken (. (colors.init :normalColors) :red)
                                           0.2)
                       :ctermfg :SKIP
                       :ctermbg (. (groups.warningBG) 2)}
                      {:group :CocCodeLens
                       :fg colors.kat.bg.meld.color
                       :bg :SKIP
                       :ctermfg (. (groups.umbraFG) 2)
                       :ctermbg :SKIP}])

(defn init [] (run.highlight$<-table (high-colors)))
