(local ucolors (require :katdotnvim.utils.color))
(local colors (require :katdotnvim.color))
(local syntax (require :katdotnvim.highlights.syntax))
(local groups (require :katdotnvim.highlights.main))
(local main (require :katdotnvim.main))
(local mainFG (. (groups.mainFG) 1))

(if (and (= vim.o.background :dark)
         (= main.katContrast :soft))
  (do
    (tset mainFG 1 (ucolors.brighten (. (groups.mainFG) 1) 0.8))))

(fn normalMode_c []
  (local output
    {1 (. (mainFG) 1)
     2 (. (groups.fillBG) 1)
     3 (. (mainFG) 2)
     4 (. (groups.fillBG) 2)
     5 ""})
  output)

(fn normalMode_b []
  (local output
    {1 (. (mainFG) 1)
     2 (ucolors.blendColors (. (groups.selectionBG) 1) (. (groups.shadowBG) 1) 0.4)
     3 (. (mainFG) 2)
     4 (. (groups.selectionBG) 2)
     5 ""})
  output)

(fn normalMode_a []
  (local output 
    {1 (. (mainFG) 1)
     2 (. (groups.highlightBG) 1)
     3 (. (mainFG) 2)
     4 (. (groups.highlightBG) 2)
     5 ""})
  output)

(fn replaceMode_c []
  (local output
    {1 (. (mainFG) 1)
     2 (ucolors.brighten (. (groups.selectionBG) 1) 0.2)
     3 (. (mainFG) 2)
     4 (. (groups.selectionBG) 2)
     5 ""})
  output)

(fn replaceMode_b []
  (local output
    {1 (. (mainFG) 1)
     2 (ucolors.blendColors (. (groups.selectionBG) 1) (. (groups.shadowBG) 1) 0.4)
     3 (. (mainFG) 2)
     4 (. (groups.selectionBG) 3)
     5 ""})
  output)

(fn replaceMode_a []
  (local output 
    {1 (. (mainFG) 1)
     2 (. (groups.infoBG) 1)
     3 (. (mainFG) 2)
     4 (. (groups.infoBG) 2)
     5 "bold"})
  output)

(fn visualMode_c []
  (local output
    {1 (. (mainFG) 1)
     2 (. (groups.highlightBG) 1)
     3 (. (mainFG) 2)
     4 (. (groups.highlightBG) 2)
     5 ""})
  output)

(fn visualMode_b []
  (local output
    {1 (. (mainFG) 1)
     2 (ucolors.blendColors (. (groups.selectionBG) 1) (. (groups.shadowBG) 1) 0.4)
     3 (. (mainFG) 2)
     4 (. (groups.selectionBG) 3)
     5 ""})
  output)

(fn visualMode_a []
  (local output 
    {1 (. (mainFG) 1)
     2 (. (groups.errorBG) 1)
     3 (. (mainFG) 2)
     4 (. (groups.errorBG) 2)
     5 "bold"})
  output)

(fn insertMode_c []
  (local output
    {1 (. (mainFG) 1)
     2 (ucolors.brighten (. (groups.selectionBG) 1) 0.2)
     3 (. (mainFG) 2)
     4 (. (groups.selectionBG) 2)
     5 ""})
  output)

(fn insertMode_b []
  (local output
    {1 (. (mainFG) 1)
     2 (ucolors.blendColors (. (groups.selectionBG) 1) (. (groups.shadowBG) 1) 0.4)
     3 (. (mainFG) 2)
     4 (. (groups.selectionBG) 3)
     5 ""})
  output)

(fn insertMode_a []
  (local output 
    {1 (. (mainFG) 1)
     2 (. (groups.selectionBG) 1)
     3 (. (mainFG) 2)
     4 (. (groups.selectionBG) 2)
     5 "bold"})
  output)

(fn terminalMode_c []
  (local output
    {1 (. (mainFG) 1)
     2 (ucolors.blendColors (. (groups.errorBG) 1) (. (groups.mainBG) 1) 0.8)
     3 (. (mainFG) 2)
     4 (. (groups.errorBG) 2)
     5 ""})
  output)

(fn terminalMode_b []
  (local output
    {1 (. (mainFG) 1)
     2 (ucolors.blendColors (. (groups.selectionBG) 1) (. (groups.shadowBG) 1) 0.4)
     3 (. (mainFG) 2)
     4 (. (groups.selectionBG) 3)
     5 ""})
  output)

(fn terminalMode_a []
  (local output
    {1 (. (mainFG) 1)
     2 (ucolors.blendColors (. (groups.fillBG) 1) (. (groups.mainBG) 1) 0.8)
     3 (. (mainFG) 2)
     4 (. (groups.fillBG) 3)
     5 "bold"})
  output)

(fn inactiveGroup []
  (local output
    {1 (. (groups.mainBG) 1)
     2 (. (colors.foreground) 3)
     3 (. (mainFG) 2)
     4 (. (groups.umbraBG) 2)
     5 ""})
     
  output)

(fn warningGroup []
  (local output {1 (. (mainFG) 1)
                 2 (. (groups.warningBG) 1)
                 3 (. (mainFG) 2)
                 4 (. (groups.warningBG) 2)
                 5 ""})
               
  output)

(fn errorGroup []
  (local output {1 (. (mainFG) 1)
                 2 (. (groups.errorBG) 1)
                 3 (. (mainFG) 2)
                 4 (. (groups.errorBG) 2)
                 5 ""})
               
  output)

(fn modifiedC [mode]
  (var output {})
  (match mode
    :normal (do (set output {1 (. (mainFG) 1)
                             2 ""
                             3 (. (mainFG) 2)
                             4 ""
                             5 ""}))
    :insert (do (set output {1 (. (mainFG) 1)
                             2 ""
                             3 (. (mainFG) 2)
                             4 ""
                             5 ""}))
    :replace (do (set output {1 (. (mainFG) 1)
                              2 ""
                              3 (. (mainFG) 2)
                              4 ""
                              5 ""}))
    :visual (do (set output {1 (. (mainFG) 1)
                             2 ""
                             3 (. (mainFG) 2)
                             4 ""
                             5 ""}))
    :inactive (do (set output {1 (. (groups.mainBG) 1)
                               2 ""
                               3 (. (groups.mainBG) 2)
                               4 ""
                               5 ""})))
  output)
