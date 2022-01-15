(module katdotnvim.highlights.filetype.vimwiki
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main}})

; this handles vimwiki

(defn init []
  (ucolors.highlight :VimwikiMarkers (. (colors.init :background) 5) :SKIP)
  (ucolors.highlight :VimwikiLink (groups.infoBG) :SKIP "underline,bold" (groups.infoBG))
  (ucolors.highlight :VimwikiList (groups.selectionBG) :SKIP :bold)
  (ucolors.highlight :VimwikiCheckBoxDone (groups.auxBG) :SKIP :bold)
  (ucolors.highlight :VimwikiTag (groups.errorBG) :SKIP :Bold)
  (ucolors.highlight :VimwikiDelText (groups.fillBG) :SKIP :strikethrough)
  (ucolors.highlight :VimwikiCode (groups.meldFG) (groups.shadowBG))
  (ucolors.highlight :VimwikiHeader1 (ucolors.darken (. (colors.init :normalColors) :blue) 0.0) :SKIP :bold)
  (ucolors.highlight :VimwikiHeader2 (ucolors.darken (. (colors.init :normalColors) :blue) 0.3) :SKIP :bold)
  (ucolors.highlight :VimwikiHeader3 (ucolors.darken (. (colors.init :normalColors) :orange) 0.0) :SKIP :bold)
  (ucolors.highlight :VimwikiHeader4 (ucolors.darken (. (colors.init :normalColors) :orange) 0.3) :SKIP :bold)
  (ucolors.highlight :VimwikiHeader5 (ucolors.darken (. (colors.init :normalColors) :pink) 0.0) :SKIP :bold)
  (ucolors.highlight :VimwikiHeader6 (ucolors.darken (. (colors.init :normalColors) :pink) 0.3) :SKIP :bold))
