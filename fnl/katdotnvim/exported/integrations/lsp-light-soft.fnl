(module katdotnvim.exported.integrations.lsp-light-soft
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

  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 8 :fg "#537680" :group "LspCodeLens"}

  {:bg "SKIP"
 :ctermbg "SKIP"
 :ctermfg 4
 :fg "#2dacd2"
 :group "LspSignatureActiveParameter"}

  [{:bg "SKIP" :ctermbg "SKIP" :ctermfg 1 :fg "#eb4949" :group "DiagnosticError"}
 {:bg "SKIP" :ctermbg "SKIP" :ctermfg 9 :fg "#d9757a" :group "DiagnosticWarn"}
 {:bg "SKIP" :ctermbg "SKIP" :ctermfg 3 :fg "#f2b15c" :group "DiagnosticInfo"}
 {:bg "SKIP" :ctermbg "SKIP" :ctermfg 3 :fg "#f2b15c" :group "DiagnosticHint"}
 {:bg "#daf6ff"
  :ctermbg 8
  :ctermfg 1
  :fg "#eb4949"
  :group "DiagnosticVirtualTextError"}
 {:bg "#daf6ff"
  :ctermbg 8
  :ctermfg 9
  :fg "#d9757a"
  :group "DiagnosticVirtualTextWarn"}
 {:bg "#daf6ff"
  :ctermbg 8
  :ctermfg 3
  :fg "#f2b15c"
  :group "DiagnosticVirtualTextInfo"}
 {:bg "#daf6ff"
  :ctermbg 8
  :ctermfg 2
  :fg "#006c4f"
  :group "DiagnosticVirtualTextHint"}
 {:bg "#78aab8"
  :ctermbg 8
  :ctermfg 1
  :fg "#eb4949"
  :group "DiagnosticFloatingError"}
 {:bg "#78aab8"
  :ctermbg 8
  :ctermfg 9
  :fg "#d9757a"
  :group "DiagnosticFloatingWarn"}
 {:bg "#78aab8"
  :ctermbg 8
  :ctermfg 3
  :fg "#f2b15c"
  :group "DiagnosticFloatingInfo"}
 {:bg "#78aab8"
  :ctermbg 8
  :ctermfg 2
  :fg "#006c4f"
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
  :fg "#d9757a"
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
  :fg "#006c4f"
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
  :sp "#d9757a"
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
  :sp "#006c4f"
  :underline true}]
])
(defn init [] (run.highlight$<-table (render)))