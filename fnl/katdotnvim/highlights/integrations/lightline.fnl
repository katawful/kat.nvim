(module katdotnvim.highlights.integrations.lightline
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main
                   main katdotnvim.main}})

(defn mainFG []
  (var output (groups.mainFG))

  (if (and (= vim.o.background :dark)
           (= main.katContrast :soft))
      (do (set output (ucolors.brighten (groups.mainFG) 0.8))))
  output)

(defn normalMode_c []
  (def output
    {1 (mainFG)
     2 (groups.fillBG)
     3 :NONE
     4 :NONE
     5 ""})
  output)

(defn normalMode_b []
  (def output
    {1 (mainFG)
     2 (ucolors.blendColors (groups.selectionBG) (groups.shadowBG) 0.4)
     3 :NONE
     4 :NONE
     5 ""})
  output)

(defn normalMode_a []
  (def output
    {1 (mainFG)
     2 (groups.highlightBG)
     3 :NONE
     4 :NONE
     5 "bold"})
  output)

(defn replaceMode_c []
  (def output
    {1 (mainFG)
     2 (ucolors.brighten (groups.selectionBG) 0.2)
     3 :NONE
     4 :NONE
     5 ""})
  output)

(defn replaceMode_b []
  (def output
    {1 (mainFG)
     2 (ucolors.blendColors (groups.selectionBG) (groups.shadowBG) 0.4)
     3 :NONE
     4 :NONE
     5 ""})
  output)

(defn replaceMode_a []
  (def output
    {1 (mainFG)
     2 (groups.infoBG)
     3 :NONE
     4 :NONE
     5 "bold"})
  output)

(defn visualMode_c []
  (def output
    {1 (mainFG)
     2 (groups.highlightBG)
     3 :NONE
     4 :NONE
     5 ""})
  output)

(defn visualMode_b []
  (def output
    {1 (mainFG)
     2 (ucolors.blendColors (groups.selectionBG) (groups.shadowBG) 0.4)
     3 :NONE
     4 :NONE
     5 ""})
  output)

(defn visualMode_a []
  (def output
    {1 (mainFG)
     2 (groups.errorBG)
     3 :NONE
     4 :NONE
     5 "bold"})
  output)

(defn insertMode_c []
  (def output
    {1 (mainFG)
     2 (ucolors.brighten (groups.selectionBG) 0.2)
     3 :NONE
     4 :NONE
     5 ""})
  output)

(defn insertMode_b []
  (def output
    {1 (mainFG)
     2 (ucolors.blendColors (groups.selectionBG) (groups.shadowBG) 0.4)
     3 :NONE
     4 :NONE
     5 ""})
  output)

(defn insertMode_a []
  (def output
    {1 (mainFG)
     2 (groups.selectionBG)
     3 :NONE
     4 :NONE
     5 "bold"})
  output)

(defn terminalMode_c []
  (def output
    {1 (mainFG)
     2 (ucolors.blendColors (groups.errorBG) (groups.mainBG) 0.8)
     3 :NONE
     4 :NONE
     5 ""})
  output)

(defn terminalMode_b []
  (def output
    {1 (mainFG)
     2 (ucolors.blendColors (groups.selectionBG) (groups.shadowBG) 0.4)
     3 :NONE
     4 :NONE
     5 ""})
  output)

(defn terminalMode_a []
  (def output
    {1 (mainFG)
     2 (ucolors.blendColors (groups.fillBG) (groups.mainBG) 0.8)
     3 :NONE
     4 :NONE
     5 "bold"})
  output)

(defn inactiveGroup []
  (def output
    {1 (groups.mainBG)
     2 (. (colors.init :foreground) 3)
     3 ""
     4 ""
     5 ""})
  output)

(defn warningGroup []
  (def output
    {1 (mainFG)
     2 (groups.warningBG)
     3 ""
     4 ""
     5 ""})
  output)

(defn errorGroup []
  (def output
    {1 (mainFG)
     2 (groups.errorBG)
     3 ""
     4 ""
     5 ""})
  output)

(defn modifiedC [mode]
  (var output {})
  (match mode
    :normal (do (set output {1 (mainFG)
               2 ""
               3 ""
               4 ""
               5 ""}))
    :insert (do (set output {1 (mainFG)
               2 ""
               3 ""
               4 ""
               5 ""}))
    :replace (do (set output {1 (mainFG)
               2 ""
               3 ""
               4 ""
               5 ""}))
    :visual (do (set output {1 (mainFG)
               2 ""
               3 ""
               4 ""
               5 ""}))
    :inactive (do (set output {1 (groups.mainBG)
               2 ""
               3 ""
               4 ""
               5 ""})))
    output)
