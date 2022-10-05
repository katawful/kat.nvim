(module katdotnvim.highlights.terminal
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.highlight.utils
                   main katdotnvim.main}
         require-macros [katcros-fnl.macros.nvim.api.options.macros]})

; this affects the terminal

(defn init []
      (set-vars g
                {:terminal_color_0 colors.kat.bg.base.color
                 :terminal_color_1 colors.kat.red.base.color
                 :terminal_color_2 colors.kat.green.base.color
                 :terminal_color_3 colors.kat.orange.base.color
                 :terminal_color_4 colors.kat.blue.base.color
                 :terminal_color_5 colors.kat.pink.base.color
                 :terminal_color_6 colors.kat.purple.base.color
                 :terminal_color_7 colors.kat.fg.base.color
                 :terminal_color_8 colors.kat.bg.umbra.color
                 :terminal_color_15 colors.kat.fg.umbra.color})
      (if (= (. main.background-mut 1) :light)
          (set-vars g
                    {:terminal_color_9 (ucolors.darken (. (colors.init :normalColors)
                                                          :red)
                                                       0.2)
                     :terminal_color_10 (ucolors.darken (. (colors.init :normalColors)
                                                           :green)
                                                        0.2)
                     :terminal_color_11 (ucolors.darken (. (colors.init :normalColors)
                                                           :orange)
                                                        0.2)
                     :terminal_color_12 (ucolors.darken (. (colors.init :normalColors)
                                                           :blue)
                                                        0.2)
                     :terminal_color_13 (ucolors.darken (. (colors.init :normalColors)
                                                           :pink)
                                                        0.2)
                     :terminal_color_14 (ucolors.darken (. (colors.init :normalColors)
                                                           :purple)
                                                        0.2)})
          (set-vars g
                    {:terminal_color_9 (ucolors.brighten (. (colors.init :normalColors)
                                                            :red)
                                                         0.2)
                     :terminal_color_10 (ucolors.brighten (. (colors.init :normalColors)
                                                             :green)
                                                          0.2)
                     :terminal_color_11 (ucolors.brighten (. (colors.init :normalColors)
                                                             :orange)
                                                          0.2)
                     :terminal_color_12 (ucolors.brighten (. (colors.init :normalColors)
                                                             :blue)
                                                          0.2)
                     :terminal_color_13 (ucolors.brighten (. (colors.init :normalColors)
                                                             :pink)
                                                          0.2)
                     :terminal_color_14 (ucolors.brighten (. (colors.init :normalColors)
                                                             :purple)
                                                          0.2)})))
