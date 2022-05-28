(module katdotnvim.exported.integrations.lsp-dark-soft
        {autoload {run katdotnvim.utils.highlight.run}})

(defn render [] [(if (= vim.g.kat_nvim_max_version :0.6)
                     (values {:bg "#f29cb1"
                              :ctermbg 5
                              :ctermfg :SKIP
                              :fg :SKIP
                              :group :LspReferenceText}
                             {:bg "#f29cb1"
                              :ctermbg 5
                              :ctermfg :SKIP
                              :fg :SKIP
                              :group :LspReferenceRead}
                             {:bg "#f29cb1"
                              :ctermbg 5
                              :ctermfg :SKIP
                              :fg :SKIP
                              :group :LspReferenceWrite}
                             {:bg :SKIP
                              :ctermbg :SKIP
                              :ctermfg 8
                              :fg "#6285c0"
                              :group :LspCodeLens}
                             {:bg :SKIP
                              :ctermbg :SKIP
                              :ctermfg 4
                              :fg "#2dacd2"
                              :group :LspSignatureActiveParameter}
                             [{:bg :SKIP
                               :ctermbg :SKIP
                               :ctermfg 1
                               :fg "#eb4949"
                               :group :LspDiagnosticsDefaultError}
                              {:bg :SKIP
                               :ctermbg :SKIP
                               :ctermfg 9
                               :fg "#ae4148"
                               :group :LspDiagnosticsDefaultWarning}
                              {:bg :SKIP
                               :ctermbg :SKIP
                               :ctermfg 3
                               :fg "#f2b15c"
                               :group :LspDiagnosticsDefaultInformation}
                              {:bg :SKIP
                               :ctermbg :SKIP
                               :ctermfg 2
                               :fg "#7df9ca"
                               :group :LspDiagnosticsDefaultHint}
                              {:bg :SKIP
                               :ctermbg :SKIP
                               :ctermfg 1
                               :fg "#eb4949"
                               :group :LspDiagnosticsError}
                              {:bg :SKIP
                               :ctermbg :SKIP
                               :ctermfg 1
                               :fg "#eb4949"
                               :group :LspDiagnosticsWarn}
                              {:bg :SKIP
                               :ctermbg :SKIP
                               :ctermfg 1
                               :fg "#eb4949"
                               :group :LspDiagnosticsInfo}
                              {:bg :SKIP
                               :ctermbg :SKIP
                               :ctermfg 2
                               :fg "#7df9ca"
                               :group :LspDiagnosticsHint}
                              {:bg "#405881"
                               :ctermbg 8
                               :ctermfg 1
                               :fg "#eb4949"
                               :group :LspDiagnosticsVirtualTextError}
                              {:bg "#405881"
                               :ctermbg 8
                               :ctermfg 9
                               :fg "#ae4148"
                               :group :LspDiagnosticsVirtualTextWarning}
                              {:bg "#405881"
                               :ctermbg 8
                               :ctermfg 3
                               :fg "#f2b15c"
                               :group :LspDiagnosticsVirtualTextInformation}
                              {:bg "#405881"
                               :ctermbg 8
                               :ctermfg 2
                               :fg "#7df9ca"
                               :group :LspDiagnosticsVirtualTextHint}
                              {:bg "#121c2d"
                               :ctermbg 8
                               :ctermfg 1
                               :fg "#eb4949"
                               :group :LspDiagnosticsFloatingError}
                              {:bg "#121c2d"
                               :ctermbg 8
                               :ctermfg 9
                               :fg "#ae4148"
                               :group :LspDiagnosticsFloatingWarning}
                              {:bg "#121c2d"
                               :ctermbg 8
                               :ctermfg 3
                               :fg "#f2b15c"
                               :group :LspDiagnosticsFloatingInformation}
                              {:bg "#121c2d"
                               :ctermbg 8
                               :ctermfg 2
                               :fg "#7df9ca"
                               :group :LspDiagnosticsFloatingHint}
                              {:bg :SKIP
                               :bold true
                               :ctermbg :SKIP
                               :ctermfg 1
                               :fg "#eb4949"
                               :group :LspDiagnosticsSignError}
                              {:bg :SKIP
                               :bold true
                               :ctermbg :SKIP
                               :ctermfg 9
                               :fg "#ae4148"
                               :group :LspDiagnosticsSignWarning}
                              {:bg :SKIP
                               :bold true
                               :ctermbg :SKIP
                               :ctermfg 3
                               :fg "#f2b15c"
                               :group :LspDiagnosticsSignInformation}
                              {:bg :SKIP
                               :bold true
                               :ctermbg :SKIP
                               :ctermfg 2
                               :fg "#7df9ca"
                               :group :LspDiagnosticsSignHint}
                              {:bg :SKIP
                               :ctermbg :SKIP
                               :ctermfg 1
                               :fg "#eb4949"
                               :group :LspDiagnosticsUnderlineError
                               :sp "#eb4949"
                               :underline true}
                              {:bg :SKIP
                               :ctermbg :SKIP
                               :ctermfg 9
                               :fg "#ae4148"
                               :group :LspDiagnosticsUnderlineWarning
                               :sp "#ae4148"
                               :underline true}
                              {:bg :SKIP
                               :ctermbg :SKIP
                               :ctermfg 3
                               :fg "#f2b15c"
                               :group :LspDiagnosticsUnderlineInformation
                               :sp "#f2b15c"
                               :underline true}
                              {:bg :SKIP
                               :ctermbg :SKIP
                               :ctermfg 2
                               :fg "#7df9ca"
                               :group :LspDiagnosticsUnderlineHint
                               :sp "#7df9ca"
                               :underline true}])
                     (values {:bg "#f29cb1"
                              :ctermbg 5
                              :ctermfg :SKIP
                              :fg :SKIP
                              :group :LspReferenceText}
                             {:bg "#f29cb1"
                              :ctermbg 5
                              :ctermfg :SKIP
                              :fg :SKIP
                              :group :LspReferenceRead}
                             {:bg "#f29cb1"
                              :ctermbg 5
                              :ctermfg :SKIP
                              :fg :SKIP
                              :group :LspReferenceWrite}
                             {:bg :SKIP
                              :ctermbg :SKIP
                              :ctermfg 8
                              :fg "#6285c0"
                              :group :LspCodeLens}
                             {:bg :SKIP
                              :ctermbg :SKIP
                              :ctermfg 4
                              :fg "#2dacd2"
                              :group :LspSignatureActiveParameter}
                             [{:bg :SKIP
                               :ctermbg :SKIP
                               :ctermfg 1
                               :fg "#eb4949"
                               :group :DiagnosticError}
                              {:bg :SKIP
                               :ctermbg :SKIP
                               :ctermfg 9
                               :fg "#ae4148"
                               :group :DiagnosticWarn}
                              {:bg :SKIP
                               :ctermbg :SKIP
                               :ctermfg 3
                               :fg "#f2b15c"
                               :group :DiagnosticInfo}
                              {:bg :SKIP
                               :ctermbg :SKIP
                               :ctermfg 3
                               :fg "#f2b15c"
                               :group :DiagnosticHint}
                              {:bg "#121c2d"
                               :ctermbg 8
                               :ctermfg 1
                               :fg "#eb4949"
                               :group :DiagnosticVirtualTextError}
                              {:bg "#121c2d"
                               :ctermbg 8
                               :ctermfg 9
                               :fg "#ae4148"
                               :group :DiagnosticVirtualTextWarn}
                              {:bg "#121c2d"
                               :ctermbg 8
                               :ctermfg 3
                               :fg "#f2b15c"
                               :group :DiagnosticVirtualTextInfo}
                              {:bg "#121c2d"
                               :ctermbg 8
                               :ctermfg 2
                               :fg "#7df9ca"
                               :group :DiagnosticVirtualTextHint}
                              {:bg "#405881"
                               :ctermbg 8
                               :ctermfg 1
                               :fg "#eb4949"
                               :group :DiagnosticFloatingError}
                              {:bg "#405881"
                               :ctermbg 8
                               :ctermfg 9
                               :fg "#ae4148"
                               :group :DiagnosticFloatingWarn}
                              {:bg "#405881"
                               :ctermbg 8
                               :ctermfg 3
                               :fg "#f2b15c"
                               :group :DiagnosticFloatingInfo}
                              {:bg "#405881"
                               :ctermbg 8
                               :ctermfg 2
                               :fg "#7df9ca"
                               :group :DiagnosticFloatingHint}
                              {:bg :SKIP
                               :bold true
                               :ctermbg :SKIP
                               :ctermfg 1
                               :fg "#eb4949"
                               :group :DiagnosticSignError}
                              {:bg :SKIP
                               :bold true
                               :ctermbg :SKIP
                               :ctermfg 9
                               :fg "#ae4148"
                               :group :DiagnosticSignWarn}
                              {:bg :SKIP
                               :bold true
                               :ctermbg :SKIP
                               :ctermfg 3
                               :fg "#f2b15c"
                               :group :DiagnosticSignInfo}
                              {:bg :SKIP
                               :bold true
                               :ctermbg :SKIP
                               :ctermfg 2
                               :fg "#7df9ca"
                               :group :DiagnosticSignHint}
                              {:bg :SKIP
                               :ctermbg :NONE
                               :ctermfg :SKIP
                               :fg :SKIP
                               :group :DiagnosticUnderlineError
                               :sp "#eb4949"
                               :underline true}
                              {:bg :SKIP
                               :ctermbg :NONE
                               :ctermfg :SKIP
                               :fg :SKIP
                               :group :DiagnosticUnderlineWarn
                               :sp "#ae4148"
                               :underline true}
                              {:bg :SKIP
                               :ctermbg :NONE
                               :ctermfg :SKIP
                               :fg :SKIP
                               :group :DiagnosticUnderlineInfo
                               :sp "#f2b15c"
                               :underline true}
                              {:bg :SKIP
                               :ctermbg :NONE
                               :ctermfg :SKIP
                               :fg :SKIP
                               :group :DiagnosticUnderlineHint
                               :sp "#7df9ca"
                               :underline true}]))])

(defn init [] (run.highlight$<-table (render)))
