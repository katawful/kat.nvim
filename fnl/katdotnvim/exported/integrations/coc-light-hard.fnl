(module katdotnvim.exported.integrations.coc-light-hard
  {autoload {run katdotnvim.utils.highlight.run}})
(defn render []
 [
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 1
   :fg "#eb4949"
   :group "CocErrorSign"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 9
   :fg "#e67d80"
   :group "CocWarningSign"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 3
   :fg "#f2b15c"
   :group "CocInfoSign"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 2
   :fg "#006c4f"
   :group "CocHintSign"}
  {:bg "#b0ddeb" :ctermbg 8 :ctermfg 1 :fg "#eb4949" :group "CocErrorFloat"}
  {:bg "#b0ddeb" :ctermbg 8 :ctermfg 9 :fg "#e67d80" :group "CocWarningFloat"}
  {:bg "#b0ddeb" :ctermbg 8 :ctermfg 3 :fg "#f2b15c" :group "CocInfoFloat"}
  {:bg "#b0ddeb" :ctermbg 8 :ctermfg 2 :fg "#006c4f" :group "CocHintFloat"}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 1
   :fg "#eb4949"
   :group "CocDiagnosticsError"}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 9
   :fg "#e67d80"
   :group "CocDiagnosticsWarning"}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 3
   :fg "#f2b15c"
   :group "CocDiagnosticsInfo"}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 2
   :fg "#006c4f"
   :group "CocDiagnosticsHint"}
  {:bg "SKIP"
   :ctermbg "NONE"
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "CocErrorHighlight"
   :sp "#eb4949"
   :undercurl true}
  {:bg "SKIP"
   :ctermbg "NONE"
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "CocWarningHighlight"
   :sp "#e67d80"
   :undercurl true}
  {:bg "SKIP"
   :ctermbg "NONE"
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "CocInfoHighlight"
   :sp "#f2b15c"
   :undercurl true}
  {:bg "SKIP"
   :ctermbg "NONE"
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "CocHintHighlight"
   :sp "#006c4f"
   :undercurl true}
  {:bg "#c23030" :ctermbg 9 :ctermfg "SKIP" :fg "SKIP" :group "CocSelectedText"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 15 :fg "#537680" :group "CocCodeLens"}])
(defn init [] (run.highlight$<-table (render)))
