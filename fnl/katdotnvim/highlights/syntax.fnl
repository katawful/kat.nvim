(module katdotnvim.highlights.syntax
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.highlight.utils
                   groups katdotnvim.highlights.main
                   run katdotnvim.utils.highlight.run
                   main katdotnvim.main}})

; this function handles NeoVim syntax
(defn identifier [] (local output [(ucolors.blend (. (colors.normal-colors)
                                                     :blue)
                                                  colors.kat.bg.sixth.color 0.65)
                                   12]) output)

(defn statement [] [colors.kat.red.base.color 1])

(defn preproc [] [colors.kat.pink.base.color 5])

(defn typeDef [] [colors.kat.orange.base.color 3])

(defn special [] (local output [(ucolors.blend colors.kat.pink.base.color
                                               (. (colors.normal-colors)
                                                  :purple)
                                               0.65)
                                13]) output)

(defn high-colors [] [{:group :Comment
                       :fg colors.kat.bg.meld.color
                       :bg :SKIP
                       :ctermfg 12
                       :ctermbg :SKIP
                       (. vim.g.kat_nvim_commentStyle) true}
                      {:group :Constant
                       :fg colors.kat.pink.base.color
                       :bg :SKIP
                       :ctermfg 5
                       :ctermbg :SKIP}
                      {:group :String
                       :fg colors.kat.green.auto.color
                       :bg :SKIP
                       :ctermfg 10
                       :ctermbg :SKIP}
                      {:group :Character
                       :fg colors.kat.green.auto_match_fg.color
                       :bg :SKIP
                       :ctermfg 10
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Number
                       :fg colors.kat.pink.base.color
                       :bg :SKIP
                       :ctermfg 5
                       :ctermbg :SKIP}
                      {:group :Float
                       :fg colors.kat.pink.match_fg_less.color
                       :bg :SKIP
                       :ctermfg 13
                       :ctermbg :SKIP}
                      {:group :Boolean
                       :fg colors.kat.blue.match_fg_less.color
                       :bg :SKIP
                       :ctermfg 12
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Identifier
                       :fg 12
                       :bg :SKIP
                       :ctermfg 12
                       :ctermbg :SKIP}
                      {:group :Function
                       :fg colors.kat.teal.mix_red_brighten.color
                       :bg :SKIP
                       :ctermfg 9
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Variable
                       :fg colors.kat.teal.auto.color
                       :bg :SKIP
                       :ctermfg 4
                       :ctermbg :SKIP}
                      {:group :Statement
                       :fg colors.kat.red.base.color
                       :bg :SKIP
                       :ctermfg 1
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Conditional
                       :fg colors.kat.red.mix_purple.color
                       :bg :SKIP
                       :ctermfg 6
                       :ctermbg :SKIP}
                      {:group :Repeat
                       :fg colors.kat.red.mix_orange.color
                       :bg :SKIP
                       :ctermfg 3
                       :ctermbg :SKIP}
                      {:group :Label
                       :fg colors.kat.red.mix_pink.color
                       :bg :SKIP
                       :ctermfg 5
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Operator
                       :fg colors.kat.red.mix_meld_fg.color
                       :bg :SKIP
                       :ctermfg 7
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Keyword
                       :fg colors.kat.red.mix_green.color
                       :bg :SKIP
                       :ctermfg 10
                       :ctermbg :SKIP
                       :italic true}
                      {:group :Exception
                       :fg colors.kat.red.mix_blue.color
                       :bg :SKIP
                       :ctermfg 4
                       :ctermbg :SKIP}
                      {:group :PreProc
                       :fg colors.kat.pink.base.color
                       :bg :SKIP
                       :ctermfg 5
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :Include
                       :fg colors.kat.pink.mix_red.color
                       :bg :SKIP
                       :ctermfg 5
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :Define
                       :fg colors.kat.pink.mix_purple.color
                       :bg :SKIP
                       :ctermfg 14
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :Macro
                       :fg colors.kat.red.mix_blue.color
                       :bg :SKIP
                       :ctermfg 12
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :PreCondit
                       :fg colors.kat.pink.auto_mix_green.color
                       :bg :SKIP
                       :ctermfg 10
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :Type
                       :fg 3
                       :bg :SKIP
                       :ctermfg 3
                       :ctermbg :SKIP
                       :bold true}
                      {:group :StorageClass
                       :fg colors.kat.orange.auto_mix_green.color
                       :bg :SKIP
                       :ctermfg 3
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Structure
                       :fg colors.kat.orange.mix_blue.color
                       :bg :SKIP
                       :ctermfg 3
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Typedef
                       :fg colors.kat.orange.mix_sixth_bg.color
                       :bg :SKIP
                       :ctermfg 3
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Special
                       :fg (. (special) 1)
                       :bg :SKIP
                       :ctermfg 13
                       :ctermbg :SKIP}
                      {:group :SpecialChar
                       :fg colors.kat.plum.match_fg.color
                       :bg :SKIP
                       :ctermfg 13
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Tag
                       :fg colors.kat.plum.mix_red.color
                       :bg :SKIP
                       :ctermfg 13
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Delimiter
                       :fg (-> colors.kat.bg.sixth.color
                               (ucolors.blend colors.kat.fg.base.color 0.8)
                               (ucolors.blend colors.kat.plum.base.color 0.8))
                       :bg :SKIP
                       :ctermfg 13
                       :ctermbg :SKIP
                       :bold true}
                      {:group :SpecialComment
                       :fg colors.kat.plum.mix_meld_bg.color
                       :bg :SKIP
                       :ctermfg 13
                       :ctermbg :SKIP
                       (. vim.g.kat_nvim_commentStyle) true}
                      {:group :Debug
                       :fg colors.kat.plum.auto_mix_green.color
                       :bg :SKIP
                       :ctermfg 13
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Underlined
                       :fg colors.kat.bg.sixth.color
                       :bg :SKIP
                       :ctermfg 15
                       :ctermbg :SKIP
                       :underline true
                       :sp colors.kat.bg.sixth.color}
                      {:group :Error
                       :fg colors.kat.fg.auto.color
                       :bg colors.kat.red.base.color
                       :ctermfg 7
                       :ctermbg 1
                       :bold true}
                      {:group :Todo
                       :fg colors.kat.bg.base.color
                       :bg colors.kat.orange.match_fg_less.color
                       :ctermfg 7
                       :ctermbg 3}
                      {:group :Ignore
                       :fg colors.kat.fg.meld.color
                       :bg :SKIP
                       :ctermfg 15
                       :ctermbg :SKIP}
                      {:group :DiffDelete
                       :fg colors.kat.fg.auto.color
                       :bg colors.kat.red.darken.color
                       :ctermfg 7
                       :ctermbg 1
                       :bold true}
                      {:group :DiffAdd
                       :fg :SKIP
                       :bg colors.kat.green.auto.color
                       :ctermfg 7
                       :ctermbg 2
                       :bold true}
                      {:group :DiffChange
                       :fg :SKIP
                       :bg colors.kat.purple.base.color
                       :ctermfg 7
                       :ctermbg 6
                       :bold true}
                      {:group :DiffText
                       :fg :SKIP
                       :bg colors.kat.blue.base.color
                       :ctermfg 7
                       :ctermbg 4
                       :bold true}
                      {:group :diffAdded
                       :fg (ucolors.blend colors.kat.green.auto.color
                                          colors.kat.fg.auto.color 0.4)
                       :bg (ucolors.blend colors.kat.green.auto.color
                                          colors.kat.bg.base.color 0.6)
                       :ctermfg 7
                       :ctermbg 10
                       :bold true}
                      {:group :diffChanged
                       :fg (ucolors.blend colors.kat.blue.base.color
                                          colors.kat.fg.auto.color 0.4)
                       :bg (ucolors.blend colors.kat.blue.base.color
                                          colors.kat.bg.base.color 0.6)
                       :ctermfg 7
                       :ctermbg 12
                       :bold true}
                      {:group :diffRemoved
                       :fg (ucolors.blend colors.kat.red.base.color
                                          colors.kat.fg.auto.color 0.4)
                       :bg (ucolors.blend colors.kat.red.base.color
                                          colors.kat.bg.base.color 0.6)
                       :ctermfg 7
                       :ctermbg 9
                       :bold true}])

(defn init [] (run.highlight$<-table (high-colors)))
