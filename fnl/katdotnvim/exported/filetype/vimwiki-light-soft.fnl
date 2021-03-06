(module katdotnvim.exported.filetype.vimwiki-light-soft
        {autoload {run katdotnvim.utils.highlight.run}})

(defn render [] [{:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 7
                  :fg "#30474e"
                  :group :VimwikiMarkers}
                 {:bg :SKIP
                  :bold true
                  :ctermbg :SKIP
                  :ctermfg 3
                  :fg "#f2b15c"
                  :group :VimwikiLink
                  :sp "#f2b15c"
                  :underline true}
                 {:bg :SKIP
                  :bold true
                  :ctermbg :SKIP
                  :ctermfg 4
                  :fg "#2dacd2"
                  :group :VimwikiList}
                 {:bg :SKIP
                  :bold true
                  :ctermbg :SKIP
                  :ctermfg 2
                  :fg "#006c4f"
                  :group :VimwikiCheckBoxDone}
                 {:bg :SKIP
                  :bold true
                  :ctermbg :SKIP
                  :ctermfg 1
                  :fg "#eb4949"
                  :group :VimwikiTag}
                 {:bg :SKIP
                  :ctermbg :SKIP
                  :ctermfg 5
                  :fg "#f29cb1"
                  :group :VimwikiDelText
                  :strikethrough true}
                 {:bg "#78aab8"
                  :ctermbg 8
                  :ctermfg 15
                  :fg "#6285c0"
                  :group :VimwikiCode}
                 {:bg :SKIP
                  :bold true
                  :ctermbg :SKIP
                  :ctermfg 4
                  :fg "#2dacd2"
                  :group :VimwikiHeader1}
                 {:bg :SKIP
                  :bold true
                  :ctermbg :SKIP
                  :ctermfg 12
                  :fg "#1c7691"
                  :group :VimwikiHeader2}
                 {:bg :SKIP
                  :bold true
                  :ctermbg :SKIP
                  :ctermfg 3
                  :fg "#f2b15c"
                  :group :VimwikiHeader3}
                 {:bg :SKIP
                  :bold true
                  :ctermbg :SKIP
                  :ctermfg 11
                  :fg "#a5783c"
                  :group :VimwikiHeader4}
                 {:bg :SKIP
                  :bold true
                  :ctermbg :SKIP
                  :ctermfg 5
                  :fg "#f29cb1"
                  :group :VimwikiHeader5}
                 {:bg :SKIP
                  :bold true
                  :ctermbg :SKIP
                  :ctermfg 13
                  :fg "#dd3974"
                  :group :VimwikiHeader6}])

(defn init [] (run.highlight$<-table (render)))
