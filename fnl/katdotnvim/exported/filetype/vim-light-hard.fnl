(module katdotnvim.exported.filetype.vim-light-hard
  {autoload {run katdotnvim.utils.highlight.run}})
(defn render []
 [
  {:bg "#405881"
   :bold true
   :ctermbg 15
   :ctermfg 8
   :fg "#78aab8"
   :group "vimCommentTitle"
   :italic true}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 5 :fg "#af7689" :group "vimBracket"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 5 :fg "#c58297" :group "vimMapModKey"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 15 :fg "#202f47" :group "vimFuncSID"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 15 :fg "#202f47" :group "vimSetSep"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 15 :fg "#202f47" :group "vimSep"}
  {:bg "SKIP" :ctermbg "SKIP" :ctermfg 15 :fg "#202f47" :group "vimContinue"}])
(defn init [] (run.highlight$<-table (render))
  (vim.cmd "hi def link vimOperParen Variable")
  (vim.cmd "hi def link vimFunction Function")
  (vim.cmd "hi def link vimIsCommand Identifier")
  (vim.cmd "hi def link vimUserFunc Function"))
