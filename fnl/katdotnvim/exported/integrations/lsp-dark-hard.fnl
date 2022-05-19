(module katdotnvim.exported.integrations.lsp-dark-hard
  {autoload {run katdotnvim.utils.highlight.run}})
(defn render []
  [
   {:bg "#f29cb1" :ctermbg 5 :ctermfg "SKIP" :fg "SKIP" :group "LspReferenceText"}
   {:bg "#f29cb1" :ctermbg 5 :ctermfg "SKIP" :fg "SKIP" :group "LspReferenceRead"}
   {:bg "#f29cb1"
    :ctermbg 5
    :ctermfg "SKIP"
    :fg "SKIP"
    :group "LspReferenceWrite"}
   {:bg "SKIP" :ctermbg "SKIP" :ctermfg 8 :fg "#6285c0" :group "LspCodeLens"}
   {:bg "SKIP"
    :ctermbg "SKIP"
    :ctermfg 4
    :fg "#2dacd2"
    :group "LspSignatureActiveParameter"}
   {:bg "SKIP" :ctermbg "SKIP" :ctermfg 1 :fg "#eb4949" :group "DiagnosticError"}
   {:bg "SKIP" :ctermbg "SKIP" :ctermfg 9 :fg "#aa3c41" :group "DiagnosticWarn"}
   {:bg "SKIP" :ctermbg "SKIP" :ctermfg 3 :fg "#f2b15c" :group "DiagnosticInfo"}
   {:bg "SKIP" :ctermbg "SKIP" :ctermfg 3 :fg "#f2b15c" :group "DiagnosticHint"}
   {:bg "#202f47"
    :ctermbg 8
    :ctermfg 1
    :fg "#eb4949"
    :group "DiagnosticVirtualTextError"}
   {:bg "#202f47"
    :ctermbg 8
    :ctermfg 9
    :fg "#aa3c41"
    :group "DiagnosticVirtualTextWarn"}
   {:bg "#202f47"
    :ctermbg 8
    :ctermfg 3
    :fg "#f2b15c"
    :group "DiagnosticVirtualTextInfo"}
   {:bg "#202f47"
    :ctermbg 8
    :ctermfg 2
    :fg "#7df9ca"
    :group "DiagnosticVirtualTextHint"}
   {:bg "#405881"
    :ctermbg 8
    :ctermfg 1
    :fg "#eb4949"
    :group "DiagnosticFloatingError"}
   {:bg "#405881"
    :ctermbg 8
    :ctermfg 9
    :fg "#aa3c41"
    :group "DiagnosticFloatingWarn"}
   {:bg "#405881"
    :ctermbg 8
    :ctermfg 3
    :fg "#f2b15c"
    :group "DiagnosticFloatingInfo"}
   {:bg "#405881"
    :ctermbg 8
    :ctermfg 2
    :fg "#7df9ca"
    :group "DiagnosticFloatingHint"}
   {:bg "SKIP"
    :bold true
    :ctermbg "SKIP"
    :ctermfg 1
    :fg "#eb4949"
    :group "DiagnosticSignError"}
   {:bg "SKIP"
    :bold true
    :ctermbg "SKIP"
    :ctermfg 9
    :fg "#aa3c41"
    :group "DiagnosticSignWarn"}
   {:bg "SKIP"
    :bold true
    :ctermbg "SKIP"
    :ctermfg 3
    :fg "#f2b15c"
    :group "DiagnosticSignInfo"}
   {:bg "SKIP"
    :bold true
    :ctermbg "SKIP"
    :ctermfg 2
    :fg "#7df9ca"
    :group "DiagnosticSignHint"}
   {:bg "SKIP"
    :ctermbg "NONE"
    :ctermfg "SKIP"
    :fg "SKIP"
    :group "DiagnosticUnderlineError"
    :sp "#eb4949"
    :underline true}
   {:bg "SKIP"
    :ctermbg "NONE"
    :ctermfg "SKIP"
    :fg "SKIP"
    :group "DiagnosticUnderlineWarn"
    :sp "#aa3c41"
    :underline true}
   {:bg "SKIP"
    :ctermbg "NONE"
    :ctermfg "SKIP"
    :fg "SKIP"
    :group "DiagnosticUnderlineInfo"
    :sp "#f2b15c"
    :underline true}
   {:bg "SKIP"
     :ctermbg "NONE"
     :ctermfg "SKIP"
     :fg "SKIP"
     :group "DiagnosticUnderlineHint"
     :sp "#7df9ca"
     :underline true}])
(defn init [] (run.highlight$<-table (render)))
