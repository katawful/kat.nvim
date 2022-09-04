(module katdotnvim.highlights.integrations.bufferline
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main
                   main katdotnvim.main}})

(defn tabFG [] (var output "")
      (if (and (= (. main.background-mut 1) :dark)
               (= (. main.contrast-mut 1) :soft))
          (do
            (set output (ucolors.brighten (. (groups.mainFG) 1) 0.8)))
          (do
            (set output (. (groups.mainFG) 1)))) output)

(defn init []
      ((. (require :bufferline) :setup) {:highlights {:fill {:guifg (. (groups.fillBG)
                                                                       1)
                                                             :guibg (. (groups.fillBG)
                                                                       1)}
                                                      :tab {:guifg (tabFG)
                                                            :guibg (. (groups.highlightBG)
                                                                      1)}
                                                      :tab_selected {:guifg (tabFG)
                                                                     :guibg (. (groups.selectionBG)
                                                                               1)}
                                                      :tab_close {:guifg (tabFG)
                                                                  :guibg (. (groups.highlightBG)
                                                                            1)
                                                                  :gui "bold,italic"}
                                                      :info {:guifg (tabFG)
                                                             :guibg (. (groups.selectionBG)
                                                                       1)}
                                                      :buffer_visible {:guifg (tabFG)
                                                                       :guibg (ucolors.blend (. (groups.selectionBG)
                                                                                                1)
                                                                                             (. (groups.mainBG)
                                                                                                1)
                                                                                             0.8)}
                                                      :buffer_selected {:guifg (tabFG)
                                                                        :guibg (. (groups.selectionBG)
                                                                                  1)
                                                                        :gui "bold,italic"}
                                                      :close_button {:guifg (tabFG)
                                                                     :guibg (. (groups.highlightBG)
                                                                               1)
                                                                     :gui :bold}
                                                      :close_button_visible {:guifg (tabFG)
                                                                             :guibg (ucolors.blend (. (groups.selectionBG)
                                                                                                      1)
                                                                                                   (. (groups.mainBG)
                                                                                                      1)
                                                                                                   0.8)
                                                                             :gui :bold}
                                                      :close_button_selected {:guifg (tabFG)
                                                                              :guibg (. (groups.selectionBG)
                                                                                        1)
                                                                              :gui :bold}
                                                      :modified {:guifg (. (groups.warningBG)
                                                                           1)
                                                                 :guibg (. (groups.highlightBG)
                                                                           1)}
                                                      :modified_visible {:guifg (. (groups.warningBG)
                                                                                   1)
                                                                         :guibg (ucolors.blend (. (groups.selectionBG)
                                                                                                  1)
                                                                                               (. (groups.mainBG)
                                                                                                  1)
                                                                                               0.8)}
                                                      :modified_selected {:guifg (. (groups.warningBG)
                                                                                    1)
                                                                          :guibg (. (groups.selectionBG)
                                                                                    1)}
                                                      :duplicate_selected {:guifg (tabFG)
                                                                           :guibg (. (groups.selectionBG)
                                                                                     1)}
                                                      :duplicate_visible {:guifg (tabFG)
                                                                          :guibg (ucolors.blend (. (groups.selectionBG)
                                                                                                   1)
                                                                                                (. (groups.mainBG)
                                                                                                   1)
                                                                                                0.8)}
                                                      :duplicate {:guifg (tabFG)
                                                                  :guibg (. (groups.highlightBG)
                                                                            1)}
                                                      :separator_selected {:guifg (. (groups.fillBG)
                                                                                     1)
                                                                           :guibg (. (groups.selectionBG)
                                                                                     1)}
                                                      :separator_visible {:guifg (. (groups.fillBG)
                                                                                    1)
                                                                          :guibg (ucolors.blend (. (groups.selectionBG)
                                                                                                   1)
                                                                                                (. (groups.mainBG)
                                                                                                   1)
                                                                                                0.8)}
                                                      :separator {:guifg (. (groups.fillBG)
                                                                            1)
                                                                  :guibg (. (groups.highlightBG)
                                                                            1)}
                                                      :indicator_selected {:guifg (tabFG)
                                                                           :guibg (. (groups.selectionBG)
                                                                                     1)}
                                                      :pick_selected {:guifg (tabFG)
                                                                      :guibg (. (groups.selectionBG)
                                                                                1)}
                                                      :pick_visible {:guifg (tabFG)
                                                                     :guibg (. (groups.selectionBG)
                                                                               1)}
                                                      :pick {:guifg (tabFG)
                                                             :guibg (. (groups.selectionBG)
                                                                       1)}
                                                      :background {:guifg (tabFG)
                                                                   :guibg (. (groups.highlightBG)
                                                                             1)}}}))
