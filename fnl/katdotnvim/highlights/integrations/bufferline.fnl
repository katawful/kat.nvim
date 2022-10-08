(module katdotnvim.highlights.integrations.bufferline
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color}})

(defn init []
      ((. (require :bufferline) :setup) {:highlights {:fill {:guifg colors.kat.pink.base.color
                                                             :guibg colors.kat.pink.base.color}
                                                      :tab {:guifg colors.kat.fg.auto.color
                                                            :guibg colors.kat.purple.base.color}
                                                      :tab_selected {:guifg colors.kat.fg.auto.color
                                                                     :guibg colors.kat.blue.base.color}
                                                      :tab_close {:guifg colors.kat.fg.auto.color
                                                                  :guibg colors.kat.purple.base.color
                                                                  :gui "bold,italic"}
                                                      :info {:guifg colors.kat.fg.auto.color
                                                             :guibg colors.kat.blue.base.color}
                                                      :buffer_visible {:guifg colors.kat.fg.auto.color
                                                                       :guibg colors.kat.blue.match_bg.color}
                                                      :buffer_selected {:guifg colors.kat.fg.auto.color
                                                                        :guibg colors.kat.blue.base.color
                                                                        :gui "bold,italic"}
                                                      :close_button {:guifg colors.kat.fg.auto.color
                                                                     :guibg colors.kat.purple.base.color
                                                                     :gui :bold}
                                                      :close_button_visible {:guifg colors.kat.fg.auto.color
                                                                             :guibg colors.kat.blue.match_bg.color
                                                                             :gui :bold}
                                                      :close_button_selected {:guifg colors.kat.fg.auto.color
                                                                              :guibg colors.kat.blue.base.color
                                                                              :gui :bold}
                                                      :modified {:guifg colors.kat.red.match_bg.color
                                                                 :guibg colors.kat.purple.base.color}
                                                      :modified_visible {:guifg colors.kat.red.match_bg.color
                                                                         :guibg colors.kat.blue.match_bg.color}
                                                      :modified_selected {:guifg colors.kat.red.match_bg.color
                                                                          :guibg colors.kat.blue.base.color}
                                                      :duplicate_selected {:guifg colors.kat.fg.auto.color
                                                                           :guibg colors.kat.blue.base.color}
                                                      :duplicate_visible {:guifg colors.kat.fg.auto.color
                                                                          :guibg colors.kat.blue.match_bg.color}
                                                      :duplicate {:guifg colors.kat.fg.auto.color
                                                                  :guibg colors.kat.purple.base.color}
                                                      :separator_selected {:guifg colors.kat.pink.base.color
                                                                           :guibg colors.kat.blue.base.color}
                                                      :separator_visible {:guifg colors.kat.pink.base.color
                                                                          :guibg colors.kat.blue.match_bg.color}
                                                      :separator {:guifg colors.kat.pink.base.color
                                                                  :guibg colors.kat.purple.base.color}
                                                      :indicator_selected {:guifg colors.kat.fg.auto.color
                                                                           :guibg colors.kat.blue.base.color}
                                                      :pick_selected {:guifg colors.kat.fg.auto.color
                                                                      :guibg colors.kat.blue.base.color}
                                                      :pick_visible {:guifg colors.kat.fg.auto.color
                                                                     :guibg colors.kat.blue.base.color}
                                                      :pick {:guifg colors.kat.fg.auto.color
                                                             :guibg colors.kat.blue.base.color}
                                                      :background {:guifg colors.kat.fg.auto.color
                                                                   :guibg colors.kat.purple.base.color}}}))
