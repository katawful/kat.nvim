(module katdotnvim.highlights.syntax
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.color
                   groups katdotnvim.highlights.main
                   run katdotnvim.utils.highlight.run
                   main katdotnvim.main}})

; this function handles NeoVim syntax
(defn identifier [] (local output [(ucolors.blend (. (colors.normal-colors)
                                                     :blue)
                                                  (. (colors.background) 6) 0.65)
                                   12]) output)

(defn statement [] [(. (colors.normal-colors) :red) 1])

(defn preproc [] [(. (colors.normal-colors) :pink) 5])

(defn typeDef [] [(. (colors.normal-colors) :orange) 3])

(defn special [] (local output [(ucolors.blend (. (colors.normal-colors) :pink)
                                               (. (colors.normal-colors)
                                                  :purple)
                                               0.65)
                                13]) output)

(defn high-colors [] [{:group :Comment
                       :fg (. (groups.meldBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 3)
                       :ctermbg :SKIP
                       (. vim.g.kat_nvim_commentStyle) true}
                      {:group :Constant
                       :fg (. (groups.fillBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.fillBG) 2)
                       :ctermbg :SKIP}
                      {:group :String
                       :fg (. (groups.auxBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.auxBG) 3)
                       :ctermbg :SKIP}
                      {:group :Character
                       :fg (ucolors.blend (. (groups.auxBG) 1)
                                          (. (groups.mainFG) 1) 0.5)
                       :bg :SKIP
                       :ctermfg (. (groups.auxBG) 3)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Number
                       :fg (. (groups.fillBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.fillBG) 2)
                       :ctermbg :SKIP}
                      {:group :Float
                       :fg (ucolors.blend (. (groups.fillBG) 1)
                                          (. (groups.mainFG) 1) 0.7)
                       :bg :SKIP
                       :ctermfg (. (groups.fillBG) 3)
                       :ctermbg :SKIP}
                      {:group :Boolean
                       :fg (ucolors.blend (. (groups.selectionBG) 1)
                                          (. (groups.mainFG) 1) 0.7)
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
                               (ucolors.blend (. (groups.errorBG) 1) 0.3)
                               (ucolors.brighten 0.1)
                               (ucolors.saturation 0.5))
                       :bg :SKIP
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      (fn []
                        (if (= vim.o.background :light)
                            {:group :Variable
                             :fg (-> (. (identifier) 1)
                                     (ucolors.blend (. (colors.foreground) 6)
                                                    0.5)
                                     (ucolors.darken 0.4))
                             :bg :SKIP
                             :ctermfg (. (groups.selectionBG) 2)
                             :ctermbg :SKIP}
                            {:group :Variable
                             :fg (-> (. (identifier) 1)
                                     (ucolors.blend (. (colors.foreground) 6)
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
                               (ucolors.blend (. (groups.highlightBG) 1) 0.2)
                               (ucolors.brighten 0.1))
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 2)
                       :ctermbg :SKIP}
                      {:group :Repeat
                       :fg (-> (. (statement) 1)
                               (ucolors.blend (. (groups.infoBG) 1) 0.2)
                               (ucolors.brighten 0.3)
                               (ucolors.saturation 0.8))
                       :bg :SKIP
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg :SKIP}
                      {:group :Label
                       :fg (-> (. (statement) 1)
                               (ucolors.blend (. (groups.fillBG) 1) 0.2)
                               (ucolors.saturation 1))
                       :bg :SKIP
                       :ctermfg (. (groups.fillBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Operator
                       :fg (ucolors.blend (. (statement) 1)
                                          (. (groups.meldFG) 1) 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      (fn []
                        (if (= vim.o.background :light)
                            (do
                              {:group :Keyword
                               :fg (-> (. (statement) 1)
                                       (ucolors.blend (. (groups.auxBG) 1) 0.2)
                                       (ucolors.darken 0.5))
                               :bg :SKIP
                               :ctermfg (. (groups.auxBG) 3)
                               :ctermbg :SKIP
                               :italic true})
                            (do
                              {:group :Keyword
                               :fg (-> (. (statement) 1)
                                       (ucolors.blend (. (groups.auxBG) 1) 0.2)
                                       (ucolors.brighten 0.5))
                               :bg :SKIP
                               :ctermfg (. (groups.auxBG) 3)
                               :ctermbg :SKIP
                               :italic true})))
                      {:group :Exception
                       :fg (-> (. (statement) 1)
                               (ucolors.blend (. (groups.selectionBG) 1) 0.1)
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
                                          (. (groups.errorBG) 1) 0.2)
                       :bg :SKIP
                       :ctermfg (. (preproc) 2)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :Define
                       :fg (ucolors.blend (. (preproc) 1)
                                          (. (groups.highlightBG) 1) 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 3)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :Macro
                       :fg (ucolors.blend (. (preproc) 1)
                                          (. (groups.selectionBG) 1) 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 3)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :PreCondit
                       :fg (ucolors.blend (. (preproc) 1) (. (groups.auxBG) 1)
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
                       :fg (ucolors.blend (. (typeDef) 1) (. (groups.auxBG) 1)
                                          0.2)
                       :bg :SKIP
                       :ctermfg (. (typeDef) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Structure
                       :fg (ucolors.blend (. (typeDef) 1)
                                          (. (groups.selectionBG) 1) 0.2)
                       :bg :SKIP
                       :ctermfg (. (typeDef) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Typedef
                       :fg (-> (. (typeDef) 1)
                               (ucolors.blend (. (colors.background) 6) 0.2)
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
                       :fg (ucolors.blend (. (special) 1) (. (groups.mainFG) 1)
                                          0.8)
                       :bg :SKIP
                       :ctermfg (. (special) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Tag
                       :fg (ucolors.blend (. (special) 1)
                                          (. (groups.errorBG) 1) 0.2)
                       :bg :SKIP
                       :ctermfg (. (special) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Delimiter
                       :fg (-> (. (colors.background) 6)
                               (ucolors.blend (. (groups.mainFG) 1) 0.8)
                               (ucolors.blend (. (special) 1) 0.8))
                       :bg :SKIP
                       :ctermfg (. (special) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :SpecialComment
                       :fg (ucolors.blend (. (special) 1) (. (groups.meldBG) 1)
                                          0.2)
                       :bg :SKIP
                       :ctermfg (. (special) 2)
                       :ctermbg :SKIP
                       (. vim.g.kat_nvim_commentStyle) true}
                      {:group :Debug
                       :fg (ucolors.blend (. (special) 1) (. (groups.auxBG) 1)
                                          0.2)
                       :bg :SKIP
                       :ctermfg (. (special) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :Underlined
                       :fg (. (colors.background) 6)
                       :bg :SKIP
                       :ctermfg (. (groups.umbraFG) 2)
                       :ctermbg :SKIP
                       :underline true
                       :sp (. (colors.background) 6)}
                      {:group :Error
                       :fg (. (groups.errorFG) 1)
                       :bg (. (groups.errorBG) 1)
                       :ctermfg (. (groups.errorFG) 2)
                       :ctermbg (. (groups.errorBG) 2)
                       :bold true}
                      {:group :Todo
                       :fg (. (groups.infoFG) 1)
                       :bg (ucolors.blend (. (groups.infoBG) 1)
                                          (. (groups.mainFG) 1) 0.9)
                       :ctermfg (. (groups.infoFG) 2)
                       :ctermbg (. (groups.infoBG) 2)}
                      {:group :Ignore
                       :fg (. (groups.meldFG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.umbraFG) 2)
                       :ctermbg :SKIP}
                      {:group :DiffDelete
                       :fg (. (groups.mainFG) 1)
                       :bg (ucolors.darken (. (groups.errorBG) 1) 0.2)
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg (. (groups.errorBG) 2)
                       :bold true}
                      {:group :DiffAdd
                       :fg :SKIP
                       :bg (. (groups.auxBG) 1)
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg (. (groups.auxBG) 2)
                       :bold true}
                      {:group :DiffChange
                       :fg :SKIP
                       :bg (. (groups.highlightBG) 1)
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg (. (groups.highlightBG) 2)
                       :bold true}
                      {:group :DiffText
                       :fg :SKIP
                       :bg (. (groups.selectionBG) 1)
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg (. (groups.selectionBG) 2)
                       :bold true}
                      {:group :diffAdded
                       :fg (ucolors.blend (. (groups.auxBG) 1)
                                          (. (groups.mainFG) 1) 0.4)
                       :bg (ucolors.blend (. (groups.auxBG) 1)
                                          (. (groups.mainBG) 1) 0.6)
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg (. (groups.auxBG) 3)
                       :bold true}
                      {:group :diffChanged
                       :fg (ucolors.blend (. (groups.selectionBG) 1)
                                          (. (groups.mainFG) 1) 0.4)
                       :bg (ucolors.blend (. (groups.selectionBG) 1)
                                          (. (groups.mainBG) 1) 0.6)
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg (. (groups.selectionBG) 3)
                       :bold true}
                      {:group :diffRemoved
                       :fg (ucolors.blend (. (groups.errorBG) 1)
                                          (. (groups.mainFG) 1) 0.4)
                       :bg (ucolors.blend (. (groups.errorBG) 1)
                                          (. (groups.mainBG) 1) 0.6)
                       :ctermfg (. (groups.mainFG) 2)
                       :ctermbg (. (groups.warningBG) 2)
                       :bold true}])

(defn init [] (run.highlight$<-table (high-colors)))
