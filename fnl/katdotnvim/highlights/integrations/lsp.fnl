(module katdotnvim.highlights.integrations.lsp
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main}})

; This handles the builtin LSP colors

(defn init []
  (ucolors.highlight :LspReferenceText :SKIP (groups.fillBG))
  (ucolors.highlight :LspReferenceRead :SKIP (groups.fillBG))
  (ucolors.highlight :LspReferenceWrite :SKIP (groups.fillBG))
  (ucolors.highlight :LspCodeLens (groups.meldBG) :SKIP)
  (ucolors.highlight :LspSignatureActiveParameter (groups.selectionBG) :SKIP)

  (if (= (vim.fn.has :nvim-0.6.0) 0)
      (do
        (ucolors.highlight :LspDiagnosticsDefaultError (groups.errorBG) :SKIP)
        (ucolors.highlight :LspDiagnosticsDefaultWarning (groups.warningBG) :SKIP)
        (ucolors.highlight :LspDiagnosticsDefaultInformation (groups.infoBG) :SKIP)
        (ucolors.highlight :LspDiagnosticsDefaultHint (groups.auxBG) :SKIP)

        (ucolors.highlight :LspDiagnosticsError (groups.errorBG) :SKIP)
        (ucolors.highlight :LspDiagnosticsWarn (groups.warningBG) :SKIP)
        (ucolors.highlight :LspDiagnosticsInfo (groups.infoBG) :SKIP)
        (ucolors.highlight :LspDiagnosticsHint (groups.auxBG) :SKIP)

        (ucolors.highlight :LspDiagnosticsVirtualTextError (groups.errorBG) (groups.shadowBG))
        (ucolors.highlight :LspDiagnosticsVirtualTextWarning (groups.warningBG) (groups.shadowBG))
        (ucolors.highlight :LspDiagnosticsVirtualTextInformation (groups.infoBG) (groups.shadowBG))
        (ucolors.highlight :LspDiagnosticsVirtualTextHint (groups.auxBG) (groups.shadowBG))

        (ucolors.highlight :LspDiagnosticsFloatingError (groups.errorBG) (groups.umbraBG))
        (ucolors.highlight :LspDiagnosticsFloatingWarning (groups.warningBG) (groups.umbraBG))
        (ucolors.highlight :LspDiagnosticsFloatingInformation (groups.infoBG) (groups.umbraBG))
        (ucolors.highlight :LspDiagnosticsFloatingHint (groups.auxBG) (groups.umbraBG))

        (ucolors.highlight :LspDiagnosticsSignError (groups.errorBG) :SKIP :bold)
        (ucolors.highlight :LspDiagnosticsSignWarning (groups.warningBG) :SKIP :bold)
        (ucolors.highlight :LspDiagnosticsSignInformation (groups.infoBG) :SKIP :bold)
        (ucolors.highlight :LspDiagnosticsSignHint (groups.auxBG) :SKIP :bold)

        (ucolors.highlight :LspDiagnosticsUnderlineError (groups.errorBG) :SKIP :underline (groups.errorBG))
        (ucolors.highlight :LspDiagnosticsUnderlineWarning (groups.warningBG) :SKIP :underline (groups.warningBG))
        (ucolors.highlight :LspDiagnosticsUnderlineInformation (groups.infoBG) :SKIP :underline (groups.infoBG))
        (ucolors.highlight :LspDiagnosticsUnderlineHint (groups.auxBG) :SKIP :underline (groups.auxBG)))
      (do
        (ucolors.highlight :DiagnosticError (groups.errorBG) :SKIP)
        (ucolors.highlight :DiagnosticWarn (groups.warningBG) :SKIP)
        (ucolors.highlight :DiagnosticInfo (groups.infoBG) :SKIP)
        (ucolors.highlight :DiagnosticHint (groups.auxBG) :SKIP)

        (ucolors.highlight :DiagnosticVirtualTextError (groups.errorBG) (groups.umbraBG))
        (ucolors.highlight :DiagnosticVirtualTextWarn (groups.warningBG) (groups.umbraBG))
        (ucolors.highlight :DiagnosticVirtualTextInfo (groups.infoBG) (groups.umbraBG))
        (ucolors.highlight :DiagnosticVirtualTextHint (groups.auxBG) (groups.umbraBG))

        (ucolors.highlight :DiagnosticFloatingError (groups.errorBG) (groups.shadowBG))
        (ucolors.highlight :DiagnosticFloatingWarn (groups.warningBG) (groups.shadowBG))
        (ucolors.highlight :DiagnosticFloatingInfo (groups.infoBG) (groups.shadowBG))
        (ucolors.highlight :DiagnosticFloatingHint (groups.auxBG) (groups.shadowBG))

        (ucolors.highlight :DiagnosticSignError (groups.errorBG) :SKIP :bold)
        (ucolors.highlight :DiagnosticSignWarn (groups.warningBG) :SKIP :bold)
        (ucolors.highlight :DiagnosticSignInfo (groups.infoBG) :SKIP :bold)
        (ucolors.highlight :DiagnosticSignHint (groups.auxBG) :SKIP :bold)

        (ucolors.highlight :DiagnosticUnderlineError :SKIP :SKIP :underline (groups.errorBG))
        (ucolors.highlight :DiagnosticUnderlineWarn :SKIP :SKIP :underline (groups.warningBG))
        (ucolors.highlight :DiagnosticUnderlineInfo :SKIP :SKIP :underline (groups.infoBG))
        (ucolors.highlight :DiagnosticUnderlineHint :SKIP :SKIP :underline (groups.auxBG)))))
