(module katdotnvim.exported.filetype.markdown-light-soft
  {autoload {run katdotnvim.utils.highlight.run}})
(defn render []
 [
  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "markdownItalic"
   :italic true}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "markdownBold"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "markdownBoldItalic"
   :italic true}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 4
   :fg "#2dacd2"
   :group "markdownH1"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 12
   :fg "#1c7691"
   :group "markdownH2"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 3
   :fg "#f2b15c"
   :group "markdownH3"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 11
   :fg "#a5783c"
   :group "markdownH4"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 5
   :fg "#f29cb1"
   :group "markdownH5"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 13
   :fg "#dd3974"
   :group "markdownH6"}

  {:bg "#78aab8"   :ctermbg 8   :ctermfg 15   :fg "#6285c0"   :group "markdownCode"}

  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 8
   :fg "#78aab8"
   :group "markdownCodeDelimiter"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 15
   :fg "#121c2d"
   :group "markdownBlockqutoe"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 5
   :fg "#f29cb1"
   :group "markdownListMarker"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 5
   :fg "#f29cb1"
   :group "markdownOrderedListMarker"}

  {:bg "SKIP"   :ctermbg "SKIP"   :ctermfg 1   :fg "#eb4949"   :group "markdownRule"}

  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 1
   :fg "#eb4949"
   :group "markdownHeadingRule"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 15
   :fg "#537680"
   :group "markdownUrlDelimiter"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 15
   :fg "#537680"
   :group "markdownLinkDelimiter"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 15
   :fg "#537680"
   :group "markdownLinkTextDelimiter"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 3
   :fg "#f2b15c"
   :group "markdownHeadingDelimiter"}

  {:bg "SKIP"   :ctermbg "SKIP"   :ctermfg 6   :fg "#7a53a8"   :group "markdownUrl"}

  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 2
   :fg "#006c4f"
   :group "markdownUrlTitleDelimiter"}

  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 15
   :fg "#405881"
   :group "markdownLinkText"
   :sp "#405881"
   :underline true}

  {:bg "SKIP"
   :ctermbg "SKIP"
   :ctermfg 15
   :fg "#405881"
   :group "markdownIdDeclaration"
   :sp "#405881"
   :underline true}
])
(defn init [] (run.highlight$<-table (render)))