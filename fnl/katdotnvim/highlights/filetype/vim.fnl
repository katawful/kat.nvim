(module katdotnvim.highlights.filetype.vim
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main
                   }})

; this handles the vim filetype

(defn init []
  (ucolors.highlight :vimCommentTitle (groups.shadowBG) (groups.shadowFG) "bold,italic")
  (ucolors.highlight :vimBracket (ucolors.blendColors (. (colors.init :normalColors) :pink) (groups.mainFG) 0.7) :SKIP)
  (ucolors.highlight :vimMapModKey (ucolors.blendColors (. (colors.init :normalColors) :pink) (groups.mainFG) 0.8) :SKIP)
  (ucolors.highlight :vimFuncSID (groups.umbraFG) :SKIP)
  (ucolors.highlight :vimSetSep (groups.umbraFG) :SKIP)
  (ucolors.highlight :vimSep (groups.umbraFG) :SKIP)
  (ucolors.highlight :vimContinue (groups.umbraFG) :SKIP)
  )
