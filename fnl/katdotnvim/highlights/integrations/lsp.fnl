(module katdotnvim.highlights.integrations.lsp
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

;;; This handles the builtin LSP colors

(defn high-colors [] [{:group :LspReferenceText
                       :fg :SKIP
                       :bg colors.kat.pink.base.color
                       :ctermfg :SKIP
                       :ctermbg (. (groups.fillBG) 2)}
                      {:group :LspReferenceRead
                       :fg :SKIP
                       :bg colors.kat.pink.base.color
                       :ctermfg :SKIP
                       :ctermbg (. (groups.fillBG) 2)}
                      {:group :LspReferenceWrite
                       :fg :SKIP
                       :bg colors.kat.pink.base.color
                       :ctermfg :SKIP
                       :ctermbg (. (groups.fillBG) 2)}
                      {:group :LspCodeLens
                       :fg colors.kat.bg.meld.color
                       :bg :SKIP
                       :ctermfg (. (groups.umbraBG) 2)
                       :ctermbg :SKIP}
                      {:group :LspSignatureActiveParameter
                       :fg colors.kat.blue.base.color
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP}
                      {:group :DiagnosticError
                       :fg colors.kat.red.base.color
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP}
                      {:group :DiagnosticWarn
                       :fg colors.kat.red.match_bg.color
                       :bg :SKIP
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg :SKIP}
                      {:group :DiagnosticInfo
                       :fg colors.kat.orange.base.color
                       :bg :SKIP
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg :SKIP}
                      {:group :DiagnosticHint
                       :fg colors.kat.orange.base.color
                       :bg :SKIP
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg :SKIP}
                      {:group :DiagnosticVirtualTextError
                       :fg colors.kat.red.base.color
                       :bg colors.kat.bg.umbra.color
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg (. (groups.umbraBG) 2)}
                      {:group :DiagnosticVirtualTextWarn
                       :fg colors.kat.red.match_bg.color
                       :bg colors.kat.bg.umbra.color
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg (. (groups.umbraBG) 2)}
                      {:group :DiagnosticVirtualTextInfo
                       :fg colors.kat.orange.base.color
                       :bg colors.kat.bg.umbra.color
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg (. (groups.umbraBG) 2)}
                      {:group :DiagnosticVirtualTextHint
                       :fg colors.kat.green.auto.color
                       :bg colors.kat.bg.umbra.color
                       :ctermfg (. (groups.auxBG) 2)
                       :ctermbg (. (groups.umbraBG) 2)}
                      {:group :DiagnosticFloatingError
                       :fg colors.kat.red.base.color
                       :bg colors.kat.bg.shadow.color
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg (. (groups.umbraBG) 2)}
                      {:group :DiagnosticFloatingWarn
                       :fg colors.kat.red.match_bg.color
                       :bg colors.kat.bg.shadow.color
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg (. (groups.umbraBG) 2)}
                      {:group :DiagnosticFloatingInfo
                       :fg colors.kat.orange.base.color
                       :bg colors.kat.bg.shadow.color
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg (. (groups.umbraBG) 2)}
                      {:group :DiagnosticFloatingHint
                       :fg colors.kat.green.auto.color
                       :bg colors.kat.bg.shadow.color
                       :ctermfg (. (groups.auxBG) 2)
                       :ctermbg (. (groups.umbraBG) 2)}
                      {:group :DiagnosticSignError
                       :fg colors.kat.red.base.color
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :DiagnosticSignWarn
                       :fg colors.kat.red.match_bg.color
                       :bg :SKIP
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :DiagnosticSignInfo
                       :fg colors.kat.orange.base.color
                       :bg :SKIP
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :DiagnosticSignHint
                       :fg colors.kat.green.auto.color
                       :bg :SKIP
                       :ctermfg (. (groups.auxBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :DiagnosticUnderlineError
                       :fg :SKIP
                       :bg :SKIP
                       :ctermfg :SKIP
                       :ctermbg :NONE
                       :underline true
                       :sp colors.kat.red.base.color}
                      {:group :DiagnosticUnderlineWarn
                       :fg :SKIP
                       :bg :SKIP
                       :ctermfg :SKIP
                       :ctermbg :NONE
                       :underline true
                       :sp colors.kat.red.match_bg.color}
                      {:group :DiagnosticUnderlineInfo
                       :fg :SKIP
                       :bg :SKIP
                       :ctermfg :SKIP
                       :ctermbg :NONE
                       :underline true
                       :sp colors.kat.orange.base.color}
                      {:group :DiagnosticUnderlineHint
                       :fg :SKIP
                       :bg :SKIP
                       :ctermfg :SKIP
                       :ctermbg :NONE
                       :underline true
                       :sp colors.kat.green.auto.color}])

(defn init [] (run.highlight$<-table (high-colors)))
