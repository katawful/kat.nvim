(module katdotnvim.exported.main-dark-hard
  {autoload {run katdotnvim.utils.highlight.run}})
(defn render []
 [
  {:bg "#121c2d" :ctermbg 0 :ctermfg 7 :fg "#daf6ff" :group "Normal"}
  {:bg "#121c2d" :ctermbg 0 :ctermfg 7 :fg "#daf6ff" :group "NormalNC"}
  {:bg "#405881" :ctermbg 8 :ctermfg 7 :fg "#daf6ff" :group "NormalFloat"}
  {:bg "#121c2d" :ctermbg 0 :ctermfg 15 :fg "#78aab8" :group "NonText"}
  {:bg "#405881"
   :bold true
   :ctermbg 8
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "MatchParen"}
  {:bg "NONE"
   :ctermbg "NONE"
   :ctermfg 9
   :fg "#94373e"
   :group "SpecialKey"
   :italic true}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 15 :fg "#30474e" :group "Whitespace"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 15
   :fg "#b0ddeb"
   :group "EndOfBuffer"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 4 :fg "#50b9d8" :group "Directory"}
  {:bg "NONE" :ctermbg "NONE" :ctermfg 8 :fg "#405881" :group "Conceal"}
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
   :sp "#7df9ca"
   :undercurl true}
  {:bg "SKIP"
   :ctermbg "NONE"
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "SpellRare"
   :sp "#f29cb1"
   :undercurl true}
  {:bg "#5b4383"
   :bold true
   :ctermbg 14
   :ctermfg 8
   :fg "#9fb4df"
   :group "StatusLine"}
  {:bg "#9fb4df"
   :bold true
   :ctermbg 14
   :ctermfg 8
   :fg "#5b4383"
   :group "StatusLineNC"}
  {:bg "#2dacd2"
   :bold true
   :ctermbg 4
   :ctermfg 7
   :fg "#daf6ff"
   :group "TabLineSel"}
  {:bg "NONE" :bold true :ctermbg "NONE" :ctermfg 2 :fg "#7df9ca" :group "Title"}
  {:bg "#2187a6" :ctermbg 9 :ctermfg "SKIP" :fg "SKIP" :group "Visual"}
  {:bg "#84d1e9" :ctermbg 9 :ctermfg "SKIP" :fg "SKIP" :group "VisualNOS"}
  {:bg "#f29cb1" :ctermbg 5 :ctermfg 7 :fg "#daf6ff" :group "Pmenu"}
  {:bg "#2dacd2" :ctermbg 4 :ctermfg 7 :fg "#daf6ff" :group "PmenuSel"}
  {:bg "#7a53a8" :ctermbg 6 :ctermfg 7 :fg "#daf6ff" :group "PmenuSbar"}
  {:bg "#2dacd2" :ctermbg 4 :ctermfg 7 :fg "#daf6ff" :group "PmenuThumb"}
  {:bg "#2dacd2" :ctermbg 4 :ctermfg 7 :fg "#daf6ff" :group "WildMenu"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 10
   :fg "#99f8da"
   :group "Question"
   :sp "#7df9ca"
   :underline true}
  {:bg "#2dacd2" :ctermbg 4 :ctermfg "SKIP" :fg "SKIP" :group "QuickFixLine"}
  {:bg "#daf6ff"
   :ctermbg 7
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "Cursor"
   :reverse true}
  {:bg "#b0ddeb"
   :ctermbg 15
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "CursorIM"
   :reverse true}
  {:bg "#78aab8"
   :ctermbg 15
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "lCursor"
   :reverse true}
  {:bg "#405881" :ctermbg 8 :ctermfg "SKIP" :fg "SKIP" :group "CursorColumn"}
  {:bg "#405881" :ctermbg 8 :ctermfg "SKIP" :fg "SKIP" :group "CursorLine"}
  {:bg "#50bbdb"
   :bold true
   :ctermbg 12
   :ctermfg "NONE"
   :fg "NONE"
   :group "ColorColumn"}
  {:bg "#daf6ff"
   :ctermbg 7
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "TermCursor"
   :reverse true}
  {:bg "#b0ddeb"
   :ctermbg 15
   :ctermfg "SKIP"
   :fg "SKIP"
   :group "TermCursorNC"
   :reverse true}
  {:bg "#eb4949"
   :bold true
   :ctermbg 1
   :ctermfg 7
   :fg "#daf6ff"
   :group "ErrorMsg"}
  {:bg "#aa3c41" :ctermbg 9 :ctermfg 7 :fg "#daf6ff" :group "WarningMsg"}
  {:bg "#78aab8" :ctermbg 15 :ctermfg 8 :fg "#405881" :group "VertSplit"}
  {:bg "#405881" :bold true :ctermbg 8 :ctermfg 7 :fg "#daf6ff" :group "Folded"}
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
  {:reverse false
   :bg "#f2b15c"
   :ctermbg 3
   :ctermfg 7
   :fg "#daf6ff"
   :group "IncSearch"}
  {:bg "#ebc68d" :ctermbg 11 :ctermfg 0 :fg "#121c2d" :group "Substitute"}
  {:bg "#af844e" :ctermbg 3 :ctermfg 0 :fg "#121c2d" :group "Search"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 5 :fg "#f29cb1" :group "LineNr"}
  {:bg "SKIP"
   :bold true
   :ctermbg "SKIP"
   :ctermfg 13
   :fg "#e8c0d0"
   :group "CursorLineNr"}
  {:bg "#405881" :bold true :ctermbg 8 :ctermfg 7 :fg "#daf6ff" :group "ModeMsg"}
  {:bg "#202f47" :ctermbg 8 :ctermfg 7 :fg "#daf6ff" :group "MsgArea"}
  {:bg "#202f47" :ctermbg 8 :ctermfg 7 :fg "#daf6ff" :group "MsgSeparator"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 2 :fg "#7df9ca" :group "MoreMsg"}
  {:bg "#72cae4" :ctermbg 12 :ctermfg "SKIP" :fg "SKIP" :group "debugPC"}
  {:bg "#e48e92" :ctermbg 9 :ctermfg "SKIP" :fg "SKIP" :group "debugBreakpoint"}])
(defn init [] (run.highlight$<-table (render)))