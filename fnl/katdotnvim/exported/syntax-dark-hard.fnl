(module katdotnvim.exported.syntax-dark-hard
  {autoload {run katdotnvim.utils.highlight.run}})
(defn render []
 [
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 12
   :fg "#6285c0"
   :group "Comment"
   :italic true}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 5 :fg "#f29cb1" :group "Constant"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 10 :fg "#7df9ca" :group "String"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 10
   :fg "#abf8e4"
   :group "Character"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 5 :fg "#f29cb1" :group "Number"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 13 :fg "#ebb7c8" :group "Float"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 12
   :fg "#61c2e0"
   :group "Boolean"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 12 :fg "#6cc0de" :group "Identifier"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 9
   :fg "#de717c"
   :group "Function"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 4 :fg "#65abc4" :group "Variable"}
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
   :fg "#716d75"
   :group "Operator"}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 10
   :fg "#b1f1cc"
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
   :fg "#94e6c5"
   :group "PreCondit"
   :italic true}
  {:bg "SKIP" :bold true :ctermbg "SKIP" :ctermfg 3 :fg "#f2b15c" :group "Type"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 3
   :fg "#94ebb4"
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
   :fg "#ebd9cf"
   :group "Typedef"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 13 :fg "#c882ae" :group "Special"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 13
   :fg "#cc99be"
   :group "SpecialChar"}
  {:bg "SKIP" :bold true :ctermbg "SKIP" :ctermfg 13 :fg "#e4545d" :group "Tag"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 13
   :fg "#dad4e8"
   :group "Delimiter"}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 13
   :fg "#7684bc"
   :group "SpecialComment"
   :italic true}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 13
   :fg "#8ce1c4"
   :group "Debug"}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 15
   :fg "#e0e5f4"
   :group "Underlined"
   :sp "#e0e5f4"
   :underline true}
  {:bg "#eb4949" :bold true :ctermbg 1 :ctermfg 7 :fg "#daf6ff" :group "Error"}
  {:bg "#f0b86c" :ctermbg 3 :ctermfg 0 :fg "#121c2d" :group "Todo"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 15 :fg "#537680" :group "Ignore"}
  {:bg "#c23030"
   :bold true
   :ctermbg 1
   :ctermfg 7
   :fg "#daf6ff"
   :group "DiffDelete"}
  {:bg "#7df9ca" :bold true :ctermbg 2 :ctermfg 7 :fg "SKIP" :group "DiffAdd"}
  {:bg "#7a53a8" :bold true :ctermbg 6 :ctermfg 7 :fg "SKIP" :group "DiffChange"}
  {:bg "#2dacd2" :bold true :ctermbg 4 :ctermfg 7 :fg "SKIP" :group "DiffText"}
  {:bg "#52a18b"
   :bold true
   :ctermbg 10
   :ctermfg 7
   :fg "#b5f7ea"
   :group "diffAdded"}
  {:bg "#227290"
   :bold true
   :ctermbg 12
   :ctermfg 7
   :fg "#95d8ed"
   :group "diffChanged"}
  {:bg "#94373e"
   :bold true
   :ctermbg 9
   :ctermfg 7
   :fg "#e1b1b6"
   :group "diffRemoved"}])
(defn init [] (run.highlight$<-table (render)))