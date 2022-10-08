(local ucolors (require :katdotnvim.utils.highlight.utils))
(local colors (require :katdotnvim.color))
(local syntax (require :katdotnvim.highlights.syntax))
(local groups (require :katdotnvim.highlights.main))
(local main (require :katdotnvim.main))
(local mainFG ((. (require :katdotnvim.highlights.main) :mainFG)))

(if (and (= (. main.background-mut 1) :dark) (= (. main.contrast-mut 1) :soft))
    (do
      (tset mainFG 1 (ucolors.brighten colors.kat.fg.auto.color 0.8))))

(fn normalMode_c []
  (local output {1 colors.kat.fg.auto.color
                 2 colors.kat.pink.base.color
                 3 (. (mainFG) 2)
                 4 (. (groups.fillBG) 2)
                 5 ""})
  output)

(fn normalMode_b []
  (local output {1 colors.kat.fg.auto.color
                 2 colors.kat.blue.mix_shadow_bg.color
                 3 (. (mainFG) 2)
                 4 (. (groups.selectionBG) 2)
                 5 ""})
  output)

(fn normalMode_a []
  (local output {1 colors.kat.fg.auto.color
                 2 colors.kat.purple.base.color
                 3 (. (mainFG) 2)
                 4 (. (groups.highlightBG) 2)
                 5 ""})
  output)

(fn replaceMode_c []
  (local output {1 colors.kat.fg.auto.color
                 2 colors.kat.blue.brighten.color
                 3 (. (mainFG) 2)
                 4 (. (groups.selectionBG) 2)
                 5 ""})
  output)

(fn replaceMode_b []
  (local output {1 colors.kat.fg.auto.color
                 2 colors.kat.blue.mix_shadow_bg.color
                 3 (. (mainFG) 2)
                 4 (. (groups.selectionBG) 3)
                 5 ""})
  output)

(fn replaceMode_a []
  (local output {1 colors.kat.fg.auto.color
                 2 colors.kat.orange.base.color
                 3 (. (mainFG) 2)
                 4 (. (groups.infoBG) 2)
                 5 :bold})
  output)

(fn visualMode_c []
  (local output {1 colors.kat.fg.auto.color
                 2 colors.kat.purple.base.color
                 3 (. (mainFG) 2)
                 4 (. (groups.highlightBG) 2)
                 5 ""})
  output)

(fn visualMode_b []
  (local output {1 colors.kat.fg.auto.color
                 2 colors.kat.blue.mix_shadow_bg.color
                 3 (. (mainFG) 2)
                 4 (. (groups.selectionBG) 3)
                 5 ""})
  output)

(fn visualMode_a []
  (local output {1 colors.kat.fg.auto.color
                 2 colors.kat.red.base.color
                 3 (. (mainFG) 2)
                 4 (. (groups.errorBG) 2)
                 5 :bold})
  output)

(fn insertMode_c []
  (local output {1 colors.kat.fg.auto.color
                 2 (ucolors.brighten colors.kat.blue.base.color 0.2)
                 3 (. (mainFG) 2)
                 4 (. (groups.selectionBG) 2)
                 5 ""})
  output)

(fn insertMode_b []
  (local output {1 colors.kat.fg.auto.color
                 2 colors.kat.blue.mix_shadow_bg.color
                 3 (. (mainFG) 2)
                 4 (. (groups.selectionBG) 3)
                 5 ""})
  output)

(fn insertMode_a []
  (local output {1 colors.kat.fg.auto.color
                 2 colors.kat.blue.base.color
                 3 (. (mainFG) 2)
                 4 (. (groups.selectionBG) 2)
                 5 :bold})
  output)

(fn terminalMode_c []
  (local output {1 colors.kat.fg.auto.color
                 2 colors.kat.red.match_bg.color
                 3 (. (mainFG) 2)
                 4 (. (groups.errorBG) 2)
                 5 ""})
  output)

(fn terminalMode_b []
  (local output {1 colors.kat.fg.auto.color
                 2 colors.kat.blue.mix_shadow_bg.color
                 3 (. (mainFG) 2)
                 4 (. (groups.selectionBG) 3)
                 5 ""})
  output)

(fn terminalMode_a []
  (local output {1 colors.kat.fg.auto.color
                 2 colors.kat.pink.match_bg.color
                 3 (. (mainFG) 2)
                 4 (. (groups.fillBG) 3)
                 5 :bold})
  output)

(fn inactiveGroup []
  (local output {1 colors.kat.bg.base.color
                 2 colors.kat.fg.shadow.color
                 3 (. (mainFG) 2)
                 4 (. (groups.umbraBG) 2)
                 5 ""})
  output)

(fn warningGroup []
  (local output {1 colors.kat.fg.auto.color
                 2 colors.kat.red.match_bg.color
                 3 (. (mainFG) 2)
                 4 (. (groups.warningBG) 2)
                 5 ""})
  output)

(fn errorGroup []
  (local output {1 colors.kat.fg.auto.color
                 2 colors.kat.red.base.color
                 3 (. (mainFG) 2)
                 4 (. (groups.errorBG) 2)
                 5 ""})
  output)

(fn modifiedC [mode]
  (var output {})
  (match mode
    :normal (do
              (set output {1 colors.kat.fg.auto.color 2 "" 3 (. (mainFG) 2) 4 "" 5 ""}))
    :insert (do
              (set output {1 colors.kat.fg.auto.color 2 "" 3 (. (mainFG) 2) 4 "" 5 ""}))
    :replace (do
               (set output {1 colors.kat.fg.auto.color 2 "" 3 (. (mainFG) 2) 4 "" 5 ""}))
    :visual (do
              (set output {1 colors.kat.fg.auto.color 2 "" 3 (. (mainFG) 2) 4 "" 5 ""}))
    :inactive (do
                (set output {1 colors.kat.bg.base.color
                             2 ""
                             3 (. (groups.mainBG) 2)
                             4 ""
                             5 ""})))
  output)
