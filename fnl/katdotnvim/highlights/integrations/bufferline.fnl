(module katdotnvim.highlights.integrations.bufferline
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main
                   main katdotnvim.main}})
(defn tabFG []
  (var output "")
  (if (and (= vim.o.background :dark)
           (= main.katContrast :soft))
      (do (set output (ucolors.brighten (groups.mainFG) 0.8)))
      (do (set output (groups.mainFG))))
  output)

(defn init []
  ((. (require :bufferline) :setup)
   {:highlights {:fill {:guifg (groups.fillBG)
                        :guibg (groups.fillBG)}
                 :tab {:guifg (tabFG)
                       :guibg (groups.highlightBG)}
                 :tab_selected {:guifg (tabFG)
                                :guibg (groups.selectionBG)}
                 :tab_close {:guifg (tabFG)
                             :guibg (groups.highlightBG)
                             :gui "bold,italic"}
                 :info {:guifg (tabFG)
                        :guibg (groups.selectionBG)}
                 :buffer_visible {:guifg (tabFG)
                                  :guibg (ucolors.blendColors (groups.selectionBG)
                                                              (groups.mainBG)
                                                              0.8)}
                 :buffer_selected {:guifg (tabFG)
                                   :guibg (groups.selectionBG)
                                   :gui "bold,italic"}
                 :close_button {:guifg (tabFG)
                                :guibg (groups.highlightBG)
                                :gui "bold"}
                 :close_button_visible {:guifg (tabFG)
                                        :guibg (ucolors.blendColors (groups.selectionBG)
                                                                    (groups.mainBG)
                                                                    0.8)
                                        :gui "bold"}
                 :close_button_selected {:guifg (tabFG)
                                         :guibg (groups.selectionBG)
                                         :gui :bold}
                 :modified {:guifg (groups.warningBG)
                            :guibg (groups.highlightBG)}
                 :modified_visible {:guifg (groups.warningBG)
                                    :guibg (ucolors.blendColors (groups.selectionBG)
                                                                (groups.mainBG)
                                                                0.8)}
                 :modified_selected {:guifg (groups.warningBG)
                                     :guibg (groups.selectionBG)}
                 :duplicate_selected {:guifg (tabFG)
                                      :guibg (groups.selectionBG)}
                 :duplicate_visible {:guifg (tabFG)
                                     :guibg (ucolors.blendColors (groups.selectionBG)
                                                                 (groups.mainBG)
                                                                 0.8)}
                 :duplicate {:guifg (tabFG)
                             :guibg (groups.highlightBG)}
                 :separator_selected {:guifg (groups.fillBG)
                                      :guibg (groups.selectionBG)}
                 :separator_visible {:guifg (groups.fillBG)
                                     :guibg (ucolors.blendColors (groups.selectionBG)
                                                                 (groups.mainBG)
                                                                 0.8)}
                 :separator {:guifg (groups.fillBG)
                             :guibg (groups.highlightBG)}
                 :indicator_selected {:guifg (tabFG)
                                      :guibg (groups.selectionBG)}
                 :pick_selected {:guifg (tabFG)
                                 :guibg (groups.selectionBG)}
                 :pick_visible {:guifg (tabFG)
                                :guibg (groups.selectionBG)}
                 :pick {:guifg (tabFG)
                        :guibg (groups.selectionBG)}
                 :background {:guifg (tabFG)
                              :guibg (groups.highlightBG)}}}))
