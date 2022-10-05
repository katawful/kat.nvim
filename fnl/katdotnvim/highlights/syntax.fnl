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
                       :ctermfg (. (groups.selectionBG) 3)
                       :ctermbg :SKIP
                       (. vim.g.kat_nvim_commentStyle) true}
                      {:group :Constant
                       :fg colors.kat.pink.base.color
                       :bg :SKIP
                       :ctermfg (. (groups.fillBG) 2)
                       :ctermbg :SKIP}
                      {:group :String
                       :fg colors.kat.green.auto.color
                       :bg :SKIP
                       :ctermfg (. (groups.auxBG) 3)
                       :ctermbg :SKIP}
                      {:group :Character
                       :fg (ucolors.blend colors.kat.green.auto.color
                                          colors.kat.fg.auto.color 0.5)
                       :bg :SKIP
                       :ctermfg (. (groups.auxBG) 3)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Number
                       :fg colors.kat.pink.base.color
                       :bg :SKIP
                       :ctermfg (. (groups.fillBG) 2)
                       :ctermbg :SKIP}
                      {:group :Float
                       :fg (ucolors.blend colors.kat.pink.base.color
                                          colors.kat.fg.auto.color 0.7)
                       :bg :SKIP
                       :ctermfg (. (groups.fillBG) 3)
                       :ctermbg :SKIP}
                      {:group :Boolean
                       :fg (ucolors.blend colors.kat.blue.base.color
                                          colors.kat.fg.auto.color 0.7)
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 3)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Identifier
                       :fg (. (identifier) 1)
                       :bg :SKIP
                       :ctermfg (. (identifier) 2)
                       :ctermbg :SKIP}
                      {:group :Function
                       :fg (-> (. (identifier) 1)
                               (ucolors.blend colors.kat.red.base.color 0.3)
                               (ucolors.brighten 0.1)
                               (ucolors.saturation 0.5))
                       :bg :SKIP
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      (fn []
                        (if (= (. main.background-mut 1) :light)
                            {:group :Variable
                             :fg (-> (. (identifier) 1)
                                     (ucolors.blend colors.kat.fg.sixth.color
                                                    0.5)
                                     (ucolors.darken 0.4))
                             :bg :SKIP
                             :ctermfg (. (groups.selectionBG) 2)
                             :ctermbg :SKIP}
                            {:group :Variable
                             :fg (-> (. (identifier) 1)
                                     (ucolors.blend colors.kat.fg.sixth.color
                                                    0.5)
                                     (ucolors.brighten 0.4))
                             :bg :SKIP
                             :ctermfg (. (groups.selectionBG) 2)
                             :ctermbg :SKIP}))
                      {:group :Statement
                       :fg (. (statement) 1)
                       :bg :SKIP
                       :ctermfg (. (statement) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Conditional
                       :fg (-> (. (statement) 1)
                               (ucolors.blend colors.kat.purple.base.color 0.2)
                               (ucolors.brighten 0.1))
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 2)
                       :ctermbg :SKIP}
                      {:group :Repeat
                       :fg (-> (. (statement) 1)
                               (ucolors.blend colors.kat.orange.base.color 0.2)
                               (ucolors.brighten 0.3)
                               (ucolors.saturation 0.8))
                       :bg :SKIP
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg :SKIP}
                      {:group :Label
                       :fg (-> (. (statement) 1)
                               (ucolors.blend colors.kat.pink.base.color 0.2)
                               (ucolors.saturation 1))
                       :bg :SKIP
                       :ctermfg (. (groups.fillBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Operator
                       :fg (ucolors.blend (. (statement) 1)
                                          colors.kat.fg.meld.color 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      (fn []
                        (if (= (. main.background-mut 1) :light)
                            (do
                              {:group :Keyword
                               :fg (-> (. (statement) 1)
                                       (ucolors.blend colors.kat.green.auto.color 0.2)
                                       (ucolors.darken 0.5))
                               :bg :SKIP
                               :ctermfg (. (groups.auxBG) 3)
                               :ctermbg :SKIP
                               :italic true})
                            (do
                              {:group :Keyword
                               :fg (-> (. (statement) 1)
                                       (ucolors.blend colors.kat.green.auto.color 0.2)
                                       (ucolors.brighten 0.5))
                               :bg :SKIP
                               :ctermfg (. (groups.auxBG) 3)
                               :ctermbg :SKIP
                               :italic true})))
                      {:group :Exception
                       :fg (-> (. (statement) 1)
                               (ucolors.blend colors.kat.blue.base.color 0.1)
                               (ucolors.brighten 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP}
                      {:group :PreProc
                       :fg (. (preproc) 1)
                       :bg :SKIP
                       :ctermfg (. (preproc) 2)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :Include
                       :fg (ucolors.blend (. (preproc) 1)
                                          colors.kat.red.base.color 0.2)
                       :bg :SKIP
                       :ctermfg (. (preproc) 2)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :Define
                       :fg (ucolors.blend (. (preproc) 1)
                                          colors.kat.purple.base.color 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 3)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :Macro
                       :fg (ucolors.blend (. (preproc) 1)
                                          colors.kat.blue.base.color 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 3)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :PreCondit
                       :fg (ucolors.blend (. (preproc) 1) colors.kat.green.auto.color
                                          0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.auxBG) 3)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :Type
                       :fg (. (typeDef) 1)
                       :bg :SKIP
                       :ctermfg (. (typeDef) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :StorageClass
                       :fg (ucolors.blend (. (typeDef) 1) colors.kat.green.auto.color
                                          0.2)
                       :bg :SKIP
                       :ctermfg (. (typeDef) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Structure
                       :fg (ucolors.blend (. (typeDef) 1)
                                          colors.kat.blue.base.color 0.2)
                       :bg :SKIP
                       :ctermfg (. (typeDef) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Typedef
                       :fg (-> (. (typeDef) 1)
                               (ucolors.blend colors.kat.bg.sixth.color 0.2)
                               (ucolors.saturation 1))
                       :bg :SKIP
                       :ctermfg (. (typeDef) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Special
                       :fg (. (special) 1)
                       :bg :SKIP
                       :ctermfg (. (special) 2)
                       :ctermbg :SKIP}
                      {:group :SpecialChar
                       :fg (ucolors.blend (. (special) 1) colors.kat.fg.auto.color
                                          0.8)
                       :bg :SKIP
                       :ctermfg (. (special) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Tag
                       :fg (ucolors.blend (. (special) 1)
                                          colors.kat.red.base.color 0.2)
                       :bg :SKIP
                       :ctermfg (. (special) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Delimiter
                       :fg (-> colors.kat.bg.sixth.color
                               (ucolors.blend colors.kat.fg.auto.color 0.8)
                               (ucolors.blend (. (special) 1) 0.8))
                       :bg :SKIP
                       :ctermfg (. (special) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :SpecialComment
                       :fg (ucolors.blend (. (special) 1) colors.kat.bg.meld.color
                                          0.2)
                       :bg :SKIP
                       :ctermfg (. (special) 2)
                       :ctermbg :SKIP
                       (. vim.g.kat_nvim_commentStyle) true}
                      {:group :Debug
                       :fg (ucolors.blend (. (special) 1) colors.kat.green.auto.color
                                          0.2)
                       :bg :SKIP
                       :ctermfg (. (special) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Underlined
                       :fg colors.kat.bg.sixth.color
                       :bg :SKIP
                       :ctermfg (. (groups.umbraFG) 2)
                       :ctermbg :SKIP
                       :underline true
                       :sp colors.kat.bg.sixth.color}
                      {:group :Error
                       :fg colors.kat.fg.auto.color
                       :bg colors.kat.red.base.color
                       :ctermfg (. (groups.errorFG) 2)
                       :ctermbg (. (groups.errorBG) 2)
                       :bold true}
                      {:group :Todo
                       :fg colors.kat.bg.base.color
                       :bg (ucolors.blend colors.kat.orange.base.color
                                          colors.kat.fg.auto.color 0.9)
                       :ctermfg (. (groups.infoFG) 2)
                       :ctermbg (. (groups.infoBG) 2)}
                      {:group :Ignore
                       :fg colors.kat.fg.meld.color
                       :bg :SKIP
                       :ctermfg (. (groups.umbraFG) 2)
                       :ctermbg :SKIP}
                      {:group :DiffDelete
                       :fg colors.kat.fg.auto.color
                       :bg (ucolors.darken colors.kat.red.base.color 0.2)
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg (. (groups.errorBG) 2)
                       :bold true}
                      {:group :DiffAdd
                       :fg :SKIP
                       :bg colors.kat.green.auto.color
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg (. (groups.auxBG) 2)
                       :bold true}
                      {:group :DiffChange
                       :fg :SKIP
                       :bg colors.kat.purple.base.color
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg (. (groups.highlightBG) 2)
                       :bold true}
                      {:group :DiffText
                       :fg :SKIP
                       :bg colors.kat.blue.base.color
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg (. (groups.selectionBG) 2)
                       :bold true}
                      {:group :diffAdded
                       :fg (ucolors.blend colors.kat.green.auto.color
                                          colors.kat.fg.auto.color 0.4)
                       :bg (ucolors.blend colors.kat.green.auto.color
                                          colors.kat.bg.base.color 0.6)
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg (. (groups.auxBG) 3)
                       :bold true}
                      {:group :diffChanged
                       :fg (ucolors.blend colors.kat.blue.base.color
                                          colors.kat.fg.auto.color 0.4)
                       :bg (ucolors.blend colors.kat.blue.base.color
                                          colors.kat.bg.base.color 0.6)
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg (. (groups.selectionBG) 3)
                       :bold true}
                      {:group :diffRemoved
                       :fg (ucolors.blend colors.kat.red.base.color
                                          colors.kat.fg.auto.color 0.4)
                       :bg (ucolors.blend colors.kat.red.base.color
                                          colors.kat.bg.base.color 0.6)
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg (. (groups.warningBG) 2)
                       :bold true}])

(defn init [] (run.highlight$<-table (high-colors)))
