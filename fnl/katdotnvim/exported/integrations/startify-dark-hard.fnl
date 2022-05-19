(module katdotnvim.exported.integrations.startify-dark-hard
  {autoload {run katdotnvim.utils.highlight.run}})
(defn render []
 [
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 4
   :fg "#4899c9"
   :group "StartifyBracket"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 6
   :fg "#8d74b9"
   :group "StartifyFile"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 4
   :fg "#2dacd2"
   :group "StartifyNumber"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 4 :fg "#e0e5f4" :group "StartifyPath"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 7 :fg "#537680" :group "StartifySlash"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 9
   :fg "#e86c6d"
   :group "StartifySection"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 12 :fg "#e0e5f4" :group "StartifySpecial"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 5 :fg "#f29cb1" :group "StartifyHeader"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 4 :fg "#6285c0" :group "StartifyFooter"}])
(defn init [] (run.highlight$<-table (render)))
