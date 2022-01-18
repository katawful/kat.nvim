(module katdotnvim.highlights.main
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.color
                   main katdotnvim.main
                   }})


; define variables to use for generic uses
(defn mainFG [] 
  (var output "")
  (if (and (= vim.o.background :dark)
           (= main.katContrast :soft))
      (do (set output (ucolors.brighten (. (colors.init :foreground) 1) 0.8)))
      (do (set output (. (colors.init :foreground) 1))))
  output)
(defn mainBG [] (. (colors.init :background) 1))

(defn umbraFG [] (. (colors.init :foreground) 2))
(defn umbraBG [] (. (colors.init :background) 2))

(defn shadowFG [] (. (colors.init :foreground) 3))
(defn shadowBG [] (. (colors.init :background) 3))

(defn meldFG [] (. (colors.init :foreground) 4))
(defn meldBG [] (. (colors.init :background) 4))

; pink/purple/blue are structural
(defn selectionFG []
  (def output (mainFG))
  output)
(defn selectionBG [] (. (colors.init :normalColors) :blue))
(defn fillFG []
  (def output (mainFG))
  output)
(defn fillBG [] (. (colors.init :normalColors) :pink))
(defn highlightFG []
  (def output (mainFG))
  output)
(defn highlightBG [] (. (colors.init :normalColors) :purple))

; red and orange are information
(defn errorFG []
  (def output (mainFG))
  output)
(defn errorBG [] (. (colors.init :normalColors) :red))
(defn warningFG []
  (def output (mainFG))
  output)
(defn warningBG []
  (def output (ucolors.blendColors (. (colors.init :normalColors) :red) (mainBG) 0.7))
  output)
(defn infoFG []
  (def output (mainBG))
  output)
(defn infoBG [] (. (colors.init :normalColors) :orange))
; green and others are auxiliary
(defn auxFG []
  (def output (mainFG))
  output)
(defn groupFunction []
  (var output "")
  (if (= vim.o.background :light)
      (do (set output (ucolors.saturation (ucolors.darken (. (colors.init :normalColors) :green) 0.5) 0.4)))
      (do (set output (ucolors.saturation (ucolors.brighten (. (colors.init :normalColors) :green) 0.5) -0.2))))
  output)
(defn auxBG []
  (def output (groupFunction))
  output)

; this covers the main highlight groups

(defn init []
  (ucolors.highlight :Normal (mainFG) (mainBG))
  (ucolors.highlight :NormalNC (mainFG) (mainBG))
  (ucolors.highlight :NormalFloat (mainFG) (shadowBG))
  (ucolors.highlight :NonText (shadowFG) (mainBG))
  ; TODO set match paren to TS rainbow?
  (ucolors.highlight :MatchParen :SKIP (shadowBG) :bold)
  (ucolors.highlight :SpecialKey (ucolors.blendColors (. (colors.init :normalColors) :red) (. (colors.init :background) 1) 0.6) :NONE :italic)
  (ucolors.highlight :Whitespace (. (colors.init :foreground) 5) :SKIP)
  (ucolors.highlight :EndOfBuffer (umbraFG) :SKIP :bold)
  (ucolors.highlight :Directory (ucolors.blendColors
                                  (ucolors.blendColors (infoBG) (mainFG) 0.1)
                                  (selectionBG) 0.2)
                     :SKIP)
  (ucolors.highlight :Conceal (shadowBG) :NONE)

  ; Spelling
  (ucolors.highlight :SpellBad :SKIP :SKIP :undercurl (. (colors.init :normalColors) :red))
  (ucolors.highlight :SpellCap :SKIP :SKIP :undercurl (. (colors.init :normalColors) :blue))
  (ucolors.highlight :SpellLocal :SKIP :SKIP :undercurl (. (colors.init :normalColors) :green))
  (ucolors.highlight :SpellRare :SKIP :SKIP :undercurl (. (colors.init :normalColors) :pink))

  ; Statusline
  (ucolors.highlight :StatusLine (. (colors.init :background) 5) (ucolors.blendColors (. (colors.init :normalColors) :purple) (. (colors.init :background) 1) 0.7) :bold)

  (ucolors.highlight :StatusLineNC (ucolors.blendColors (. (colors.init :normalColors) :purple) (. (colors.init :background) 1) 0.7) (. (colors.init :background) 5) :bold)

  ; Tabline
  ; we need to make the dark soft font brighter to match dark hard tabline
  ; looks bad otherwise imo
  (if (and (= vim.o.background :dark)
           (= main.katContrast :soft))
      (do
        (var color (ucolors.brighten (highlightFG) 0.8))
        (ucolors.highlight :TabLine color (highlightBG) :NONE)
        (ucolors.highlight :TabLineFill (fillBG) (fillBG))
        (ucolors.highlight :TabLineSel color (selectionBG) :bold))
      (do
        (ucolors.highlight :TabLine (highlightFG) (highlightBG) :NONE)
        (ucolors.highlight :TabLineFill (fillBG) (fillBG))
        (ucolors.highlight :TabLineSel (selectionFG) (selectionBG) :bold)))

  (ucolors.highlight :Title (. (colors.init :normalColors) :green) :NONE :bold)

  (ucolors.highlight :Visual :SKIP (ucolors.darken (selectionBG) 0.2))
  (ucolors.highlight :VisualNOS :SKIP (ucolors.blendColors (selectionBG) (. (colors.init :foreground) 1) 0.5))

  ; Pmenu
  (ucolors.highlight :Pmenu (fillFG) (fillBG))
  (ucolors.highlight :PmenuSel (selectionFG) (selectionBG))
  (ucolors.highlight :PmenuSbar (highlightFG) (highlightBG))
  (ucolors.highlight :PmenuThumb (selectionFG) (selectionBG))
  (ucolors.highlight :WildMenu (selectionFG) (selectionBG))

  (ucolors.highlight :Question (ucolors.blendColors (. (colors.init :normalColors) :green) (. (colors.init :foreground) 1) 0.7) :SKIP "bold,underline" (. (colors.init :normalColors) :green))
  (ucolors.highlight :QuickFixLine :SKIP (selectionBG))

  ; Cursor
  (ucolors.highlight :Cursor :SKIP (. (colors.init :foreground) 1) :reverse)
  (ucolors.highlight :CursorIM :SKIP (. (colors.init :foreground) 3) :reverse)
  (ucolors.highlight :lCursor :SKIP (. (colors.init :foreground) 2) :reverse)
  (ucolors.highlight :CursorColumn :SKIP (. (colors.init :background) 2))
  (ucolors.highlight :CursorLine :SKIP (. (colors.init :background) 2))
  (ucolors.highlight :ColorColumn :NONE (ucolors.blendColors (selectionBG) (. (colors.init :foreground) 1) 0.8) :bold)
  (ucolors.highlight :TermCursor :SKIP (. (colors.init :foreground) 1) :reverse)
  (ucolors.highlight :TermCursorNC :SKIP (. (colors.init :foreground) 3) :reverse)

  (ucolors.highlight :ErrorMsg (errorFG) (errorBG) :bold)
  (ucolors.highlight :WarningMsg (warningFG) (warningBG))

  (ucolors.highlight :VertSplit (shadowBG) (shadowFG))
  (ucolors.highlight :Folded (selectionFG) (shadowBG) :bold)
  (ucolors.highlight :FoldColumn (selectionBG) :NONE :bold)
  (ucolors.highlight :SignColumn :NONE :NONE :bold)

  (ucolors.highlight :IncSearch (mainFG) (infoBG) :NONE)
  (ucolors.highlight :Substitute (infoFG) (ucolors.blendColors (infoBG) (mainFG) 0.7))
  (ucolors.highlight :Search (infoFG) (ucolors.blendColors (infoBG) (mainBG) 0.7))

  (ucolors.highlight :LineNr (fillBG) :SKIP)
  (ucolors.highlight :CursorLineNr (ucolors.blendColors (fillBG) (mainFG) 0.6) :SKIP :bold)

  (ucolors.highlight :ModeMsg (mainFG) (shadowBG) :bold)
  (ucolors.highlight :MsgArea (mainFG) (umbraBG))
  (ucolors.highlight :MsgSeparator (mainFG) (umbraBG))
  (ucolors.highlight :MoreMsg (auxBG) :SKIP)

  (ucolors.highlight :debugPC :SKIP (ucolors.blendColors (selectionBG) (mainFG) 0.6))
  (ucolors.highlight :debugBreakpoint :SKIP (ucolors.blendColors (errorBG) (mainFG) 0.6))

  (if (= (vim.fn.has :gui) 1)
      (do
        (ucolors.highlight :Menu (mainFG) (mainBG))
        (ucolors.highlight :Tooltip (fillFG) (fillBG))
        (ucolors.highlight :Scrollbar (highlightFG) (highlightBG)))))
