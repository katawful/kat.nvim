(module katdotnvim.utils.export.konsole
        {autoload {hsl externals.hsluv
                   ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   groups katdotnvim.highlights.main
                   main katdotnvim.main
                   export katdotnvim.utils.export.init
                   errors katdotnvim.utils.errors
                   a aniseed.core}})

;;; This module exports the 16 colors for konsole

;; requirements
(def- loop vim.loop)

;; FN -- generates a table of colors for konsole
;; $output -- a table of colors where the key is the string for the konsole group
(defn gen-colors [] "Export a table of strings for konsole"
      (let [output {"[Background]" (.. :Color=
                                       (export.hex->rgb-string (. (groups.mainBG)
                                                                  1)))
                    "[BackgroundFaint]" (.. :Color=
                                            (export.hex->rgb-string (. (groups.meldBG)
                                                                       1)))
                    "[BackgroundIntense]" (.. :Color=
                                              (export.hex->rgb-string (. (groups.umbraBG)
                                                                         1)))
                    "[Foreground]" (.. :Color=
                                       (export.hex->rgb-string (. (groups.mainFG)
                                                                  1)))
                    "[ForegroundFaint]" (.. :Color=
                                            (export.hex->rgb-string (. (groups.meldFG)
                                                                       1)))
                    "[ForegroundIntense]" (.. :Color=
                                              (export.hex->rgb-string (. (groups.umbraFG)
                                                                         1)))
                    "[Color0]" (.. :Color=
                                   (export.hex->rgb-string (. (colors.background)
                                                              1)))
                    "[Color1]" (.. :Color=
                                   (export.hex->rgb-string (. (colors.normal-colors)
                                                              :red)))
                    "[Color2]" (.. :Color=
                                   (export.hex->rgb-string (. (colors.normal-colors)
                                                              :green)))
                    "[Color3]" (.. :Color=
                                   (export.hex->rgb-string (. (colors.normal-colors)
                                                              :orange)))
                    "[Color4]" (.. :Color=
                                   (export.hex->rgb-string (. (colors.normal-colors)
                                                              :blue)))
                    "[Color5]" (.. :Color=
                                   (export.hex->rgb-string (. (colors.normal-colors)
                                                              :pink)))
                    "[Color6]" (.. :Color=
                                   (export.hex->rgb-string (. (colors.normal-colors)
                                                              :purple)))
                    "[Color7]" (.. :Color=
                                   (export.hex->rgb-string (. (groups.mainFG) 1)))
                    "[Color8]" (.. :Color=
                                   (export.hex->rgb-string (. (colors.background)
                                                              2)))
                    "[Color15]" (.. :Color=
                                    (export.hex->rgb-string (. (colors.foreground)
                                                               2)))
                    "[General]" (string.format "Blur=false
ColorRandomization=false
Description=%s
Opacity=1
Wallpaper="
                                               (.. (tostring vim.g.colors_name)
                                                   "-"
                                                   (tostring vim.o.background)))}]
        (if (= vim.o.background :light)
            (do
              (tset output "[Color0Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.background)
                                                                   1)
                                                                0.2))))
              (tset output "[Color1Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :red)
                                                                  0.2))))
              (tset output "[Color2Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :green)
                                                                  0.2))))
              (tset output "[Color3Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :orange)
                                                                  0.2))))
              (tset output "[Color4Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :blue)
                                                                  0.2))))
              (tset output "[Color5Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :pink)
                                                                  0.2))))
              (tset output "[Color6Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :purple)
                                                                  0.2))))
              (tset output "[Color7Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.foreground)
                                                                     1)
                                                                  0.2))))
              (tset output "[Color8Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.background)
                                                                   2)
                                                                0.2))))
              (tset output "[Color9Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :red)
                                                                  0.2))))
              (tset output "[Color10Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :green)
                                                                  0.2))))
              (tset output "[Color11Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :orange)
                                                                  0.2))))
              (tset output "[Color12Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :blue)
                                                                  0.2))))
              (tset output "[Color13Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :pink)
                                                                  0.2))))
              (tset output "[Color14Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :purple)
                                                                  0.2))))
              (tset output "[Color15Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.foreground)
                                                                     2)
                                                                  0.2))))
              (tset output "[Color0Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.background)
                                                                     1)
                                                                  0.2))))
              (tset output "[Color1Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :red)
                                                                0.2))))
              (tset output "[Color2Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :green)
                                                                0.2))))
              (tset output "[Color3Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :orange)
                                                                0.2))))
              (tset output "[Color4Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :blue)
                                                                0.2))))
              (tset output "[Color5Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :pink)
                                                                0.2))))
              (tset output "[Color6Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :purple)
                                                                0.2))))
              (tset output "[Color7Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.foreground)
                                                                   1)
                                                                0.2))))
              (tset output "[Color8Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.background)
                                                                     2)
                                                                  0.2))))
              (tset output "[Color9Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :red)
                                                                0.2))))
              (tset output "[Color10Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :green)
                                                                0.2))))
              (tset output "[Color11Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :orange)
                                                                0.2))))
              (tset output "[Color12Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :blue)
                                                                0.2))))
              (tset output "[Color13Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :pink)
                                                                0.2))))
              (tset output "[Color14Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :purple)
                                                                0.2))))
              (tset output "[Color15Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.foreground)
                                                                   2)
                                                                0.2))))
              (tset output "[Color9]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :red)
                                                                0.2))))
              (tset output "[Color10]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :green)
                                                                0.2))))
              (tset output "[Color11]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :orange)
                                                                0.2))))
              (tset output "[Color12]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :blue)
                                                                0.2))))
              (tset output "[Color13]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :pink)
                                                                0.2))))
              (tset output "[Color14]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :purple)
                                                                0.2)))))
            (do
              (tset output "[Color0Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.background)
                                                                     1)
                                                                  0.2))))
              (tset output "[Color1Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :red)
                                                                0.2))))
              (tset output "[Color2Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :green)
                                                                0.2))))
              (tset output "[Color3Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :orange)
                                                                0.2))))
              (tset output "[Color4Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :blue)
                                                                0.2))))
              (tset output "[Color5Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :pink)
                                                                0.2))))
              (tset output "[Color6Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :purple)
                                                                0.2))))
              (tset output "[Color7Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.foreground)
                                                                   1)
                                                                0.2))))
              (tset output "[Color8Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.background)
                                                                     2)
                                                                  0.2))))
              (tset output "[Color9Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :red)
                                                                0.2))))
              (tset output "[Color10Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :green)
                                                                0.2))))
              (tset output "[Color11Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :orange)
                                                                0.2))))
              (tset output "[Color12Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :blue)
                                                                0.2))))
              (tset output "[Color13Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :pink)
                                                                0.2))))
              (tset output "[Color14Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.normal-colors)
                                                                   :purple)
                                                                0.2))))
              (tset output "[Color15Faint]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.foreground)
                                                                   2)
                                                                0.2))))
              (tset output "[Color0Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.background)
                                                                   1)
                                                                0.2))))
              (tset output "[Color1Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :red)
                                                                  0.2))))
              (tset output "[Color2Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :green)
                                                                  0.2))))
              (tset output "[Color3Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :orange)
                                                                  0.2))))
              (tset output "[Color4Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :blue)
                                                                  0.2))))
              (tset output "[Color5Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :pink)
                                                                  0.2))))
              (tset output "[Color6Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :purple)
                                                                  0.2))))
              (tset output "[Color7Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.foreground)
                                                                     1)
                                                                  0.2))))
              (tset output "[Color8Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.darken (. (colors.background)
                                                                   2)
                                                                0.2))))
              (tset output "[Color9Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :red)
                                                                  0.2))))
              (tset output "[Color10Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :green)
                                                                  0.2))))
              (tset output "[Color11Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :orange)
                                                                  0.2))))
              (tset output "[Color12Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :blue)
                                                                  0.2))))
              (tset output "[Color13Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :pink)
                                                                  0.2))))
              (tset output "[Color14Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :purple)
                                                                  0.2))))
              (tset output "[Color15Intense]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.foreground)
                                                                     2)
                                                                  0.2))))
              (tset output "[Color9]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :red)
                                                                  0.2))))
              (tset output "[Color10]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :green)
                                                                  0.2))))
              (tset output "[Color11]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :orange)
                                                                  0.2))))
              (tset output "[Color12]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :blue)
                                                                  0.2))))
              (tset output "[Color13]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :pink)
                                                                  0.2))))
              (tset output "[Color14]"
                    (.. :Color=
                        (export.hex->rgb-string (ucolors.brighten (. (colors.normal-colors)
                                                                     :purple)
                                                                  0.2))))))
        output))

;; FN -- output konsole string to a file at the current working directory
(defn output! [] (let [file-name (string.format "konsole-%s-%s.colorscheme"
                                                (tostring vim.g.colors_name)
                                                (tostring vim.o.background))
                       fd (assert (loop.fs_open file-name :w 0))]
                   (assert (loop.fs_chmod file-name 420))
                   (assert (loop.fs_write fd
                                          (export.string->two-line-color* (gen-colors)
                                                                          :konsole)
                                          0))
                   (export.notify$ :konsole)
                   (assert (loop.fs_close fd))))
