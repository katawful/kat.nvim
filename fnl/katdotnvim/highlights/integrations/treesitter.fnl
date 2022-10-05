(module katdotnvim.highlights.integrations.treesitter
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.highlight.utils
                   groups katdotnvim.highlights.main
                   run katdotnvim.utils.highlight.run
                   main katdotnvim.main
                   syntax katdotnvim.highlights.syntax}})

;;; this handles all tree-sitter highlight groups

(def stringColor colors.kat.green.auto.color)

(defn high-colors [] [{:group :TSField
                       :fg (-> (. (syntax.identifier) 1)
                               (ucolors.blend colors.kat.purple.base.color
                                              0.2)
                               (ucolors.brighten 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSProperty :link :TSField}
                      {:group :TSFuncBuiltin
                       :fg (ucolors.blend (. (syntax.identifier) 1)
                                          colors.kat.red.base.color 0.3)
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSFuncMacro
                       :fg (ucolors.blend (. (syntax.preproc) 1)
                                          (. (syntax.identifier) 1) 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :TSMethod
                       :fg (-> (. (syntax.identifier) 1)
                               (ucolors.blend colors.kat.red.base.color
                                              0.3)
                               (ucolors.brighten 0.1)
                               (ucolors.saturation 0.1))
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSVariable :link :Variable}
                      {:group :TSParameter :link :Variable}
                      {:group :TSVariableBuiltin
                       :fg (-> (. (syntax.identifier) 1)
                               (ucolors.blend colors.kat.fg.shadow.color 0.8)
                               (ucolors.darken 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      (fn []
                        (if (= (. main.background-mut 1) :light)
                            (do
                              {:group :TSNamespace
                               :fg (-> (. (syntax.identifier) 1)
                                       (ucolors.blend (. (colors.normal-colors)
                                                         :green)
                                                      0.3)
                                       (ucolors.darken 0.4))
                               :bg :SKIP
                               :ctermfg (. (groups.auxBG) 2)
                               :ctermbg :SKIP})
                            (do
                              {:group :TSNamespace
                               :fg (-> (. (syntax.identifier) 1)
                                       (ucolors.blend (. (colors.normal-colors)
                                                         :green)
                                                      0.3)
                                       (ucolors.brighten 0.2))
                               :bg :SKIP
                               :ctermfg (. (groups.auxBG) 2)
                               :ctermbg :SKIP})))
                      {:group :TSParameterReference
                       :fg (-> (. (syntax.identifier) 1)
                               (ucolors.blend colors.kat.fg.shadow.color 0.8)
                               (ucolors.brighten 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.umbraBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSAnnotation
                       :fg (ucolors.blend (. (syntax.preproc) 1)
                                          colors.kat.fg.meld.color 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 3)
                       :ctermbg :SKIP
                       :italic true}
                      {:group :TSNote
                       :fg colors.kat.fg.shadow.color
                       :bg :SKIP
                       :ctermfg (. (groups.umbraBG) 2)
                       :ctermbg :SKIP}
                      {:group :TSWarning
                       :fg colors.kat.fg.auto.color
                       :bg colors.kat.red.match_bg.color
                       :ctermfg (. (groups.warningFG) 2)
                       :ctermbg (. (groups.warningBG) 2)}
                      {:group :TSDanger
                       :fg colors.kat.fg.auto.color
                       :bg (ucolors.brighten colors.kat.red.base.color 0.1)
                       :ctermfg (. (groups.warningFG) 2)
                       :ctermbg (. (groups.errorBG) 2)
                       :italic true}
                      {:group :TSConstructor
                       :fg (ucolors.blend (. (syntax.typeDef) 1)
                                          colors.kat.red.base.color 0.4)
                       :bg :SKIP
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg :SKIP}
                      {:group :TSTypeBuiltin
                       :fg (ucolors.darken (. (syntax.typeDef) 1) 0.5)
                       :bg :SKIP
                       :ctermfg (. (groups.infoBG) 3)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSConstBuiltin
                       :fg (-> colors.kat.pink.base.color
                               (ucolors.blend colors.kat.blue.base.color
                                              0.8)
                               (ucolors.darken 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 3)
                       :ctermbg :SKIP}
                      {:group :TSConstMacro
                       :fg (ucolors.blend (. (syntax.preproc) 1)
                                          colors.kat.bg.meld.color 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.fillBG) 3)
                       :ctermbg :SKIP}
                      {:group :TSKeywordFunction
                       :fg (-> (. (syntax.statement) 1)
                               (ucolors.blend colors.kat.green.base.color
                                              0.2)
                               (ucolors.brighten 0.1))
                       :bg :SKIP
                       :ctermfg (. (groups.auxBG) 2)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :TSKeywordReturn
                       :fg (-> (. (syntax.statement) 1)
                               (ucolors.blend colors.kat.blue.base.color
                                              0.1)
                               (ucolors.brighten 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 3)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :TSKeywordOperator
                       :fg (-> (. (syntax.statement) 1)
                               (ucolors.blend colors.kat.fg.meld.color 0.1)
                               (ucolors.brighten 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP}
                      {:group :TSPunctDelimiter
                       :fg (ucolors.blend (. (syntax.preproc) 1)
                                          colors.kat.purple.base.color 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 3)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSPunctBracket
                       :fg (ucolors.blend (. (syntax.preproc) 1)
                                          colors.kat.bg.sixth.color 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSPunctSpecial
                       :fg (ucolors.blend (. (syntax.preproc) 1)
                                          (. (syntax.special) 1) 0.4)
                       :bg :SKIP
                       :ctermfg (. (groups.fillBG) 3)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSTagDelimiter
                       :fg (-> (. (syntax.preproc) 1)
                               (ucolors.blend colors.kat.red.base.color
                                              0.4)
                               (ucolors.darken 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSStringRegex
                       :fg (ucolors.blend stringColor
                                          colors.kat.blue.base.color 0.5)
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSStringEscape
                       :fg (ucolors.blend stringColor
                                          colors.kat.red.base.color 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSSymbol
                       :fg (-> stringColor
                               (ucolors.blend colors.kat.purple.base.color
                                              0.3)
                               (ucolors.saturation 0.8))
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 2)
                       :ctermbg :SKIP}
                      {:group :TSTextReference
                       :fg colors.kat.fg.umbra.color
                       :bg :SKIP
                       :ctermfg (. (groups.umbraFG) 2)
                       :ctermbg :SKIP
                       :italic true}
                      {:group :TSURI
                       :fg colors.kat.orange.base.color
                       :bg :SKIP
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg :SKIP
                       :underline true}])

(defn init [] (run.highlight$<-table (high-colors)))
