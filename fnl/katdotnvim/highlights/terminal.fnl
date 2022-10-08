(module katdotnvim.highlights.terminal
        {require {color-table katdotnvim.color
                  ucolors katdotnvim.utils.highlight.utils
                  main katdotnvim.main}
         require-macros [katcros-fnl.macros.nvim.api.options.macros]})

; this affects the terminal

(defn init []
      (set-vars g
                {:terminal_color_0 color-table.kat.bg.base.color
                 :terminal_color_1 color-table.kat.red.base.color
                 :terminal_color_2 color-table.kat.green.base.color
                 :terminal_color_3 color-table.kat.orange.base.color
                 :terminal_color_4 color-table.kat.blue.base.color
                 :terminal_color_5 color-table.kat.pink.base.color
                 :terminal_color_6 color-table.kat.purple.base.color
                 :terminal_color_7 color-table.kat.fg.base.color
                 :terminal_color_8 color-table.kat.bg.umbra.color
                 :terminal_color_15 color-table.kat.fg.umbra.color})
      (if (= (. main.background-mut 1) :light)
          (set-vars g
                    {:terminal_color_9 (ucolors.darken color-table.kat.red.base.color
                                                       0.2)
                     :terminal_color_10 (ucolors.darken color-table.kat.green.base.color
                                                        0.2)
                     :terminal_color_11 (ucolors.darken color-table.kat.orange.base.color
                                                        0.2)
                     :terminal_color_12 (ucolors.darken color-table.kat.blue.base.color
                                                        0.2)
                     :terminal_color_13 (ucolors.darken color-table.kat.pink.base.color
                                                        0.2)
                     :terminal_color_14 (ucolors.darken color-table.kat.purple.base.color
                                                        0.2)})
          (set-vars g
                    {:terminal_color_9 (ucolors.brighten color-table.kat.red.base.color
                                                         0.2)
                     :terminal_color_10 (ucolors.brighten color-table.kat.green.base.color
                                                          0.2)
                     :terminal_color_11 (ucolors.brighten color-table.kat.orange.base.color
                                                          0.2)
                     :terminal_color_12 (ucolors.brighten color-table.kat.blue.base.color
                                                          0.2)
                     :terminal_color_13 (ucolors.brighten color-table.kat.pink.base.color
                                                          0.2)
                     :terminal_color_14 (ucolors.brighten color-table.kat.purple.base.color
                                                          0.2)})))
