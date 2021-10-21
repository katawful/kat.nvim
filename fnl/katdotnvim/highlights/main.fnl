(module katdotnvim.highlights.main
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.color
                   }})

; define variables to use for generic uses
(def mainFG (. colors.foreground 1))
(def mainBG (. colors.background 1))

(def umbraFG (. colors.foreground 2))
(def umbraBG (. colors.background 2))

(def shadowFG (. colors.foreground 3))
(def shadowBG (. colors.background 3))

(def meldFG (. colors.foreground 4))
(def meldBG (. colors.background 4))

; pink/purple/blue are structural
(def selectionFG mainFG)
(def selectionBG (. colors.normalColors :blue))
(def fillFG mainFG)
(def fillBG (. colors.normalColors :pink))
(def highlightFG mainFG)
(def highlightBG (. colors.normalColors :purple))

; red and orange are information
(def errorFG mainFG)
(def errorBG (. colors.normalColors :red))
(def warningFG mainFG)
(def warningBG (ucolors.blendColors (. colors.normalColors :red) mainBG 0.7))
(def infoFG mainBG)
(def infoBG (. colors.normalColors :orange))

; green and others are auxiliary
(def auxFG mainFG)
(defn groupFunction []
  (var output "")
  (if (= vim.g.kat_nvim_settings.style :light)
    (do
      (set output (ucolors.saturation (ucolors.darken (. colors.normalColors :green) 0.5) 0.4)))
    (do
      (set output (ucolors.saturation (ucolors.brighten (. colors.normalColors :green) 0.5) -0.2))))
  output)
(def auxBG (groupFunction))


; this covers the main highlight groups

(defn init []
  (ucolors.highlight :Normal mainFG mainBG)
  (ucolors.highlight :NormalNC mainFG mainBG)
  (ucolors.highlight :NormalFloat mainFG shadowBG)
  (ucolors.highlight :NonText shadowFG mainBG)
  ; TODO set match paren to TS rainbow?
  (ucolors.highlight :MatchParen :SKIP shadowBG :bold)
  (ucolors.highlight :SpecialKey (ucolors.blendColors (. colors.normalColors :red) (. colors.background 1) 0.6) :NONE :italic)
  (ucolors.highlight :Whitespace (. colors.foreground 6) :SKIP)
  (ucolors.highlight :EndOfBuffer umbraFG :SKIP :bold)
  (ucolors.highlight :Directory (ucolors.blendColors
                                  (ucolors.blendColors infoBG mainFG 0.1)
                                  selectionBG 0.2)
                     :SKIP)
  (ucolors.highlight :Conceal shadowBG :NONE)

  ; Spelling
  (ucolors.highlight :SpellBad :SKIP :SKIP :undercurl (. colors.normalColors :red))
  (ucolors.highlight :SpellCap :SKIP :SKIP :undercurl (. colors.normalColors :blue))
  (ucolors.highlight :SpellLocal :SKIP :SKIP :undercurl (. colors.normalColors :green))
  (ucolors.highlight :SpellRare :SKIP :SKIP :undercurl (. colors.normalColors :pink))

  ; Statusline
  (ucolors.highlight :StatusLine (. colors.background 5) (ucolors.blendColors (. colors.normalColors :purple) (. colors.background 1) 0.7) :bold)
  (ucolors.highlight :StatusLineNC (ucolors.blendColors (. colors.normalColors :purple) (. colors.background 1) 0.7) (. colors.background 5) :bold)

  ; Tabline
  (ucolors.highlight :TabLine highlightFG highlightBG :NONE)
  (ucolors.highlight :TabLineFill fillBG fillBG)
  (ucolors.highlight :TabLineSel selectionFG selectionBG :bold)

  (ucolors.highlight :Title (. colors.normalColors :green) :NONE :bold)

  (ucolors.highlight :Visual :SKIP (ucolors.darken (. colors.normalColors :red) 0.2))
  (ucolors.highlight :VisualNOS :SKIP (ucolors.blendColors (. colors.normalColors :red) (. colors.foreground 1) 0.5))

  ; Pmenu
  (ucolors.highlight :Pmenu fillFG fillBG)
  (ucolors.highlight :PmenuSel selectionFG selectionBG)
  (ucolors.highlight :PmenuSbar highlightFG highlightBG)
  (ucolors.highlight :PmenuThumb selectionFG selectionBG)
  (ucolors.highlight :WildMenu selectionFG selectionBG)

  (ucolors.highlight :Question (ucolors.blendColors (. colors.normalColors :green) (. colors.foreground 1) 0.7) :SKIP "bold,underline" (. colors.normalColors :green))
  (ucolors.highlight :QuickFixLine :SKIP selectionBG)

  ; Cursor
  (ucolors.highlight :Cursor :SKIP (. colors.foreground 1) :reverse)
  (ucolors.highlight :CursorIM :SKIP (. colors.foreground 3) :reverse)
  (ucolors.highlight :lCursor :SKIP (. colors.foreground 2) :reverse)
  (ucolors.highlight :CursorColumn :SKIP (. colors.background 2))
  (ucolors.highlight :CursorLine :SKIP (. colors.background 2))
  (ucolors.highlight :ColorColumn :NONE (ucolors.blendColors selectionBG (. colors.foreground 1) 0.8) :bold)
  (ucolors.highlight :TermCursor :SKIP (. colors.foreground 1) :reverse)
  (ucolors.highlight :TermCursorNC :SKIP (. colors.foreground 3) :reverse)

  (ucolors.highlight :ErrorMsg errorFG errorBG :bold)
  (ucolors.highlight :WarningMsg warningFG warningBG)

  (ucolors.highlight :VertSplit shadowBG shadowFG)
  (ucolors.highlight :Folded selectionFG shadowBG :bold)
  (ucolors.highlight :FoldColumn selectionBG :NONE :bold)
  (ucolors.highlight :SignColumn :SKIP :SKIP :bold)

  (ucolors.highlight :IncSearch infoFG infoBG :NONE)
  (ucolors.highlight :Substitute infoFG (ucolors.blendColors infoBG mainFG 0.7))
  (ucolors.highlight :Search infoFG (ucolors.blendColors infoBG mainBG 0.7))

  (ucolors.highlight :LineNr fillBG :SKIP)
  (ucolors.highlight :CursorLineNr (ucolors.blendColors fillBG mainFG 0.6) :SKIP :bold)

  (ucolors.highlight :ModeMsg mainFG shadowBG :bold)
  (ucolors.highlight :MsgArea mainFG umbraBG)
  (ucolors.highlight :MsgSeparator mainFG umbraBG)
  (ucolors.highlight :MoreMsg auxBG :SKIP)

  (ucolors.highlight :debugPC :SKIP (ucolors.blendColors selectionBG mainFG 0.6))
  (ucolors.highlight :debugBreakpoint :SKIP (ucolors.blendColors errorBG mainFG 0.6))

  (if (= (vim.fn.has :gui) 1)
    (do
      (ucolors.highlight :Menu mainFG mainBG)
      (ucolors.highlight :Tooltip fillFG fillBG)
      (ucolors.highlight :Scrollbar highlightFG highlightBG)))
  )
