(module katdotnvim.highlights.lsp
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main
                   }})

; This handles the builtin LSP colors

(defn init []
  (ucolors.highlight :LspReferenceText :SKIP (groups.fillBG))
  (ucolors.highlight :LspReferenceRead :SKIP (groups.fillBG))
  (ucolors.highlight :LspReferenceWrite :SKIP (groups.fillBG))

  (ucolors.highlight :DiagnosticError (groups.errorBG) :SKIP)
  (ucolors.highlight :DiagnosticWarn (groups.warningBG) :SKIP)
  (ucolors.highlight :DiagnosticInfo (groups.infoBG) :SKIP)
  (ucolors.highlight :DiagnosticHint (groups.auxBG) :SKIP)

  (ucolors.highlight :LspDiagnosticsDefaultError (groups.errorBG) :SKIP)
  (ucolors.highlight :LspDiagnosticDefaultWarning (groups.warningBG) :SKIP)
  (ucolors.highlight :LspDiagnosticDefaultInformation (groups.infoBG) :SKIP)
  (ucolors.highlight :LspDiagnosticDefaultHint (groups.auxBG) :SKIP)
  (ucolors.highlight :LspSignatureActiveParameter (groups.selectionBG) :SKIP)

  (ucolors.highlight :LspDiagnosticsError (groups.errorBG) :SKIP)
  (ucolors.highlight :LspDiagnosticsWarn (groups.warningBG) :SKIP)
  (ucolors.highlight :LspDiagnosticsInfo (groups.infoBG) :SKIP)
  (ucolors.highlight :LspDiagnosticsHint (groups.auxBG) :SKIP)

  (ucolors.highlight :LspDiagnosticsVirtualTextError (groups.errorBG) :SKIP)
  (ucolors.highlight :LspDiagnosticsVirtualTextWarning (groups.warningBG) :SKIP)
  (ucolors.highlight :LspDiagnosticsVirtualTextInformation (groups.infoBG) :SKIP)
  (ucolors.highlight :LspDiagnosticsVirtualTextHint (groups.auxBG) :SKIP)

  (ucolors.highlight :LspDiagnosticsFloatingError (groups.errorBG) (groups.umbraBG))
  (ucolors.highlight :LspDiagnosticsFloatingWarning (groups.warningBG) (groups.umbraBG))
  (ucolors.highlight :LspDiagnosticsFloatingInformation (groups.infoBG) (groups.umbraBG))
  (ucolors.highlight :LspDiagnosticsFloatingHint (groups.auxBG) (groups.umbraBG))

  (ucolors.highlight :LspDiagnosticsSignError (groups.errorBG) :SKIP)
  (ucolors.highlight :LspDiagnosticsSignWarning (groups.warningBG) :SKIP)
  (ucolors.highlight :LspDiagnosticsSignInformation (groups.infoBG) :SKIP)
  (ucolors.highlight :LspDiagnosticsSignHint (groups.auxBG) :SKIP)

  (ucolors.highlight :LspDiagnosticsUnderlineError (groups.errorBG) :SKIP :underline (groups.errorBG))
  (ucolors.highlight :LspDiagnosticsUnderlineWarning (groups.warningBG) :SKIP :underline (groups.warningBG))
  (ucolors.highlight :LspDiagnosticsUnderlineInformation (groups.infoBG) :SKIP :underline (groups.infoBG))
  (ucolors.highlight :LspDiagnosticsUnderlineHint (groups.auxBG) :SKIP :underline (groups.auxBG))

  (ucolors.highlight :LspCodeLens (groups.meldBG) :SKIP)
  )
