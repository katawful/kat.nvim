(module katdotnvim.exported.integrations.coc-dark-hard
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
   :fg "#aa3c41"
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
   :fg "#7df9ca"
   :group "CocHintSign"}
  {:bg "#202f47" :ctermbg 8 :ctermfg 1 :fg "#eb4949" :group "CocErrorFloat"}
  {:bg "#202f47" :ctermbg 8 :ctermfg 9 :fg "#aa3c41" :group "CocWarningFloat"}
  {:bg "#202f47" :ctermbg 8 :ctermfg 3 :fg "#f2b15c" :group "CocInfoFloat"}
  {:bg "#202f47" :ctermbg 8 :ctermfg 2 :fg "#7df9ca" :group "CocHintFloat"}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 1
   :fg "#eb4949"
   :group "CocDiagnosticsError"}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 9
   :fg "#aa3c41"
   :group "CocDiagnosticsWarning"}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 3
   :fg "#f2b15c"
   :group "CocDiagnosticsInfo"}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 2
   :fg "#7df9ca"
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
   :sp "#aa3c41"
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
   :sp "#7df9ca"
   :undercurl true}
  {:bg "#c23030" :ctermbg 9 :ctermfg "SKIP" :fg "SKIP" :group "CocSelectedText"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 15 :fg "#6285c0" :group "CocCodeLens"}])
(defn init [] (run.highlight$<-table (render)))
