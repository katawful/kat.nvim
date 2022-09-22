(module katdotnvim.highlights.integrations.lsp
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

; This handles the builtin LSP colors

(defn high-colors []
      [{:group :LspReferenceText
        :fg :SKIP
        :bg (. (groups.fillBG) 1)
        :ctermfg :SKIP
        :ctermbg (. (groups.fillBG) 2)}
       {:group :LspReferenceRead
        :fg :SKIP
        :bg (. (groups.fillBG) 1)
        :ctermfg :SKIP
        :ctermbg (. (groups.fillBG) 2)}
       {:group :LspReferenceWrite
        :fg :SKIP
        :bg (. (groups.fillBG) 1)
        :ctermfg :SKIP
        :ctermbg (. (groups.fillBG) 2)}
       {:group :LspCodeLens
        :fg (. (groups.meldBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.umbraBG) 2)
        :ctermbg :SKIP}
       {:group :LspSignatureActiveParameter
        :fg (. (groups.selectionBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.selectionBG) 2)
        :ctermbg :SKIP}
       {:group :DiagnosticError
        :fg (. (groups.errorBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.errorBG) 2)
        :ctermbg :SKIP}
       {:group :DiagnosticWarn
        :fg (. (groups.warningBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.warningBG) 2)
        :ctermbg :SKIP}
       {:group :DiagnosticInfo
        :fg (. (groups.infoBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.infoBG) 2)
        :ctermbg :SKIP}
       {:group :DiagnosticHint
        :fg (. (groups.infoBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.infoBG) 2)
        :ctermbg :SKIP}
       {:group :DiagnosticVirtualTextError
        :fg (. (groups.errorBG) 1)
        :bg (. (groups.umbraBG) 1)
        :ctermfg (. (groups.errorBG) 2)
        :ctermbg (. (groups.umbraBG) 2)}
       {:group :DiagnosticVirtualTextWarn
        :fg (. (groups.warningBG) 1)
        :bg (. (groups.umbraBG) 1)
        :ctermfg (. (groups.warningBG) 2)
        :ctermbg (. (groups.umbraBG) 2)}
       {:group :DiagnosticVirtualTextInfo
        :fg (. (groups.infoBG) 1)
        :bg (. (groups.umbraBG) 1)
        :ctermfg (. (groups.infoBG) 2)
        :ctermbg (. (groups.umbraBG) 2)}
       {:group :DiagnosticVirtualTextHint
        :fg (. (groups.auxBG) 1)
        :bg (. (groups.umbraBG) 1)
        :ctermfg (. (groups.auxBG) 2)
        :ctermbg (. (groups.umbraBG) 2)}
       {:group :DiagnosticFloatingError
        :fg (. (groups.errorBG) 1)
        :bg (. (groups.shadowBG) 1)
        :ctermfg (. (groups.errorBG) 2)
        :ctermbg (. (groups.umbraBG) 2)}
       {:group :DiagnosticFloatingWarn
        :fg (. (groups.warningBG) 1)
        :bg (. (groups.shadowBG) 1)
        :ctermfg (. (groups.warningBG) 2)
        :ctermbg (. (groups.umbraBG) 2)}
       {:group :DiagnosticFloatingInfo
        :fg (. (groups.infoBG) 1)
        :bg (. (groups.shadowBG) 1)
        :ctermfg (. (groups.infoBG) 2)
        :ctermbg (. (groups.umbraBG) 2)}
       {:group :DiagnosticFloatingHint
        :fg (. (groups.auxBG) 1)
        :bg (. (groups.shadowBG) 1)
        :ctermfg (. (groups.auxBG) 2)
        :ctermbg (. (groups.umbraBG) 2)}
       {:group :DiagnosticSignError
        :fg (. (groups.errorBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.errorBG) 2)
        :ctermbg :SKIP
        :bold true}
       {:group :DiagnosticSignWarn
        :fg (. (groups.warningBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.warningBG) 2)
        :ctermbg :SKIP
        :bold true}
       {:group :DiagnosticSignInfo
        :fg (. (groups.infoBG) 1)
        :bg :SKIP
        :ctermfg (. (groups.infoBG) 2)
        :ctermbg :SKIP
        :bold true}
       {:group :DiagnosticSignHint
        :fg (. (groups.auxBG) 1)
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
        :sp (. (groups.errorBG) 1)}
       {:group :DiagnosticUnderlineWarn
        :fg :SKIP
        :bg :SKIP
        :ctermfg :SKIP
        :ctermbg :NONE
        :underline true
        :sp (. (groups.warningBG) 1)}
       {:group :DiagnosticUnderlineInfo
        :fg :SKIP
        :bg :SKIP
        :ctermfg :SKIP
        :ctermbg :NONE
        :underline true
        :sp (. (groups.infoBG) 1)}
       {:group :DiagnosticUnderlineHint
        :fg :SKIP
        :bg :SKIP
        :ctermfg :SKIP
        :ctermbg :NONE
        :underline true
        :sp (. (groups.auxBG) 1)}])

(defn init [] (run.highlight$<-table (high-colors)))
