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
                 (.. "'" colors.kat.bg.base.color "'")
                 (.. "'" colors.kat.fg.base.color "'")))
      (local black
             (if (= (. main.background-mut 1) :light)
                 (.. "'" colors.kat.fg.base.color "'")
                 (.. "'" colors.kat.bg.base.color "'")))
      (local cyan
             (.. "'" (ucolors.brighten colors.kat.blue.base.color 0.3) "'"))
      (let [char "'"
            output
            {"colors:"
             {" primary:"
              {"  background:" (.. char colors.kat.bg.base.color char)
               "  foreground:" (.. char colors.kat.fg.auto.color char)
               "  dim_foreground:" (.. char colors.kat.fg.umbra.color char)
               "  bright_foreground:" (.. char colors.kat.fg.meld.color char)
               "  dim_background:" (.. char colors.kat.bg.umbra.color char)
               "  bright_background:" (.. char colors.kat.bg.meld.color char)}
              " cursor:" {"  text:" (.. char colors.kat.bg.base.color char)
                          "  cursor:" (.. char colors.kat.fg.auto.color char)}
              " search:" {"  matches:" {"   foreground:" (.. char colors.kat.bg.base.color char)
                                        "   background:" (.. char (ucolors.blend colors.kat.orange.base.color
                                                                              colors.kat.bg.base.color 0.7) char)}
                          "  focused_match:" {"   foreground:" (.. char colors.kat.bg.base.color char)
                                              "   background:" (.. char colors.kat.orange.base.color char)}}
              " hints:" {"  start:" {"   foreground:" (.. char colors.kat.fg.auto.color char)
                                     "   background:" (.. char (ucolors.blend colors.kat.bg.meld.color
                                                                           colors.kat.green.auto.color 0.2) char)}
                         "  end:" {"   foreground:" (.. char colors.kat.fg.auto.color char)
                                   "   background:" (.. char colors.kat.green.auto.color char)}}
              " line_indicator:" {"   foreground:" :None
                                  "   background:" :None}
              " footer_bar:" {"   foreground:" (.. char colors.kat.fg.auto.color char)
                              "   background:" (.. char colors.kat.pink.base.color char)}
              " normal:" {"  black:" black
                          "  red:" (.. char colors.kat.red.base.color char)
                          "  blue:" (.. char colors.kat.blue.base.color char)
                          "  green:" (.. char colors.kat.green.base.color char)
                          "  yellow:" (.. char colors.kat.orange.base.color char)
                          "  cyan:" (.. char colors.kat.purple.base.color char)
                          "  magenta:" (.. char colors.kat.pink.base.color char)
                          "  white:" white}
              " bright:" (if (= (. main.background-mut 1) :light)
                             (do
                               {"  black:" (.. char colors.kat.fg.umbra.color char)
                                "  red:" (.. char
                                             (ucolors.darken colors.kat.red.base.color 0.2)
                                             char)
                                "  green:" (.. char
                                               (ucolors.darken colors.kat.green.base.color 0.2)
                                               char)
                                "  yellow:" (.. char
                                                (ucolors.darken colors.kat.orange.base.color 0.2)
                                                char)
                                "  blue:" (.. char
                                              (ucolors.darken colors.kat.blue.base.color 0.2)
                                              char)
                                "  magenta:" (.. char
                                                 (ucolors.darken colors.kat.pink.base.color 0.2)
                                                 char)
                                "  cyan:" (.. char
                                              (ucolors.darken colors.kat.purple.base.color 0.2)
                                              char)
                                "  white:" (.. char colors.kat.bg.umbra.color char)})
                             (do
                               {"  black:" (.. char colors.kat.bg.umbra.color char)
                                "  red:" (.. char
                                             (ucolors.brighten colors.kat.red.base.color 0.2)
                                             char)
                                "  green:" (.. char
                                               (ucolors.brighten colors.kat.green.base.color 0.2)
                                               char)
                                "  yellow:" (.. char
                                                (ucolors.brighten colors.kat.orange.base.color 0.2)
                                                char)
                                "  blue:" (.. char
                                              (ucolors.brighten colors.kat.blue.base.color 0.2)
                                              char)
                                "  magenta:" (.. char
                                                 (ucolors.brighten colors.kat.pink.base.color 0.2)
                                                 char)
                                "  cyan:" (.. char
                                              (ucolors.brighten colors.kat.purple.base.color 0.2)
                                              char)
                                "  white:" (.. char colors.kat.fg.umbra.color char)}))
              " dim:" (if (= (. main.background-mut 1) :dark)
                          (do
                            {"  black:" (.. char colors.kat.fg.meld.color char)
                             "  red:" (.. char
                                          (ucolors.darken colors.kat.red.base.color 0.2)
                                          char)
                             "  green:" (.. char
                                            (ucolors.darken colors.kat.green.base.color 0.2)
                                            char)
                             "  yellow:" (.. char
                                             (ucolors.darken colors.kat.orange.base.color 0.2)
                                             char)
                             "  blue:" (.. char
                                           (ucolors.darken colors.kat.blue.base.color 0.2)
                                           char)
                             "  magenta:" (.. char
                                              (ucolors.darken colors.kat.pink.base.color 0.2)
                                              char)
                             "  cyan:" (.. char
                                           (ucolors.darken colors.kat.purple.base.color 0.2)
                                           char)
                             "  white:" (.. char colors.kat.bg.meld.color char)})
                          (do
                            {"  black:" (.. char colors.kat.bg.meld.color char)
                             "  red:" (.. char
                                          (ucolors.brighten colors.kat.red.base.color 0.2)
                                          char)
                             "  green:" (.. char
                                            (ucolors.brighten colors.kat.green.base.color 0.2)
                                            char)
                             "  yellow:" (.. char
                                             (ucolors.brighten colors.kat.orange.base.color 0.2)
                                             char)
                             "  blue:" (.. char
                                           (ucolors.brighten colors.kat.blue.base.color 0.2)
                                           char)
                             "  magenta:" (.. char
                                              (ucolors.brighten colors.kat.pink.base.color 0.2)
                                              char)
                             "  cyan:" (.. char
                                           (ucolors.brighten colors.kat.purple.base.color 0.2)
                                           char)
                             "  white:" (.. char (.. char colors.kat.fg.meld.color char))}))
              " selection:" {"  text:" :CellBackground
                             "  background:" (.. char colors.kat.blue.base.color char)}}
             "bell:" {" color:" (.. char colors.kat.blue.base.color char)}}]
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
