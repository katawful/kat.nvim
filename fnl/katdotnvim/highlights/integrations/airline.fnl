(module katdotnvim.highlights.integrations.airline
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main
                   main katdotnvim.main}})

(defn mainFG []
  (var output (groups.mainFG))

  (if (and (= vim.o.background :dark)
           (= main.katContrast :soft))
      (do (tset output 1 (ucolors.brighten (. (groups.mainFG) 1) 0.8))))
  output)

(defn normalMode_c []
  (def output
    {1 (. (mainFG) 1)
     2 (. (groups.fillBG) 1)
     3 (. (mainFG) 2)
     4 (. (groups.fillBG) 2)
     5 ""})
  output)

(defn normalMode_b []
  (def output
    {1 (. (mainFG) 1)
     2 (ucolors.blendColors (. (groups.selectionBG) 1) (. (groups.shadowBG) 1) 0.4)
     3 (. (mainFG) 2)
     4 (. (groups.selectionBG) 2)
     5 ""})
  output)

(defn normalMode_a []
  (def output 
    {1 (. (mainFG) 1)
     2 (. (groups.highlightBG) 1)
     3 (. (mainFG) 2)
     4 (. (groups.highlightBG) 2)
     5 ""})
  output)

(defn replaceMode_c []
  (def output
    {1 (. (mainFG) 1)
     2 (ucolors.brighten (. (groups.selectionBG) 1) 0.2)
     3 (. (mainFG) 2)
     4 (. (groups.selectionBG) 2)
     5 ""})
  output)

(defn replaceMode_b []
  (def output
    {1 (. (mainFG) 1)
     2 (ucolors.blendColors (. (groups.selectionBG) 1) (. (groups.shadowBG) 1) 0.4)
     3 (. (mainFG) 2)
     4 (. (groups.selectionBG) 3)
     5 ""})
  output)

(defn replaceMode_a []
  (def output 
    {1 (. (mainFG) 1)
     2 (. (groups.infoBG) 1)
     3 (. (mainFG) 2)
     4 (. (groups.infoBG) 2)
     5 "bold"})
  output)

(defn visualMode_c []
  (def output
    {1 (. (mainFG) 1)
     2 (. (groups.highlightBG) 1)
     3 (. (mainFG) 2)
     4 (. (groups.highlightBG) 2)
     5 ""})
  output)

(defn visualMode_b []
  (def output
    {1 (. (mainFG) 1)
     2 (ucolors.blendColors (. (groups.selectionBG) 1) (. (groups.shadowBG) 1) 0.4)
     3 (. (mainFG) 2)
     4 (. (groups.selectionBG) 3)
     5 ""})
  output)

(defn visualMode_a []
  (def output 
    {1 (. (mainFG) 1)
     2 (. (groups.errorBG) 1)
     3 (. (mainFG) 2)
     4 (. (groups.errorBG) 2)
     5 "bold"})
  output)

(defn insertMode_c []
  (def output
    {1 (. (mainFG) 1)
     2 (ucolors.brighten (. (groups.selectionBG) 1) 0.2)
     3 (. (mainFG) 2)
     4 (. (groups.selectionBG) 2)
     5 ""})
  output)

(defn insertMode_b []
  (def output
    {1 (. (mainFG) 1)
     2 (ucolors.blendColors (. (groups.selectionBG) 1) (. (groups.shadowBG) 1) 0.4)
     3 (. (mainFG) 2)
     4 (. (groups.selectionBG) 3)
     5 ""})
  output)

(defn insertMode_a []
  (def output 
    {1 (. (mainFG) 1)
     2 (. (groups.selectionBG) 1)
     3 (. (mainFG) 2)
     4 (. (groups.selectionBG) 2)
     5 "bold"})
  output)

(defn terminalMode_c []
  (def output
    {1 (. (mainFG) 1)
     2 (ucolors.blendColors (. (groups.errorBG) 1) (. (groups.mainBG) 1) 0.8)
     3 (. (mainFG) 2)
     4 (. (groups.errorBG) 2)
     5 ""})
  output)

(defn terminalMode_b []
  (def output
    {1 (. (mainFG) 1)
     2 (ucolors.blendColors (. (groups.selectionBG) 1) (. (groups.shadowBG) 1) 0.4)
     3 (. (mainFG) 2)
     4 (. (groups.selectionBG) 3)
     5 ""})
  output)

(defn terminalMode_a []
  (def output
    {1 (. (mainFG) 1)
     2 (ucolors.blendColors (. (groups.fillBG) 1) (. (groups.mainBG) 1) 0.8)
     3 (. (mainFG) 2)
     4 (. (groups.fillBG) 3)
     5 "bold"})
  output)

(defn inactiveGroup []
  (def output
    {1 (. (groups.mainBG) 1)
     2 (. (colors.init :foreground) 3)
     3 (. (mainFG) 2)
     4 (. (groups.umbraBG) 2)
     5 ""
     })
  output)

(defn warningGroup []
  (def output {1 (. (mainFG) 1)
               2 (. (groups.warningBG) 1)
               3 (. (mainFG) 2)
               4 (. (groups.warningBG) 2)
               5 ""
               })
  output)

(defn errorGroup []
  (def output {1 (. (mainFG) 1)
               2 (. (groups.errorBG) 1)
               3 (. (mainFG) 2)
               4 (. (groups.errorBG) 2)
               5 ""
               })
  output)

(defn modifiedC [mode]
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
