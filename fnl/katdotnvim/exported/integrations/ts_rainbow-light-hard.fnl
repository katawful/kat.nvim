(module katdotnvim.exported.integrations.ts_rainbow-light-hard
  {autoload {run katdotnvim.utils.highlight.run}})
(defn render []
 [
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 1 :fg "#d05561" :group "rainbowcol1"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 2 :fg "#d597b4" :group "rainbowcol2"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 3 :fg "#755dad" :group "rainbowcol3"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 4 :fg "#38a4ce" :group "rainbowcol4"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 5 :fg "#37ceae" :group "rainbowcol5"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 6 :fg "#d5a870" :group "rainbowcol6"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 7 :fg "#21313f" :group "rainbowcol7"}])
(defn init [] (run.highlight$<-table (render)))