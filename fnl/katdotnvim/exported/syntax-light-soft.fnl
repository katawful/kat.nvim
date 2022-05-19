(module katdotnvim.exported.syntax-light-soft
  {autoload {run katdotnvim.utils.highlight.run}})
(defn render []
 [
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 12
   :fg "#537680"
   :group "Comment"
   :italic true}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 5 :fg "#f29cb1" :group "Constant"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 10 :fg "#006c4f" :group "String"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 10
   :fg "#104e4b"
   :group "Character"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 5 :fg "#f29cb1" :group "Number"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 13 :fg "#b37b91" :group "Float"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 12
   :fg "#2987a8"
   :group "Boolean"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 12 :fg "#237a93" :group "Identifier"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 9
   :fg "#d94f5e"
   :group "Function"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 4 :fg "#4a6672" :group "Variable"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 1
   :fg "#eb4949"
   :group "Statement"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 6 :fg "#a45ca8" :group "Conditional"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 3 :fg "#ffb788" :group "Repeat"}
  {:bg "SKIP" :bold true :ctermbg "SKIP" :ctermfg 5 :fg "#ff8299" :group "Label"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 7
   :fg "#7d79a8"
   :group "Operator"}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 10
   :fg "#153527"
   :group "Keyword"
   :italic true}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 4 :fg "#49b7dd" :group "Exception"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 5
   :fg "#f29cb1"
   :group "PreProc"
   :italic true}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 5
   :fg "#ec5a5e"
   :group "Include"
   :italic true}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 14
   :fg "#9262aa"
   :group "Define"
   :italic true}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 12
   :fg "#54a9cb"
   :group "Macro"
   :italic true}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 10
   :fg "#307663"
   :group "PreCondit"
   :italic true}
  {:bg "SKIP" :bold true :ctermbg "SKIP" :ctermfg 3 :fg "#f2b15c" :group "Type"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 3
   :fg "#307a52"
   :group "StorageClass"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 3
   :fg "#54adba"
   :group "Structure"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 3
   :fg "#413a16"
   :group "Typedef"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 13 :fg "#c882ae" :group "Special"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 13
   :fg "#a67199"
   :group "SpecialChar"}
  {:bg "SKIP" :bold true :ctermbg "SKIP" :ctermfg 13 :fg "#e4545d" :group "Tag"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 13
   :fg "#383442"
   :group "Delimiter"}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 13
   :fg "#6a7889"
   :group "SpecialComment"
   :italic true}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 13
   :fg "#287062"
   :group "Debug"}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 15
   :fg "#111c1f"
   :group "Underlined"
   :sp "#111c1f"
   :underline true}
  {:bg "#eb4949" :bold true :ctermbg 1 :ctermfg 7 :fg "#202f47" :group "Error"}
  {:bg "#dda45a" :ctermbg 3 :ctermfg 0 :fg "#b0ddeb" :group "Todo"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 15 :fg "#6285c0" :group "Ignore"}
  {:bg "#c23030"
   :bold true
   :ctermbg 1
   :ctermfg 7
   :fg "#202f47"
   :group "DiffDelete"}
  {:bg "#006c4f" :bold true :ctermbg 2 :ctermfg 7 :fg "SKIP" :group "DiffAdd"}
  {:bg "#7a53a8" :bold true :ctermbg 6 :ctermfg 7 :fg "SKIP" :group "DiffChange"}
  {:bg "#2dacd2" :bold true :ctermbg 4 :ctermfg 7 :fg "SKIP" :group "DiffText"}
  {:bg "#46998d"
   :bold true
   :ctermbg 10
   :ctermfg 7
   :fg "#13474a"
   :group "diffAdded"}
  {:bg "#61c0dc"
   :bold true
   :ctermbg 12
   :ctermfg 7
   :fg "#25617f"
   :group "diffChanged"}
  {:bg "#d3848a"
   :bold true
   :ctermbg 9
   :ctermfg 7
   :fg "#713948"
   :group "diffRemoved"}])
(defn init [] (run.highlight$<-table (render)))
