(module katdotnvim.highlights.main
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.color
                   run katdotnvim.utils.highlight.run
                   main katdotnvim.main}})

; define variables to use for generic uses
; each variable is actually a function that gets called so that they always update and work with Aniseed modules
(defn mainFG [] (var output {})
      (if (and (= vim.o.background :dark) (= main.contrast :soft))
          (do
            (tset output 1 (ucolors.brighten (. (colors.foreground) 1) 0.8))
            (tset output 2 7))
          (do
            (tset output 1 (. (colors.foreground) 1))
            (tset output 2 7))) output)

(defn mainBG [] [(. (colors.background) 1) 0])

(defn umbraFG [] [(. (colors.foreground) 2) 15])

(defn umbraBG [] [(. (colors.background) 2) 8])

(defn shadowFG [] [(. (colors.foreground) 3) 16])

(defn shadowBG [] [(. (colors.background) 3) 16])

(defn meldFG [] [(. (colors.foreground) 4) 16])

(defn meldBG [] [(. (colors.background) 4) 16])

; pink/purple/blue are structural
(defn selectionFG [] (local output [(. (mainFG) 1) 7]) output)

(defn selectionBG [] [(. (colors.normal-colors) :blue) 4 12])

(defn fillFG [] (local output [(. (mainFG) 1) 7]) output)

(defn fillBG [] [(. (colors.normal-colors) :pink) 5 13])

(defn highlightFG [] (local output [(. (mainFG) 1) 7]) output)

(defn highlightBG [] [(. (colors.normal-colors) :purple) 6 14])

; red and orange are information
(defn errorFG [] (local output [(. (mainFG) 1) 7]) output)

(defn errorBG [] [(. (colors.normal-colors) :red) 1])

(defn warningFG [] (local output [(. (mainFG) 1) 7]) output)

(defn warningBG [] (local output [(ucolors.blend (. (colors.normal-colors) :red)
                                                 (. (mainBG) 1) 0.7)
                                  9]) output)

(defn infoFG [] (local output [(. (mainBG) 1) 0]) output)

(defn infoBG [] [(. (colors.normal-colors) :orange) 3 11])

; green and others are auxiliary
(defn auxFG [] (local output (. (mainFG) 1)) output)

(defn groupFunction [] (var output "")
      (if (= vim.o.background :light)
          (do
            (set output (ucolors.saturation (ucolors.darken (. (colors.normal-colors)
                                                               :green)
                                                            0.5)
                                            0.4)))
          (do
            (set output (ucolors.saturation (ucolors.brighten (. (colors.normal-colors)
                                                                 :green)
                                                              0.5)
                                            -0.2)))) output)

(defn auxBG [] (local output [(groupFunction) 2 10]) output)

; this covers the main highlight groups

(defn high-colors []
      [{:group :Normal
        :fg (. (mainFG) 1)
        :bg (. (mainBG) 1)
        :ctermfg (. (mainFG) 2)
        :ctermbg (. (mainBG) 2)}
       {:group :NormalNC
        :fg (. (mainFG) 1)
        :bg (. (mainBG) 1)
        :ctermfg (. (mainFG) 2)
        :ctermbg (. (mainBG) 2)}
       {:group :NormalFloat
        :fg (. (mainFG) 1)
        :bg (. (shadowBG) 1)
        :ctermfg (. (mainFG) 2)
        :ctermbg (. (umbraBG) 2)}
       {:group :NonText
        :fg (. (shadowFG) 1)
        :bg (. (mainBG) 1)
        :ctermfg (. (umbraFG) 2)
        :ctermbg (. (mainBG) 2)}
       ; TODO set match paren to TS rainbow?
       {:group :MatchParen
        :fg :SKIP
        :bg (. (shadowBG) 1)
        :ctermfg :SKIP
        :ctermbg (. (umbraBG) 2)
        :bold true}
       {:group :SpecialKey
        :fg (ucolors.blend (. (errorBG) 1) (. (mainBG) 1) 0.6)
        :bg :NONE
        :ctermfg (. (warningBG) 2)
        :ctermbg :NONE
        :italic true}
       {:group :Whitespace
        :fg (. (colors.foreground) 5)
        :bg :SKIP
        :ctermfg (. (umbraFG) 2)
        :ctermbg :SKIP}
       {:group :EndOfBuffer
        :fg (. (umbraFG) 1)
        :bg :SKIP
        :ctermfg (. (umbraFG) 2)
        :ctermbg :SKIP
        :bold true}
       {:group :Directory
        :fg (ucolors.blend (ucolors.blend (. (infoBG) 1) (. (mainFG) 1) 0.1)
                           (. (selectionBG) 1) 0.2)
        :bg :SKIP
        :ctermfg (. (selectionBG) 2)
        :ctermbg :SKIP}
       {:group :Conceal
        :fg (. (shadowBG) 1)
        :bg :NONE
        :ctermfg (. (umbraBG) 2)
        :ctermbg :NONE}
       ; Spelling
       {:group :SpellBad
        :fg :SKIP
        :bg :SKIP
        :ctermfg :SKIP
        :ctermbg :NONE
        :undercurl true
        :sp (. (errorBG) 1)}
       {:group :SpellCap
        :fg :SKIP
        :bg :SKIP
        :ctermfg :SKIP
        :ctermbg :NONE
        :undercurl true
        :sp (. (selectionBG) 1)}
       {:group :SpellLocal
        :fg :SKIP
        :bg :SKIP
        :ctermfg :SKIP
        :ctermbg :NONE
        :undercurl true
        :sp (. (auxBG) 1)}
       {:group :SpellRare
        :fg :SKIP
        :bg :SKIP
        :ctermfg :SKIP
        :ctermbg :NONE
        :undercurl true
        :sp (. (fillBG) 1)}
       ; Statusline
       {:group :StatusLine
        :fg (. (colors.background) 5)
        :bg (ucolors.blend (. (highlightBG) 1) (. (mainBG) 1) 0.7)
        :ctermfg (. (umbraBG) 2)
        :ctermbg (. (highlightBG) 3)
        :bold true}
       {:group :StatusLineNC
        :fg (ucolors.blend (. (highlightBG) 1) (. (mainBG) 1) 0.7)
        :bg (. (colors.background) 5)
        :ctermfg (. (umbraBG) 2)
        :ctermbg (. (highlightBG) 3)
        :bold true}
       ; Tabline
       ; we need to make the dark soft font brighter to match dark hard tabline
       ; looks bad otherwise imo
       (if (and (= vim.o.background :dark) (= main.contrast :soft))
           (do
             (var color (ucolors.brighten (. (highlightFG) 1) 0))
             {:group :TabLine
              :fg color
              :bg (. (highlightBG) 1)
              :ctermfg (. (highlightFG) 2)
              :ctermbg (. (highlightBG) 2)}
             {:group :TabLineFill
              :fg (. (fillBG) 1)
              :bg (. (fillBG) 1)
              :ctermfg (. (fillBG) 2)
              :ctermbg (. (fillBG) 2)}
             {:group :TabLineSel
              :fg color
              :bg (. (selectionBG) 1)
              :ctermfg (. (selectionFG) 2)
              :ctermbg (. (selectionBG) 2)
              :bold true})
           (do
             {:group :TabLine
              :fg (. (highlightFG) 1)
              :bg (. (highlightBG) 1)
              :ctermfg (. (highlightFG) 2)
              :ctermbg (. (highlightBG) 2)}
             {:group :TabLineFill
              :fg (. (fillBG) 1)
              :bg (. (fillBG) 1)
              :ctermfg (. (fillBG) 2)
              :ctermbg (. (fillBG) 2)}
             {:group :TabLineSel
              :fg (. (selectionFG) 1)
              :bg (. (selectionBG) 1)
              :ctermfg (. (selectionFG) 2)
              :ctermbg (. (selectionBG) 2)
              :bold true}))
       {:group :Title
        :fg (. (auxBG) 1)
        :bg :NONE
        :ctermfg (. (auxBG) 2)
        :ctermbg :NONE
        :bold true}
       {:group :Visual
        :fg :SKIP
        :bg (ucolors.darken (. (selectionBG) 1) 0.2)
        :ctermfg :SKIP
        :ctermbg (. (warningBG) 2)}
       {:group :VisualNOS
        :fg :SKIP
        :bg (ucolors.blend (. (selectionBG) 1) (. (mainFG) 1) 0.5)
        :ctermfg :SKIP
        :ctermbg (. (warningBG) 2)}
       ; Pmenu
       {:group :Pmenu
        :fg (. (fillFG) 1)
        :bg (. (fillBG) 1)
        :ctermfg (. (fillFG) 2)
        :ctermbg (. (fillBG) 2)}
       {:group :PmenuSel
        :fg (. (selectionFG) 1)
        :bg (. (selectionBG) 1)
        :ctermfg (. (selectionFG) 2)
        :ctermbg (. (selectionBG) 2)}
       {:group :PmenuSbar
        :fg (. (highlightFG) 1)
        :bg (. (highlightBG) 1)
        :ctermfg (. (highlightFG) 2)
        :ctermbg (. (highlightBG) 2)}
       {:group :PmenuThumb
        :fg (. (selectionFG) 1)
        :bg (. (selectionBG) 1)
        :ctermfg (. (selectionFG) 2)
        :ctermbg (. (selectionBG) 2)}
       {:group :WildMenu
        :fg (. (selectionFG) 1)
        :bg (. (selectionBG) 1)
        :ctermfg (. (selectionFG) 2)
        :ctermbg (. (selectionBG) 2)}
       {:group :Question
        :fg (ucolors.blend (. (auxBG) 1) (. (mainFG) 1) 0.7)
        :bg :SKIP
        :ctermfg (. (auxBG) 3)
        :ctermbg :SKIP
        :bold true
        :underline true
        :sp (. (auxBG) 1)}
       {:group :QuickFixLine
        :fg :SKIP
        :bg (. (selectionBG) 1)
        :ctermfg :SKIP
        :ctermbg (. (selectionBG) 2)}
       ; Cursor
       {:group :Cursor
        :fg :SKIP
        :bg (. (mainFG) 1)
        :ctermfg :SKIP
        :ctermbg (. (mainFG) 2)
        :reverse true}
       {:group :CursorIM
        :fg :SKIP
        :bg (. (umbraFG) 1)
        :ctermfg :SKIP
        :ctermbg (. (umbraFG) 2)
        :reverse true}
       {:group :lCursor
        :fg :SKIP
        :bg (. (shadowFG) 1)
        :ctermfg :SKIP
        :ctermbg (. (umbraFG) 2)
        :reverse true}
       {:group :CursorColumn
        :fg :SKIP
        :bg (. (shadowBG) 1)
        :ctermfg :SKIP
        :ctermbg (. (umbraBG) 2)}
       {:group :CursorLine
        :fg :SKIP
        :bg (. (shadowBG) 1)
        :ctermfg :SKIP
        :ctermbg (. (umbraBG) 2)}
       {:group :ColorColumn
        :fg :NONE
        :bg (ucolors.blend (. (selectionBG) 1) (. (mainFG) 1) 0.8)
        :ctermfg :NONE
        :ctermbg (. (selectionBG) 3)
        :bold true}
       {:group :TermCursor
        :fg :SKIP
        :bg (. (mainFG) 1)
        :ctermfg :SKIP
        :ctermbg (. (mainFG) 2)
        :reverse true}
       {:group :TermCursorNC
        :fg :SKIP
        :bg (. (umbraFG) 1)
        :ctermfg :SKIP
        :ctermbg (. (umbraFG) 2)
        :reverse true}
       {:group :ErrorMsg
        :fg (. (errorFG) 1)
        :bg (. (errorBG) 1)
        :ctermfg (. (errorFG) 2)
        :ctermbg (. (errorBG) 2)
        :bold true}
       {:group :WarningMsg
        :fg (. (warningFG) 1)
        :bg (. (warningBG) 1)
        :ctermfg (. (warningFG) 2)
        :ctermbg (. (warningBG) 2)}
       {:group :VertSplit
        :fg (. (shadowBG) 1)
        :bg (. (shadowFG) 1)
        :ctermfg (. (umbraBG) 2)
        :ctermbg (. (umbraFG) 2)}
       {:group :Folded
        :fg (. (selectionFG) 1)
        :bg (. (shadowBG) 1)
        :ctermfg (. (selectionFG) 2)
        :ctermbg (. (umbraBG) 2)
        :bold true}
       {:group :FoldColumn
        :fg (. (selectionBG) 1)
        :bg :NONE
        :ctermfg (. (selectionBG) 2)
        :ctermbg :NONE
        :bold true}
       {:group :SignColumn
        :fg :NONE
        :bg :NONE
        :ctermfg :NONE
        :ctermbg :NONE
        :bold true}
       {:group :IncSearch
        :fg (. (mainFG) 1)
        :bg (. (infoBG) 1)
        :ctermfg (. (mainFG) 2)
        :ctermbg (. (infoBG) 2)
        :reverse false}
       {:group :Substitute
        :fg (. (infoFG) 1)
        :bg (ucolors.blend (. (infoBG) 1) (. (mainFG) 1) 0.7)
        :ctermfg (. (infoFG) 2)
        :ctermbg (. (infoBG) 3)}
       {:group :Search
        :fg (. (infoFG) 1)
        :bg (ucolors.blend (. (infoBG) 1) (. (mainBG) 1) 0.7)
        :ctermfg (. (infoFG) 2)
        :ctermbg (. (infoBG) 2)}
       {:group :LineNr
        :fg (. (fillBG) 1)
        :bg :SKIP
        :ctermfg (. (fillBG) 2)
        :ctermbg :SKIP}
       {:group :CursorLineNr
        :fg (ucolors.blend (. (fillBG) 1) (. (mainFG) 1) 0.6)
        :bg :SKIP
        :ctermfg (. (fillBG) 3)
        :ctermbg :SKIP
        :bold true}
       {:group :ModeMsg
        :fg (. (mainFG) 1)
        :bg (. (shadowBG) 1)
        :ctermfg (. (mainFG) 2)
        :ctermbg (. (umbraBG) 2)
        :bold true}
       {:group :MsgArea
        :fg (. (mainFG) 1)
        :bg (. (umbraBG) 1)
        :ctermfg (. (mainFG) 2)
        :ctermbg (. (umbraBG) 2)}
       {:group :MsgSeparator
        :fg (. (mainFG) 1)
        :bg (. (umbraBG) 1)
        :ctermfg (. (mainFG) 2)
        :ctermbg (. (umbraBG) 2)}
       {:group :MoreMsg
        :fg (. (auxBG) 1)
        :bg :SKIP
        :ctermfg (. (auxBG) 2)
        :ctermbg :SKIP}
       {:group :debugPC
        :fg :SKIP
        :bg (ucolors.blend (. (selectionBG) 1) (. (mainFG) 1) 0.6)
        :ctermfg :SKIP
        :ctermbg (. (selectionBG) 3)}
       {:group :debugBreakpoint
        :fg :SKIP
        :bg (ucolors.blend (. (errorBG) 1) (. (mainFG) 1) 0.6)
        :ctermfg :SKIP
        :ctermbg (. (warningBG) 2)}
       (if (= (vim.fn.has :gui) 1)
           (do
             {:group :Menu
              :fg (. (mainFG) 1)
              :bg (. (mainBG) 1)
              :ctermfg (. (mainFG) 2)
              :ctermbg (. (mainBG) 2)}
             {:group :Tooltip
              :fg (. (fillFG) 1)
              :bg (. (fillBG) 1)
              :ctermfg (. (fillFG) 2)
              :ctermbg (. (fillBG) 2)}
             {:group :Scrollbar
              :fg (. (highlightFG) 1)
              :bg (. (highlightBG) 1)
              :ctermfg (. (highlightFG) 2)
              :ctermbg (. (highlightBG) 2)}))])

(defn init [] (run.highlight$<-table (high-colors)))
