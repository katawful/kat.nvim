(module katdotnvim.exported.integrations.treesitter-dark-soft
  {autoload {run katdotnvim.utils.highlight.run}})
(defn render []
 [
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 6
   :fg "#9086c4"
   :group "TSField"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 1
   :fg "#c56d76"
   :group "TSFuncBuiltin"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 1
   :fg "#87b9d5"
   :group "TSFuncMacro"
   :italic true}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 1
   :fg "#cd7b83"
   :group "TSMethod"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 4
   :fg "#5594a8"
   :group "TSVariableBuiltin"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 2 :fg "#44e4c6" :group "TSNamespace"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 8
   :fg "#78cce8"
   :group "TSParameterReference"}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 14
   :fg "#737e8a"
   :group "TSAnnotation"
   :italic true}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 8 :fg "#78aab8" :group "TSNote"}
  {:bg "#ae4148" :ctermbg 9 :ctermfg 7 :fg "#f0f8fb" :group "TSWarning"}
  {:bg "#ec6363"
   :ctermbg 1
   :ctermfg 7
   :fg "#f0f8fb"
   :group "TSDanger"
   :italic true}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 3 :fg "#ee7351" :group "TSConstructor"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 11
   :fg "#755428"
   :group "TSTypeBuiltin"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 12 :fg "#b47299" :group "TSConstBuiltin"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 13 :fg "#7f8abd" :group "TSConstMacro"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 2
   :fg "#56cb9e"
   :group "TSKeywordFunction"
   :italic true}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 12
   :fg "#49b7dd"
   :group "TSKeywordReturn"
   :italic true}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 1
   :fg "#7a8d98"
   :group "TSKeywordOperator"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 14
   :fg "#9262aa"
   :group "TSPunctDelimiter"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 6
   :fg "#e4d6e7"
   :group "TSPunctBracket"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 13
   :fg "#d98caf"
   :group "TSPunctSpecial"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 9
   :fg "#d93546"
   :group "TSTagDelimiter"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 4
   :fg "#178c91"
   :group "TSStringRegex"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 1
   :fg "#bc504a"
   :group "TSStringEscape"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 6 :fg "#4955b2" :group "TSSymbol"}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 15
   :fg "#daf6ff"
   :group "TSTextReference"
   :italic true}
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 3
   :fg "#f2b15c"
   :group "TSURI"
   :underline true}])
(defn init [] (run.highlight$<-table (render))
  (vim.cmd "hi def link TSVariable Variable")
  (vim.cmd "hi def link TSProperty TSField")
  (vim.cmd "hi def link TSParameter Variable"))