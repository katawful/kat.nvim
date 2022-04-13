(module katdotnvim.highlights.main
  {autoload {colors katdotnvim.color
             ucolors katdotnvim.utils.color
             main katdotnvim.main}})


; define variables to use for generic uses
; each variable is actually a function that gets called so that they always update and work with Aniseed modules
(defn mainFG []
  (var output {})
  (if (and (= vim.o.background :dark)
           (= main.contrast :soft))
    (do (tset output 1 (ucolors.brighten (. (colors.foreground) 1) 0.8))
      (tset output 2 7))
    (do (tset output 1 (. (colors.foreground) 1))
      (tset output 2 7)))
  output)
(defn mainBG [] [(. (colors.background) 1)
                 0])

(defn umbraFG [] [(. (colors.foreground) 2)
                  15])
(defn umbraBG [] [(. (colors.background) 2)
                  8])

(defn shadowFG [] [(. (colors.foreground) 3)
                   16])
(defn shadowBG [] [(. (colors.background) 3)
                   16])

(defn meldFG [] [(. (colors.foreground) 4)
                 16])
(defn meldBG [] [(. (colors.background) 4)
                 16])

; pink/purple/blue are structural
(defn selectionFG []
  (local output [(. (mainFG) 1)
                 7])
  output)
(defn selectionBG [] [(. (colors.normal-colors) :blue)
                      4
                      12])
(defn fillFG []
  (local output [(. (mainFG) 1)
                 7])
  output)
(defn fillBG [] [(. (colors.normal-colors) :pink)
                 5
                 13])

(defn highlightFG []
  (local output [(. (mainFG) 1)
                 7])
  output)
(defn highlightBG [] [(. (colors.normal-colors) :purple)
                      6
                      14])

; red and orange are information
(defn errorFG []
  (local output [(. (mainFG) 1)
                 7])
  output)
(defn errorBG [] [(. (colors.normal-colors) :red)
                  1])
(defn warningFG []
  (local output [(. (mainFG) 1)
                 7])
  output)

(defn warningBG []
  (local output [(ucolors.blend  (. (colors.normal-colors) :red) (. (mainBG) 1) 0.7)
                 9])
  output)

(defn infoFG []
  (local output [(. (mainBG) 1)
                 0])
  output)
(defn infoBG [] [(. (colors.normal-colors) :orange)
                 3
                 11])
; green and others are auxiliary
(defn auxFG []
  (local output (. (mainFG) 1))
  output)
(defn groupFunction []
  (var output "")
  (if (= vim.o.background :light)
    (do (set output (ucolors.saturation (ucolors.darken (. (colors.normal-colors) :green) 0.5) 0.4)))
    (do (set output (ucolors.saturation (ucolors.brighten (. (colors.normal-colors) :green) 0.5) -0.2))))
  output)
(defn auxBG []
  (local output [(groupFunction)
                 2
                 10])
  output)

; this covers the main highlight groups

(defn init []
  (ucolors.highlight$ :Normal
                     (. (mainFG) 1)
                     (. (mainBG) 1)
                     (. (mainFG) 2)
                     (. (mainBG) 2))
  (ucolors.highlight$ :NormalNC
                     (. (mainFG) 1)
                     (. (mainBG) 1)
                     (. (mainFG) 2)
                     (. (mainBG) 2))
  (ucolors.highlight$ :NormalFloat
                     (. (mainFG) 1)
                     (. (shadowBG) 1)
                     (. (mainFG) 2)
                     (. (umbraBG) 2))
  (ucolors.highlight$ :NonText
                     (. (shadowFG) 1)
                     (. (mainBG) 1)
                     (. (umbraFG) 2)
                     (. (mainBG) 2))
  ; TODO set match paren to TS rainbow?
  (ucolors.highlight$ :MatchParen
                     :SKIP
                     (. (shadowBG) 1)
                     :SKIP
                     (. (umbraBG) 2)
                     :bold)
  (ucolors.highlight$ :SpecialKey
                     (ucolors.blend (. (errorBG) 1)
                                    (. (mainBG) 1)
                                    0.6)
                     :NONE
                     (. (warningBG) 2)
                     :NONE
                     :italic)
  (ucolors.highlight$ :Whitespace
                     (. (colors.foreground) 5)
                     :SKIP
                     (. (umbraFG) 2)
                     :SKIP)
  (ucolors.highlight$ :EndOfBuffer
                     (. (umbraFG) 1)
                     :SKIP
                     (. (umbraFG) 2)
                     :SKIP
                     :bold)
  (ucolors.highlight$ :Directory
                     (ucolors.blend  (ucolors.blend (. (infoBG) 1)
                                                    (. (mainFG) 1)
                                                    0.1)
                                    (. (selectionBG) 1)
                                    0.2)
                     :SKIP
                     (. (selectionBG) 2)
                     :SKIP)
  (ucolors.highlight$ :Conceal
                     (. (shadowBG) 1)
                     :NONE
                     (. (umbraBG) 2)
                     :NONE)

  ; Spelling
  (ucolors.highlight$ :SpellBad
                     :SKIP
                     :SKIP
                     :SKIP
                     :NONE
                     :undercurl
                     (. (errorBG) 1))
  (ucolors.highlight$ :SpellCap
                     :SKIP
                     :SKIP
                     :SKIP
                     :NONE
                     :undercurl
                     (. (selectionBG) 1))
  (ucolors.highlight$ :SpellLocal
                     :SKIP
                     :SKIP
                     :SKIP
                     :NONE
                     :undercurl
                     (. (auxBG) 1))
  (ucolors.highlight$ :SpellRare
                     :SKIP
                     :SKIP
                     :SKIP
                     :NONE
                     :undercurl
                     (. (fillBG) 1))

  ; Statusline
  (ucolors.highlight$ :StatusLine
                     (. (colors.background) 5)
                     (ucolors.blend (. (highlightBG) 1)
                                    (. (mainBG) 1)
                                    0.7)
                     (. (umbraBG) 2)
                     (. (highlightBG) 3)
                     :bold)

  (ucolors.highlight$ :StatusLineNC
                   (ucolors.blend (. (highlightBG) 1)
                                  (. (mainBG) 1)
                                  0.7)
                   (. (colors.background) 5)
                   (. (umbraBG) 2)
                   (. (highlightBG) 3)
                   :bold)

  ; Tabline
  ; we need to make the dark soft font brighter to match dark hard tabline
  ; looks bad otherwise imo
  (if (and (= vim.o.background :dark)
           (= main.contrast :soft))
      (do
        (var color (ucolors.brighten (. (highlightFG) 1) 0))
        (ucolors.highlight$ :TabLine
                           color
                           (. (highlightBG) 1)
                           (. (highlightFG) 2)
                           (. (highlightBG) 2))
        (ucolors.highlight$ :TabLineFill
                           (. (fillBG) 1)
                           (. (fillBG) 1)
                           (. (fillBG) 2)
                           (. (fillBG) 2))
        (ucolors.highlight$ :TabLineSel
                           color
                           (. (selectionBG) 1)
                           (. (selectionFG) 2)
                           (. (selectionBG) 2)
                           :bold))
      (do
        (ucolors.highlight$ :TabLine
                           (. (highlightFG) 1)
                           (. (highlightBG) 1)
                           (. (highlightFG) 2)
                           (. (highlightBG) 2))
        (ucolors.highlight$ :TabLineFill
                           (. (fillBG) 1)
                           (. (fillBG) 1)
                           (. (fillBG) 2)
                           (. (fillBG) 2))
        (ucolors.highlight$ :TabLineSel
                           (. (selectionFG) 1)
                           (. (selectionBG) 1)
                           (. (selectionFG) 2)
                           (. (selectionBG) 2)
                           :bold)))

  (ucolors.highlight$ :Title
                     (. (auxBG) 1)
                     :NONE
                     (. (auxBG) 2)
                     :NONE
                     :bold)

  (ucolors.highlight$ :Visual
                     :SKIP
                     (ucolors.darken (. (selectionBG) 1) 0.2)
                     :SKIP
                     (. (warningBG) 2))
  (ucolors.highlight$ :VisualNOS
                     :SKIP (ucolors.blend (. (selectionBG) 1)
                                          (. (mainFG) 1)
                                          0.5)
                     :SKIP
                     (. (warningBG) 2))

  ; Pmenu
  (ucolors.highlight$ :Pmenu
                     (. (fillFG) 1)
                     (. (fillBG) 1)
                     (. (fillFG) 2)
                     (. (fillBG) 2))
  (ucolors.highlight$ :PmenuSel
                     (. (selectionFG) 1)
                     (. (selectionBG) 1)
                     (. (selectionFG) 2)
                     (. (selectionBG) 2))
  (ucolors.highlight$ :PmenuSbar
                     (. (highlightFG) 1)
                     (. (highlightBG) 1)
                     (. (highlightFG) 2)
                     (. (highlightBG) 2))
  (ucolors.highlight$ :PmenuThumb
                     (. (selectionFG) 1)
                     (. (selectionBG) 1)
                     (. (selectionFG) 2)
                     (. (selectionBG) 2))
  (ucolors.highlight$ :WildMenu
                     (. (selectionFG) 1)
                     (. (selectionBG) 1)
                     (. (selectionFG) 2)
                     (. (selectionBG) 2))

  (ucolors.highlight$ :Question
                     (ucolors.blend (. (auxBG) 1)
                                    (. (mainFG) 1)
                                    0.7)
                     :SKIP
                     (. (auxBG) 3)
                     :SKIP
                     "bold,underline"
                     (. (auxBG) 1))
  (ucolors.highlight$ :QuickFixLine
                     :SKIP
                     (. (selectionBG) 1)
                     :SKIP (. (selectionBG) 2))

  ; Cursor
  (ucolors.highlight$ :Cursor
                     :SKIP
                     (. (mainFG) 1)
                     :SKIP
                     (. (mainFG) 2)
                     :reverse)
  (ucolors.highlight$ :CursorIM
                     :SKIP
                     (. (umbraFG) 1)
                     :SKIP
                     (. (umbraFG) 2)
                     :reverse)
  (ucolors.highlight$ :lCursor
                     :SKIP
                     (. (shadowFG) 1)
                     :SKIP
                     (. (umbraFG) 2)
                     :reverse)
  (ucolors.highlight$ :CursorColumn
                     :SKIP
                     (. (shadowBG) 1)
                     :SKIP
                     (. (umbraBG) 2))
  (ucolors.highlight$ :CursorLine
                     :SKIP
                     (. (shadowBG) 1)
                     :SKIP
                     (. (umbraBG) 2))
  (ucolors.highlight$ :ColorColumn
                     :NONE
                     (ucolors.blend (. (selectionBG) 1)
                                    (. (mainFG) 1)
                                    0.8)
                     :NONE
                     (. (selectionBG) 3)
                     :bold)
  (ucolors.highlight$ :TermCursor
                     :SKIP
                     (. (mainFG) 1)
                     :SKIP
                     (. (mainFG) 2)
                     :reverse)
  (ucolors.highlight$ :TermCursorNC
                     :SKIP
                     (. (umbraFG) 1)
                     :SKIP
                     (. (umbraFG) 2)
                     :reverse)

  (ucolors.highlight$ :ErrorMsg
                     (. (errorFG) 1)
                     (. (errorBG) 1)
                     (. (errorFG) 2)
                     (. (errorBG) 2)
                     :bold)
  (ucolors.highlight$ :WarningMsg
                     (. (warningFG) 1)
                     (. (warningBG) 1)
                     (. (warningFG) 2)
                     (. (warningBG) 2))

  (ucolors.highlight$ :VertSplit
                     (. (shadowBG) 1)
                     (. (shadowFG) 1)
                     (. (umbraBG) 2)
                     (. (umbraFG) 2))
  (ucolors.highlight$ :Folded
                     (. (selectionFG) 1)
                     (. (shadowBG) 1)
                     (. (selectionFG) 2)
                     (. (umbraBG) 2)
                     :bold)
  (ucolors.highlight$ :FoldColumn
                     (. (selectionBG) 1)
                     :NONE
                     (. (selectionBG) 2)
                     :NONE
                     :bold)
  (ucolors.highlight$ :SignColumn
                     :NONE
                     :NONE
                     :NONE
                     :NONE
                     :bold)

  (ucolors.highlight$ :IncSearch
                     (. (mainFG) 1)
                     (. (infoBG) 1)
                     (. (mainFG) 2)
                     (. (infoBG) 2)
                     :NONE)
  (ucolors.highlight$ :Substitute
                     (. (infoFG) 1)
                     (ucolors.blend (. (infoBG) 1)
                                    (. (mainFG) 1)
                                    0.7)
                     (. (infoFG) 2)
                     (. (infoBG) 3))
  (ucolors.highlight$ :Search
                     (. (infoFG) 1)
                     (ucolors.blend (. (infoBG) 1)
                                    (. (mainBG) 1)
                                    0.7)
                     (. (infoFG) 2)
                     (. (infoBG) 2))

  (ucolors.highlight$ :LineNr
                     (. (fillBG) 1)
                     :SKIP
                     (. (fillBG) 2)
                     :SKIP)
  (ucolors.highlight$ :CursorLineNr
                     (ucolors.blend (. (fillBG) 1)
                                    (. (mainFG) 1)
                                    0.6)
                     :SKIP
                     (. (fillBG) 3)
                     :SKIP
                     :bold)

  (ucolors.highlight$ :ModeMsg
                     (. (mainFG) 1)
                     (. (shadowBG) 1)
                     (. (mainFG) 2)
                     (. (umbraBG) 2)
                     :bold)
  (ucolors.highlight$ :MsgArea
                     (. (mainFG) 1)
                     (. (umbraBG) 1)
                     (. (mainFG) 2)
                     (. (umbraBG) 2))
  (ucolors.highlight$ :MsgSeparator
                     (. (mainFG) 1)
                     (. (umbraBG) 1)
                     (. (mainFG) 2)
                     (. (umbraBG) 2))
  (ucolors.highlight$ :MoreMsg
                     (. (auxBG) 1)
                     :SKIP
                     (. (auxBG) 2)
                     :SKIP)

  (ucolors.highlight$ :debugPC
                     :SKIP
                     (ucolors.blend (. (selectionBG) 1)
                                    (. (mainFG) 1)
                                    0.6)
                     :SKIP
                     (. (selectionBG) 3))
  (ucolors.highlight$ :debugBreakpoint
                     :SKIP
                     (ucolors.blend (. (errorBG) 1)
                                    (. (mainFG) 1)
                                    0.6)
                     :SKIP
                     (. (warningBG) 2))

  (if (= (vim.fn.has :gui) 1)
    (do
      (ucolors.highlight$ :Menu
                         (. (mainFG) 1)
                         (. (mainBG) 1)
                         (. (mainFG) 2)
                         (. (mainBG) 2))
      (ucolors.highlight$ :Tooltip
                         (. (fillFG) 1)
                         (. (fillBG) 1)
                         (. (fillFG) 2)
                         (. (fillBG) 2))
      (ucolors.highlight$ :Scrollbar
                         (. (highlightFG) 1)
                         (. (highlightBG) 1)
                         (. (highlightFG) 2)
                         (. (highlightBG) 2)))))
