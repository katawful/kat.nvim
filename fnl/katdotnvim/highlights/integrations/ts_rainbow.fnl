(module katdotnvim.highlights.integrations.ts_rainbow
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

;;; This file handles ts-rainbow colors

(defn high-colors [] [{:group :rainbowcol1
                       :fg (ucolors.blend (. (colors.init :normalColors) :red)
                                          colors.kat.fg.meld.color 0.8)
                       :bg :SKIP
                       :ctermfg 1
                       :ctermbg :SKIP}
                      {:group :rainbowcol2
                       :fg (ucolors.blend (. (colors.init :normalColors) :pink)
                                          colors.kat.fg.meld.color 0.8)
                       :bg :SKIP
                       :ctermfg 2
                       :ctermbg :SKIP}
                      {:group :rainbowcol3
                       :fg (ucolors.blend (. (colors.init :normalColors)
                                             :purple)
                                          colors.kat.fg.meld.color 0.8)
                       :bg :SKIP
                       :ctermfg 3
                       :ctermbg :SKIP}
                      {:group :rainbowcol4
                       :fg (ucolors.blend (. (colors.init :normalColors) :blue)
                                          colors.kat.fg.meld.color 0.8)
                       :bg :SKIP
                       :ctermfg 4
                       :ctermbg :SKIP}
                      {:group :rainbowcol5
                       :fg (ucolors.blend (. (colors.init :normalColors) :green)
                                          colors.kat.fg.meld.color 0.8)
                       :bg :SKIP
                       :ctermfg 5
                       :ctermbg :SKIP}
                      {:group :rainbowcol6
                       :fg (ucolors.blend (. (colors.init :normalColors)
                                             :orange)
                                          colors.kat.fg.meld.color 0.8)
                       :bg :SKIP
                       :ctermfg 6
                       :ctermbg :SKIP}
                      {:group :rainbowcol7
                       :fg (ucolors.blend (. (colors.init :background) 6)
                                          colors.kat.fg.meld.color 0.8)
                       :bg :SKIP
                       :ctermfg 7
                       :ctermbg :SKIP}])

(defn init [] (run.highlight$<-table (high-colors)))
