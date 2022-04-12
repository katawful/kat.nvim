(module katdotnvim.highlights.filetype.vim
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main}})

; this handles the vim filetype

(defn init []
  (ucolors.highlight :vimCommentTitle
                     (. (groups.shadowBG) 1)
                     (. (groups.shadowFG) 1)
                     (. (groups.umbraBG) 2)
                     (. (groups.umbraFG) 2)
                     "bold,italic")
  (ucolors.highlight :vimBracket
                     (ucolors.blend (. (colors.init :normalColors) :pink) (. (groups.mainFG) 1) 0.7)
                     :SKIP
                     (. (groups.fillBG) 2)
                     :SKIP)
                     
  (ucolors.highlight :vimMapModKey
                     (ucolors.blend (. (colors.init :normalColors) :pink) (. (groups.mainFG) 1) 0.8)
                     :SKIP
                     (. (groups.fillBG) 2)
                     :SKIP)
                     
  (ucolors.highlight :vimFuncSID
                     (. (groups.umbraFG) 1)
                     :SKIP
                     (. (groups.umbraFG) 2)
                     :SKIP)
                     
  (ucolors.highlight :vimSetSep
                     (. (groups.umbraFG) 1)
                     :SKIP
                     (. (groups.umbraFG) 2)
                     :SKIP)
                     
  (ucolors.highlight :vimSep
                     (. (groups.umbraFG) 1)
                     :SKIP
                     (. (groups.umbraFG) 2)
                     :SKIP)
                     
  (ucolors.highlight :vimContinue
                     (. (groups.umbraFG) 1)
                     :SKIP
                     (. (groups.umbraFG) 2)
                     :SKIP)
                     
  (vim.cmd "hi def link vimOperParen Variable")
  (vim.cmd "hi def link vimFunction Function")
  (vim.cmd "hi def link vimIsCommand Identifier")
  (vim.cmd "hi def link vimUserFunc Function"))
