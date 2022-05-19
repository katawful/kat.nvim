(module katdotnvim.exported.main-light-soft
  {autoload {run katdotnvim.utils.highlight.run}})
(defn render []
 [
  {:bg "#b0ddeb" :ctermbg 0 :ctermfg 7 :fg "#202f47" :group "Normal"}
  {:bg "#b0ddeb" :ctermbg 0 :ctermfg 7 :fg "#202f47" :group "NormalNC"}
  {:bg "#78aab8" :ctermbg 8 :ctermfg 7 :fg "#202f47" :group "NormalFloat"}
  {:bg "#b0ddeb" :ctermbg 0 :ctermfg 15 :fg "#405881" :group "NonText"}
  {:bg "#78aab8"
   :bold true
   :ctermbg 8
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "MatchParen"}
  {:bg "NONE"
   :ctermbg "NONE"
   :ctermfg 9
   :fg "#d3848a"
   :group "SpecialKey"
   :italic true}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 15 :fg "#9fb4df" :group "Whitespace"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 15
   :fg "#121c2d"
   :group "EndOfBuffer"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 4 :fg "#2f96b7" :group "Directory"}
  {:bg "NONE" :ctermbg "NONE" :ctermfg 8 :fg "#78aab8" :group "Conceal"}
  {:bg "SKIP"
   :ctermbg "NONE"
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "SpellBad"
   :sp "#eb4949"
   :undercurl true}
  {:bg "SKIP"
   :ctermbg "NONE"
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "SpellCap"
   :sp "#2dacd2"
   :undercurl true}
  {:bg "SKIP"
   :ctermbg "NONE"
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "SpellLocal"
   :sp "#006c4f"
   :undercurl true}
  {:bg "SKIP"
   :ctermbg "NONE"
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "SpellRare"
   :sp "#f29cb1"
   :undercurl true}
  {:bg "#8a7cbc"
   :bold true
   :ctermbg 14
   :ctermfg 8
   :fg "#30474e"
   :group "StatusLine"}
  {:bg "#30474e"
   :bold true
   :ctermbg 14
   :ctermfg 8
   :fg "#8a7cbc"
   :group "StatusLineNC"}
  {:bg "#2dacd2"
   :bold true
   :ctermbg 4
   :ctermfg 7
   :fg "#202f47"
   :group "TabLineSel"}
  {:bg "NONE" :bold true :ctermbg "NONE" :ctermfg 2 :fg "#006c4f" :group "Title"}
  {:bg "#2187a6" :ctermbg 9 :ctermfg "SKIP" :fg "SKIP" :group "Visual"}
  {:bg "#276e8d" :ctermbg 9 :ctermfg "SKIP" :fg "SKIP" :group "VisualNOS"}
  {:bg "#f29cb1" :ctermbg 5 :ctermfg 7 :fg "#202f47" :group "Pmenu"}
  {:bg "#2dacd2" :ctermbg 4 :ctermfg 7 :fg "#202f47" :group "PmenuSel"}
  {:bg "#7a53a8" :ctermbg 6 :ctermfg 7 :fg "#202f47" :group "PmenuSbar"}
  {:bg "#2dacd2" :ctermbg 4 :ctermfg 7 :fg "#202f47" :group "PmenuThumb"}
  {:bg "#2dacd2" :ctermbg 4 :ctermfg 7 :fg "#202f47" :group "WildMenu"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 10
   :fg "#0a5a4d"
   :group "Question"
   :sp "#006c4f"
   :underline true}
  {:bg "#2dacd2" :ctermbg 4 :ctermfg "SKIP" :fg "SKIP" :group "QuickFixLine"}
  {:bg "#202f47"
   :ctermbg 7
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "Cursor"
   :reverse true}
  {:bg "#121c2d"
   :ctermbg 15
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "CursorIM"
   :reverse true}
  {:bg "#405881"
   :ctermbg 15
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "lCursor"
   :reverse true}
  {:bg "#78aab8" :ctermbg 8 :ctermfg "SKIP" :fg "SKIP" :group "CursorColumn"}
  {:bg "#78aab8" :ctermbg 8 :ctermfg "SKIP" :fg "SKIP" :group "CursorLine"}
  {:bg "#2a93b6"
   :bold true
   :ctermbg 12
   :ctermfg "NONE"
   :fg "NONE"
   :group "ColorColumn"}
  {:bg "#202f47"
   :ctermbg 7
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "TermCursor"
   :reverse true}
  {:bg "#121c2d"
   :ctermbg 15
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "TermCursorNC"
   :reverse true}
  {:bg "#eb4949"
   :bold true
   :ctermbg 1
   :ctermfg 7
   :fg "#202f47"
   :group "ErrorMsg"}
  {:bg "#d9757a" :ctermbg 9 :ctermfg 7 :fg "#202f47" :group "WarningMsg"}
  {:bg "#405881" :ctermbg 15 :ctermfg 8 :fg "#78aab8" :group "VertSplit"}
  {:bg "#78aab8" :bold true :ctermbg 8 :ctermfg 7 :fg "#202f47" :group "Folded"}
  {:bg "NONE"
   :bold true
   :ctermbg "NONE"
   :ctermfg 4
   :fg "#2dacd2"
   :group "FoldColumn"}
  {:bg "NONE"
   :bold true
   :ctermbg "NONE"
   :ctermfg "NONE"
   :fg "NONE"
   :group "SignColumn"}
  {:NONE true
   :bg "#f2b15c"
   :ctermbg 3
   :ctermfg 7
   :fg "#202f47"
   :group "IncSearch"}
  {:bg "#b38a56" :ctermbg 11 :ctermfg 0 :fg "#b0ddeb" :group "Substitute"}
  {:bg "#debe87" :ctermbg 3 :ctermfg 0 :fg "#b0ddeb" :group "Search"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 5 :fg "#f29cb1" :group "LineNr"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 13
   :fg "#9e7087"
   :group "CursorLineNr"}
  {:bg "#78aab8" :bold true :ctermbg 8 :ctermfg 7 :fg "#202f47" :group "ModeMsg"}
  {:bg "#daf6ff" :ctermbg 8 :ctermfg 7 :fg "#202f47" :group "MsgArea"}
  {:bg "#daf6ff" :ctermbg 8 :ctermfg 7 :fg "#202f47" :group "MsgSeparator"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 2 :fg "#006c4f" :group "MoreMsg"}
  {:bg "#287a9a" :ctermbg 12 :ctermfg "SKIP" :fg "SKIP" :group "debugPC"}
  {:bg "#9a3f48" :ctermbg 9 :ctermfg "SKIP" :fg "SKIP" :group "debugBreakpoint"}])
(defn init [] (run.highlight$<-table (render)))
