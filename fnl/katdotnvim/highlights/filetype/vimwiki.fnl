(module katdotnvim.highlights.filetype.vimwiki
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

; this handles vimwiki

(defn high-colors [] [{:group :VimwikiMarkers
                       :fg (. (colors.init :background) 5)
                       :bg :SKIP
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg :SKIP}
                      {:group :VimwikiLink
                       :fg (. (groups.infoBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg :SKIP
                       :bold true
                       :underline true
                       :sp (. (groups.infoBG) 1)}
                      {:group :VimwikiList
                       :fg (. (groups.selectionBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :VimwikiCheckBoxDone
                       :fg (. (groups.auxBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.auxBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :VimwikiTag
                       :fg (. (groups.errorBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :VimwikiDelText
                       :fg (. (groups.fillBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.fillBG) 2)
                       :ctermbg :SKIP
                       :strikethrough true}
                      {:group :VimwikiCode
                       :fg (. (groups.meldFG) 1)
                       :bg (. (groups.shadowBG) 1)
                       :ctermfg (. (groups.umbraFG) 2)
                       :ctermbg (. (groups.umbraBG) 2)}
                      {:group :VimwikiHeader1
                       :fg (ucolors.darken (. (colors.init :normalColors) :blue)
                                           0.0)
                       :bg :SKIP
                       :ctermfg 4
                       :ctermbg :SKIP
                       :bold true}
                      {:group :VimwikiHeader2
                       :fg (ucolors.darken (. (colors.init :normalColors) :blue)
                                           0.3)
                       :bg :SKIP
                       :ctermfg 12
                       :ctermbg :SKIP
                       :bold true}
                      {:group :VimwikiHeader3
                       :fg (ucolors.darken (. (colors.init :normalColors)
                                              :orange)
                                           0.0)
                       :bg :SKIP
                       :ctermfg 3
                       :ctermbg :SKIP
                       :bold true}
                      {:group :VimwikiHeader4
                       :fg (ucolors.darken (. (colors.init :normalColors)
                                              :orange)
                                           0.3)
                       :bg :SKIP
                       :ctermfg 11
                       :ctermbg :SKIP
                       :bold true}
                      {:group :VimwikiHeader5
                       :fg (ucolors.darken (. (colors.init :normalColors) :pink)
                                           0.0)
                       :bg :SKIP
                       :ctermfg 5
                       :ctermbg :SKIP
                       :bold true}
                      {:group :VimwikiHeader6
                       :fg (ucolors.darken (. (colors.init :normalColors) :pink)
                                           0.3)
                       :bg :SKIP
                       :ctermfg 13
                       :ctermbg :SKIP
                       :bold true}])

(defn init [] (run.highlight$<-table (high-colors)))
