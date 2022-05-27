(module katdotnvim.exported.syntax-light-hard
  {autoload {run katdotnvim.utils.highlight.run}})
(defn render []
 [
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 12
   :fg "#537680"
   :group "Comment"
   :italic true}

  {:bg "SKIP"   :ctermbg "SKIP"   :ctermfg 5   :fg "#f29cb1"   :group "Constant"}

  {:bg "SKIP"   :ctermbg "SKIP"   :ctermfg 10   :fg "#006c4f"   :group "String"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 10
   :fg "#09443e"
   :group "Character"}

  {:bg "SKIP"   :ctermbg "SKIP"   :ctermfg 5   :fg "#f29cb1"   :group "Number"}

  {:bg "SKIP"   :ctermbg "SKIP"   :ctermfg 13   :fg "#af7689"   :group "Float"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 12
   :fg "#2581a1"
   :group "Boolean"}

  {:bg "SKIP"   :ctermbg "SKIP"   :ctermfg 12   :fg "#237a93"   :group "Identifier"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 9
   :fg "#d94f5e"
   :group "Function"}

  [{:bg "SKIP"   :ctermbg "SKIP"   :ctermfg 4   :fg "#4a6672"   :group "Variable"}]

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 1
   :fg "#eb4949"
   :group "Statement"}

  {:bg "SKIP"   :ctermbg "SKIP"   :ctermfg 6   :fg "#a45ca8"   :group "Conditional"}

  {:bg "SKIP"   :ctermbg "SKIP"   :ctermfg 3   :fg "#ffb788"   :group "Repeat"}

  {:bg "SKIP"   :bold true   :ctermbg "SKIP"   :ctermfg 5   :fg "#ff8299"   :group "Label"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 7
   :fg "#7d79a8"
   :group "Operator"}

  [{:bg "SKIP"
    :ctermbg "SKIP"
    :ctermfg 10
    :fg "#153527"
    :group "Keyword"
    :italic true}]

  {:bg "SKIP"   :ctermbg "SKIP"   :ctermfg 4   :fg "#49b7dd"   :group "Exception"}

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

  {:bg "SKIP"   :bold true   :ctermbg "SKIP"   :ctermfg 3   :fg "#f2b15c"   :group "Type"}

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

  {:bg "SKIP"   :ctermbg "SKIP"   :ctermfg 13   :fg "#c882ae"   :group "Special"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 13
   :fg "#a46e94"
   :group "SpecialChar"}

  {:bg "SKIP"   :bold true   :ctermbg "SKIP"   :ctermfg 13   :fg "#e4545d"   :group "Tag"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 13
   :fg "#36303e"
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

  {:bg "#eb4949"   :bold true   :ctermbg 1   :ctermfg 7   :fg "#121c2d"   :group "Error"}

  {:bg "#dca257"   :ctermbg 3   :ctermfg 0   :fg "#daf6ff"   :group "Todo"}

  {:bg "SKIP"   :ctermbg "SKIP"   :ctermfg 15   :fg "#6285c0"   :group "Ignore"}

  {:bg "#c23030"
   :bold true
   :ctermbg 1
   :ctermfg 7
   :fg "#121c2d"
   :group "DiffDelete"}

  {:bg "#006c4f"   :bold true   :ctermbg 2   :ctermfg 7   :fg "SKIP"   :group "DiffAdd"}

  {:bg "#7a53a8"   :bold true   :ctermbg 6   :ctermfg 7   :fg "SKIP"   :group "DiffChange"}

  {:bg "#2dacd2"   :bold true   :ctermbg 4   :ctermfg 7   :fg "SKIP"   :group "DiffText"}

  {:bg "#57a395"
   :bold true
   :ctermbg 10
   :ctermfg 7
   :fg "#0b3c3b"
   :group "diffAdded"}

  {:bg "#72cae4"
   :bold true
   :ctermbg 12
   :ctermfg 7
   :fg "#1d566f"
   :group "diffChanged"}

  {:bg "#e48e92"
   :bold true
   :ctermbg 9
   :ctermfg 7
   :fg "#692e38"
   :group "diffRemoved"}
])
(defn init [] (run.highlight$<-table (render)))