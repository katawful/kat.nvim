(module katdotnvim.highlights.main
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.highlight.utils
                   run katdotnvim.utils.highlight.run
                   main katdotnvim.main}
         require-macros [katcros-fnl.macros.nvim.api.utils.macros]})

;;; Define variables to use for generic uses.
;;; Each variable is actually a function that gets called so that they always
;;; -update and work with Aniseed modules.
;;; TODO: replace with just color export table
(defn mainFG [] (var output {})
      (if (and (= (. main.background-mut 1) :dark)
               (= (. main.contrast-mut 1) :soft))
          (do
            (tset output 1 (ucolors.brighten colors.kat.fg.base.color 0.8))
            (tset output 2 7))
          (do
            (tset output 1 colors.kat.fg.base.color)
            (tset output 2 7))) output)

(defn mainBG [] [colors.kat.bg.base.color 0])

(defn umbraFG [] [colors.kat.fg.umbra.color 15])

(defn umbraBG [] [colors.kat.bg.umbra.color 8])

(defn shadowFG [] [colors.kat.fg.shadow.color 16])

(defn shadowBG [] [colors.kat.bg.shadow.color 16])

(defn meldFG [] [colors.kat.fg.meld.color 16])

(defn meldBG [] [colors.kat.bg.meld.color 16])

; pink/purple/blue are structural
(defn selectionFG [] (local output [colors.kat.fg.auto.color 7]) output)

(defn selectionBG [] [colors.kat.blue.base.color 4 12])

(defn fillFG [] (local output [colors.kat.fg.auto.color 7]) output)

(defn fillBG [] [colors.kat.pink.base.color 5 13])

(defn highlightFG [] (local output [colors.kat.fg.auto.color 7]) output)

(defn highlightBG [] [colors.kat.purple.base.color 6 14])

; red and orange are information
(defn errorFG [] (local output [colors.kat.fg.auto.color 7]) output)

(defn errorBG [] [colors.kat.red.base.color 1])

(defn warningFG [] (local output [colors.kat.fg.auto.color 7]) output)

(defn warningBG [] (local output [(ucolors.blend colors.kat.red.base.color
                                                 colors.kat.bg.base.color 0.7)
                                  9]) output)

(defn infoFG [] (local output [colors.kat.bg.base.color 0]) output)

(defn infoBG [] [colors.kat.orange.base.color 3 11])

; green and others are auxiliary
(defn auxFG [] (local output colors.kat.fg.auto.color) output)

(defn groupFunction [] (var output "")
      (if (= (. main.background-mut 1) :light)
          (do
            (set output (-> colors.kat.green.base.color
                            (ucolors.darken 0.5)
                            (ucolors.saturation 0.4))))
          (do
            (set output (-> colors.kat.green.base.color
                            (ucolors.brighten 0.5)
                            (ucolors.saturation -0.2))))) output)

(defn auxBG [] (local output [(groupFunction) 2 10]) output)

(defn high-colors []
      [{:group :Normal
        :fg colors.kat.fg.auto.color
        :bg colors.kat.bg.base.color
        :ctermfg (. (mainFG) 2)
        :ctermbg (. (mainBG) 2)}
       {:group :NormalNC
        :fg colors.kat.fg.auto.color
        :bg colors.kat.bg.base.color
        :ctermfg (. (mainFG) 2)
        :ctermbg (. (mainBG) 2)}
       {:group :NormalFloat
        :fg colors.kat.fg.auto.color
        :bg colors.kat.bg.shadow.color
        :ctermfg (. (mainFG) 2)
        :ctermbg (. (umbraBG) 2)}
       {:group :NonText
        :fg colors.kat.fg.shadow.color
        :bg colors.kat.bg.base.color
        :ctermfg (. (umbraFG) 2)
        :ctermbg (. (mainBG) 2)}
       ;; TODO set match paren to TS rainbow?
       {:group :MatchParen
        :fg :SKIP
        :bg colors.kat.bg.shadow.color
        :ctermfg :SKIP
        :ctermbg (. (umbraBG) 2)
        :bold true}
       {:group :SpecialKey
        :fg (ucolors.blend colors.kat.red.base.color colors.kat.bg.base.color 0.6)
        :bg :NONE
        :ctermfg (. (warningBG) 2)
        :ctermbg :NONE
        :italic true}
       {:group :Whitespace
        :fg colors.kat.fg.fifth.color
        :bg :SKIP
        :ctermfg (. (umbraFG) 2)
        :ctermbg :SKIP}
       {:group :EndOfBuffer
        :fg colors.kat.fg.umbra.color
        :bg :SKIP
        :ctermfg (. (umbraFG) 2)
        :ctermbg :SKIP
        :bold true}
       {:group :Directory
        :fg (-> colors.kat.orange.base.color
                (ucolors.blend colors.kat.fg.auto.color 0.1)
                (ucolors.blend colors.kat.blue.base.color 0.2))
        :bg :SKIP
        :ctermfg (. (selectionBG) 2)
        :ctermbg :SKIP}
       {:group :Conceal
        :fg colors.kat.bg.shadow.color
        :bg :NONE
        :ctermfg (. (umbraBG) 2)
        :ctermbg :NONE}
       ;; Spelling
       {:group :SpellBad
        :fg :SKIP
        :bg :SKIP
        :ctermfg :SKIP
        :ctermbg :NONE
        :undercurl true
        :sp colors.kat.red.base.color}
       {:group :SpellCap
        :fg :SKIP
        :bg :SKIP
        :ctermfg :SKIP
        :ctermbg :NONE
        :undercurl true
        :sp colors.kat.blue.base.color}
       {:group :SpellLocal
        :fg :SKIP
        :bg :SKIP
        :ctermfg :SKIP
        :ctermbg :NONE
        :undercurl true
        :sp colors.kat.green.auto.color}
       {:group :SpellRare
        :fg :SKIP
        :bg :SKIP
        :ctermfg :SKIP
        :ctermbg :NONE
        :undercurl true
        :sp colors.kat.pink.base.color}
       ;; Statusline
       {:group :StatusLine
        :fg colors.kat.bg.fifth.color
        :bg (ucolors.blend colors.kat.purple.base.color colors.kat.bg.base.color 0.7)
        :ctermfg (. (umbraBG) 2)
        :ctermbg (. (highlightBG) 3)
        :bold true}
       {:group :StatusLineNC
        :fg (ucolors.blend colors.kat.purple.base.color colors.kat.bg.base.color 0.7)
        :bg colors.kat.bg.fifth.color
        :ctermfg (. (umbraBG) 2)
        :ctermbg (. (highlightBG) 3)
        :bold true}
       ;; Tabline
       ;; Need to make the dark soft font brighter to match dark hard tabline
       (fn []
         (var color (ucolors.brighten colors.kat.fg.auto.color 0))
         (if (and (= (. main.background-mut 1) :dark)
                  (= (. main.contrast-mut 1) :soft))
             [{:group :TabLine
               :fg color
               :bg colors.kat.purple.base.color
               :ctermfg (. (highlightFG) 2)
               :ctermbg (. (highlightBG) 2)}
              {:group :TabLineFill
               :fg colors.kat.pink.base.color
               :bg colors.kat.pink.base.color
               :ctermfg (. (fillBG) 2)
               :ctermbg (. (fillBG) 2)}
              {:group :TabLineSel
               :fg color
               :bg colors.kat.blue.base.color
               :ctermfg (. (selectionFG) 2)
               :ctermbg (. (selectionBG) 2)
               :bold true}]
             [{:group :TabLine
               :fg colors.kat.fg.auto.color
               :bg colors.kat.purple.base.color
               :ctermfg (. (highlightFG) 2)
               :ctermbg (. (highlightBG) 2)}
              {:group :TabLineFill
               :fg colors.kat.pink.base.color
               :bg colors.kat.pink.base.color
               :ctermfg (. (fillBG) 2)
               :ctermbg (. (fillBG) 2)}
              {:group :TabLineSel
               :fg colors.kat.fg.auto.color
               :bg colors.kat.blue.base.color
               :ctermfg (. (selectionFG) 2)
               :ctermbg (. (selectionBG) 2)
               :bold true}]))
       {:group :Title
        :fg colors.kat.green.auto.color
        :bg :NONE
        :ctermfg (. (auxBG) 2)
        :ctermbg :NONE
        :bold true}
       {:group :Visual
        :fg :SKIP
        :bg (ucolors.darken colors.kat.blue.base.color 0.2)
        :ctermfg :SKIP
        :ctermbg (. (warningBG) 2)}
       {:group :VisualNOS
        :fg :SKIP
        :bg (ucolors.blend colors.kat.blue.base.color colors.kat.fg.auto.color 0.5)
        :ctermfg :SKIP
        :ctermbg (. (warningBG) 2)}
       ;; Pmenu
       {:group :Pmenu
        :fg colors.kat.fg.auto.color
        :bg colors.kat.pink.base.color
        :ctermfg (. (fillFG) 2)
        :ctermbg (. (fillBG) 2)}
       {:group :PmenuSel
        :fg colors.kat.fg.auto.color
        :bg colors.kat.blue.base.color
        :ctermfg (. (selectionFG) 2)
        :ctermbg (. (selectionBG) 2)}
       {:group :PmenuSbar
        :fg colors.kat.fg.auto.color
        :bg colors.kat.purple.base.color
        :ctermfg (. (highlightFG) 2)
        :ctermbg (. (highlightBG) 2)}
       {:group :PmenuThumb
        :fg colors.kat.fg.auto.color
        :bg colors.kat.blue.base.color
        :ctermfg (. (selectionFG) 2)
        :ctermbg (. (selectionBG) 2)}
       {:group :WildMenu
        :fg colors.kat.fg.auto.color
        :bg colors.kat.blue.base.color
        :ctermfg (. (selectionFG) 2)
        :ctermbg (. (selectionBG) 2)}
       {:group :Question
        :fg (ucolors.blend colors.kat.green.auto.color colors.kat.fg.auto.color 0.7)
        :bg :SKIP
        :ctermfg (. (auxBG) 3)
        :ctermbg :SKIP
        :bold true
        :underline true
        :sp colors.kat.green.auto.color}
       {:group :QuickFixLine
        :fg :SKIP
        :bg colors.kat.blue.base.color
        :ctermfg :SKIP
        :ctermbg (. (selectionBG) 2)}
       ;; Cursor
       {:group :Cursor
        :fg :SKIP
        :bg colors.kat.fg.auto.color
        :ctermfg :SKIP
        :ctermbg (. (mainFG) 2)
        :reverse true}
       {:group :CursorIM
        :fg :SKIP
        :bg colors.kat.fg.umbra.color
        :ctermfg :SKIP
        :ctermbg (. (umbraFG) 2)
        :reverse true}
       {:group :lCursor
        :fg :SKIP
        :bg colors.kat.fg.shadow.color
        :ctermfg :SKIP
        :ctermbg (. (umbraFG) 2)
        :reverse true}
       {:group :CursorColumn
        :fg :SKIP
        :bg colors.kat.bg.shadow.color
        :ctermfg :SKIP
        :ctermbg (. (umbraBG) 2)}
       {:group :CursorLine
        :fg :SKIP
        :bg colors.kat.bg.shadow.color
        :ctermfg :SKIP
        :ctermbg (. (umbraBG) 2)}
       {:group :ColorColumn
        :fg :NONE
        :bg (ucolors.blend colors.kat.blue.base.color colors.kat.fg.auto.color 0.8)
        :ctermfg :NONE
        :ctermbg (. (selectionBG) 3)
        :bold true}
       {:group :TermCursor
        :fg :SKIP
        :bg colors.kat.fg.auto.color
        :ctermfg :SKIP
        :ctermbg (. (mainFG) 2)
        :reverse true}
       {:group :TermCursorNC
        :fg :SKIP
        :bg colors.kat.fg.umbra.color
        :ctermfg :SKIP
        :ctermbg (. (umbraFG) 2)
        :reverse true}
       {:group :ErrorMsg
        :fg colors.kat.fg.auto.color
        :bg colors.kat.red.base.color
        :ctermfg (. (errorFG) 2)
        :ctermbg (. (errorBG) 2)
        :bold true}
       {:group :WarningMsg
        :fg colors.kat.fg.auto.color
        :bg colors.kat.red.match_bg.color
        :ctermfg (. (warningFG) 2)
        :ctermbg (. (warningBG) 2)}
       {:group :VertSplit
        :fg colors.kat.bg.shadow.color
        :bg colors.kat.fg.shadow.color
        :ctermfg (. (umbraBG) 2)
        :ctermbg (. (umbraFG) 2)}
       {:group :Folded
        :fg colors.kat.fg.auto.color
        :bg colors.kat.bg.shadow.color
        :ctermfg (. (selectionFG) 2)
        :ctermbg (. (umbraBG) 2)
        :bold true}
       {:group :FoldColumn
        :fg colors.kat.blue.base.color
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
        :fg colors.kat.fg.auto.color
        :bg colors.kat.orange.base.color
        :ctermfg (. (mainFG) 2)
        :ctermbg (. (infoBG) 2)
        :reverse false}
       {:group :Substitute
        :fg colors.kat.bg.base.color
        :bg (ucolors.blend colors.kat.orange.base.color colors.kat.fg.auto.color 0.7)
        :ctermfg (. (infoFG) 2)
        :ctermbg (. (infoBG) 3)}
       {:group :Search
        :fg colors.kat.bg.base.color
        :bg (ucolors.blend colors.kat.orange.base.color colors.kat.bg.base.color 0.7)
        :ctermfg (. (infoFG) 2)
        :ctermbg (. (infoBG) 2)}
       {:group :LineNr
        :fg colors.kat.pink.base.color
        :bg :SKIP
        :ctermfg (. (fillBG) 2)
        :ctermbg :SKIP}
       {:group :CursorLineNr
        :fg (ucolors.blend colors.kat.pink.base.color colors.kat.fg.auto.color 0.6)
        :bg :SKIP
        :ctermfg (. (fillBG) 3)
        :ctermbg :SKIP
        :bold true}
       {:group :ModeMsg
        :fg colors.kat.fg.auto.color
        :bg colors.kat.bg.shadow.color
        :ctermfg (. (mainFG) 2)
        :ctermbg (. (umbraBG) 2)
        :bold true}
       {:group :MsgArea
        :fg colors.kat.fg.auto.color
        :bg colors.kat.bg.umbra.color
        :ctermfg (. (mainFG) 2)
        :ctermbg (. (umbraBG) 2)}
       {:group :MsgSeparator
        :fg colors.kat.fg.auto.color
        :bg colors.kat.bg.umbra.color
        :ctermfg (. (mainFG) 2)
        :ctermbg (. (umbraBG) 2)}
       {:group :MoreMsg
        :fg colors.kat.green.auto.color
        :bg :SKIP
        :ctermfg (. (auxBG) 2)
        :ctermbg :SKIP}
       {:group :debugPC
        :fg :SKIP
        :bg (ucolors.blend colors.kat.blue.base.color colors.kat.fg.auto.color 0.6)
        :ctermfg :SKIP
        :ctermbg (. (selectionBG) 3)}
       {:group :debugBreakpoint
        :fg :SKIP
        :bg (ucolors.blend colors.kat.red.base.color colors.kat.fg.auto.color 0.6)
        :ctermfg :SKIP
        :ctermbg (. (warningBG) 2)}
       (fn []
         (if (do-viml has :gui)
             (do
               {:group :Menu
                :fg colors.kat.fg.auto.color
                :bg colors.kat.bg.base.color
                :ctermfg (. (mainFG) 2)
                :ctermbg (. (mainBG) 2)}
               {:group :Tooltip
                :fg colors.kat.fg.auto.color
                :bg colors.kat.pink.base.color
                :ctermfg (. (fillFG) 2)
                :ctermbg (. (fillBG) 2)}
               {:group :Scrollbar
                :fg colors.kat.fg.auto.color
                :bg colors.kat.purple.base.color
                :ctermfg (. (highlightFG) 2)
                :ctermbg (. (highlightBG) 2)})))])

(defn init [] (run.highlight$<-table (high-colors)))
