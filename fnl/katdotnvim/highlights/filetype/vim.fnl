(module katdotnvim.highlights.filetype.vim
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   run katdotnvim.utils.highlight.run
                   groups katdotnvim.highlights.main}})

; this handles the vim filetype

(defn high-colors []
  [
    {:group :vimCommentTitle
     :fg (. (groups.shadowBG) 1)
     :bg (. (groups.shadowFG) 1)
     :ctermfg (. (groups.umbraBG) 2)
     :ctermbg (. (groups.umbraFG) 2)
     :bold true
     :italic true}
    {:group :vimBracket
     :fg (ucolors.blend (. (colors.init :normalColors) :pink) (. (groups.mainFG) 1) 0.7)
     :bg :SKIP
     :ctermfg (. (groups.fillBG) 2)
     :ctermbg :SKIP}
   
    {:group :vimMapModKey
     :fg (ucolors.blend (. (colors.init :normalColors) :pink) (. (groups.mainFG) 1) 0.8)
     :bg :SKIP
     :ctermfg (. (groups.fillBG) 2)
     :ctermbg :SKIP}
   
    {:group :vimFuncSID
     :fg (. (groups.umbraFG) 1)
     :bg :SKIP
     :ctermfg (. (groups.umbraFG) 2)
     :ctermbg :SKIP}
   
    {:group :vimSetSep
     :fg (. (groups.umbraFG) 1)
     :bg :SKIP
     :ctermfg (. (groups.umbraFG) 2)
     :ctermbg :SKIP}
   
    {:group :vimSep
     :fg (. (groups.umbraFG) 1)
     :bg :SKIP
     :ctermfg (. (groups.umbraFG) 2)
     :ctermbg :SKIP}
   
    {:group :vimContinue
     :fg (. (groups.umbraFG) 1)
     :bg :SKIP
     :ctermfg (. (groups.umbraFG) 2)
     :ctermbg :SKIP}])
   
(defn init []
  (vim.cmd "hi def link vimOperParen Variable")
  (vim.cmd "hi def link vimFunction Function")
  (vim.cmd "hi def link vimIsCommand Identifier")
  (vim.cmd "hi def link vimUserFunc Function")
  (run.highlight$<-table (high-colors)))
