(module katdotnvim.utils.export.alacritty
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   groups katdotnvim.highlights.main
                   main katdotnvim.main
                   export katdotnvim.utils.export.init}})

;;; Exports 16 colors for alacritty terminal

(def- loop vim.loop)

(def comment-type "#")

;; FN -- generates a table of colors for kitty colors
;; $output -- table of colors where the key is the string for the alacritty group

;; fnlfmt: skip
(defn gen-colors [] "Exports a nested table of strings for alacritty"
      (local white
             (if (= (. main.background-mut 1) :light)
                 (.. "'" (. (colors.background) 1) "'")
                 (.. "'" (. (colors.foreground) 1) "'")))
      (local black
             (if (= (. main.background-mut 1) :light)
                 (.. "'" (. (colors.foreground) 1) "'")
                 (.. "'" (. (colors.background) 1) "'")))
      (local cyan
             (.. "'" (ucolors.brighten (. (groups.selectionBG) 1) 0.3) "'"))
      (let [char "'"
            output
            {"colors:"
             {" primary:"
              {"  background:" (.. char (. (groups.mainBG) 1) char)
               "  foreground:" (.. char (. (groups.mainFG) 1) char)
               "  dim_foreground:" (.. char (. (groups.umbraFG) 1) char)
               "  bright_foreground:" (.. char (. (groups.meldFG) 1) char)
               "  dim_background:" (.. char (. (groups.umbraBG) 1) char)
               "  bright_background:" (.. char (. (groups.meldBG) 1) char)}
              " cursor:" {"  text:" (.. char (. (groups.mainBG) 1) char)
                          "  cursor:" (.. char (. (groups.mainFG) 1) char)}
              " search:" {"  matches:" {"   foreground:" (.. char (. (groups.infoFG) 1) char)
                                        "   background:" (.. char (ucolors.blend (. (groups.infoBG) 1)
                                                                              (. (groups.mainBG 1) 1) 0.7) char)}
                          "  focused_match:" {"   foreground:" (.. char (. (groups.infoFG) 1) char)
                                              "   background:" (.. char (. (groups.infoBG) 1) char)}}
              " hints:" {"  start:" {"   foreground:" (.. char (. (groups.mainFG) 1) char)
                                     "   background:" (.. char (ucolors.blend (. (groups.meldBG) 1)
                                                                           (. (groups.auxBG) 1) 0.2) char)}
                         "  end:" {"   foreground:" (.. char (. (groups.mainFG) 1) char)
                                   "   background:" (.. char (. (groups.auxBG) 1) char)}}
              " line_indicator:" {"   foreground:" :None
                                  "   background:" :None}
              " footer_bar:" {"   foreground:" (.. char (. (groups.fillFG) 1) char)
                              "   background:" (.. char (. (groups.fillBG) 1) char)}
              " normal:" {"  black:" black
                          "  red:" (.. char (. (colors.normal-colors) :red) char)
                          "  blue:" (.. char (. (colors.normal-colors) :blue) char)
                          "  green:" (.. char (. (colors.normal-colors) :green) char)
                          "  yellow:" (.. char (. (colors.normal-colors) :orange) char)
                          "  cyan:" (.. char (. (colors.normal-colors) :purple) char)
                          "  magenta:" (.. char (. (colors.normal-colors) :pink) char)
                          "  white:" white}
              " bright:" (if (= (. main.background-mut 1) :light)
                             (do
                               {"  black:" (.. char (. (groups.umbraFG) 1) char)
                                "  red:" (.. char
                                             (ucolors.darken (. (colors.normal-colors) :red) 0.2)
                                             char)
                                "  green:" (.. char
                                               (ucolors.darken (. (colors.normal-colors) :green) 0.2)
                                               char)
                                "  yellow:" (.. char
                                                (ucolors.darken (. (colors.normal-colors) :orange) 0.2)
                                                char)
                                "  blue:" (.. char
                                              (ucolors.darken (. (colors.normal-colors) :blue) 0.2)
                                              char)
                                "  magenta:" (.. char
                                                 (ucolors.darken (. (colors.normal-colors) :pink) 0.2)
                                                 char)
                                "  cyan:" (.. char
                                              (ucolors.darken (. (colors.normal-colors) :purple) 0.2)
                                              char)
                                "  white:" (.. char (. (groups.umbraBG) 1) char)})
                             (do
                               {"  black:" (.. char (. (groups.umbraBG) 1) char)
                                "  red:" (.. char
                                             (ucolors.brighten (. (colors.normal-colors) :red) 0.2)
                                             char)
                                "  green:" (.. char
                                               (ucolors.brighten (. (colors.normal-colors) :green) 0.2)
                                               char)
                                "  yellow:" (.. char
                                                (ucolors.brighten (. (colors.normal-colors) :orange) 0.2)
                                                char)
                                "  blue:" (.. char
                                              (ucolors.brighten (. (colors.normal-colors) :blue) 0.2)
                                              char)
                                "  magenta:" (.. char
                                                 (ucolors.brighten (. (colors.normal-colors) :pink) 0.2)
                                                 char)
                                "  cyan:" (.. char
                                              (ucolors.brighten (. (colors.normal-colors) :purple) 0.2)
                                              char)
                                "  white:" (.. char (. (groups.umbraFG) 1) char)}))
              " dim:" (if (= (. main.background-mut 1) :dark)
                          (do
                            {"  black:" (.. char (. (groups.meldFG) 1) char)
                             "  red:" (.. char
                                          (ucolors.darken (. (colors.normal-colors) :red) 0.2)
                                          char)
                             "  green:" (.. char
                                            (ucolors.darken (. (colors.normal-colors) :green) 0.2)
                                            char)
                             "  yellow:" (.. char
                                             (ucolors.darken (. (colors.normal-colors) :orange) 0.2)
                                             char)
                             "  blue:" (.. char
                                           (ucolors.darken (. (colors.normal-colors) :blue) 0.2)
                                           char)
                             "  magenta:" (.. char
                                              (ucolors.darken (. (colors.normal-colors) :pink) 0.2)
                                              char)
                             "  cyan:" (.. char
                                           (ucolors.darken (. (colors.normal-colors) :purple) 0.2)
                                           char)
                             "  white:" (.. char (. (groups.meldBG) 1) char)})
                          (do
                            {"  black:" (.. char (. (groups.meldBG) 1) char)
                             "  red:" (.. char
                                          (ucolors.brighten (. (colors.normal-colors) :red) 0.2)
                                          char)
                             "  green:" (.. char
                                            (ucolors.brighten (. (colors.normal-colors) :green) 0.2)
                                            char)
                             "  yellow:" (.. char
                                             (ucolors.brighten (. (colors.normal-colors) :orange) 0.2)
                                             char)
                             "  blue:" (.. char
                                           (ucolors.brighten (. (colors.normal-colors) :blue) 0.2)
                                           char)
                             "  magenta:" (.. char
                                              (ucolors.brighten (. (colors.normal-colors) :pink) 0.2)
                                              char)
                             "  cyan:" (.. char
                                           (ucolors.brighten (. (colors.normal-colors) :purple) 0.2)
                                           char)
                             "  white:" (.. char (.. char (. (groups.meldFG) 1) char))}))
              " selection:" {"  text:" :CellBackground
                             "  background:" (.. char (. (groups.selectionBG) 1) char)}}
             "bell:" {" color:" (.. char (. (groups.selectionBG) 1) char)}}]
        output))

;; FN -- output alacritty string to a file at the current working directory
(defn output! [] (let [file-name (string.format "alacritty-%s-%s.yml"
                                                (tostring (. main.colors-name-mut
                                                             1))
                                                (tostring (. main.background-mut
                                                             1)))
                       fd (assert (loop.fs_open file-name :w 0))]
                   (assert (loop.fs_chmod file-name 420))
                   (assert (loop.fs_write fd
                                          (export.table->one-line-color (gen-colors)
                                                                        alacritty)
                                          0))
                   (export.notify$ :alacritty)
                   (assert (loop.fs_close fd))))
