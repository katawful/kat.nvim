(module katdotnvim.highlights.integrations.treesitter
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.highlight.utils
                   groups katdotnvim.highlights.main
                   run katdotnvim.utils.highlight.run
                   syntax katdotnvim.highlights.syntax}})

; this handles all tree-sitter highlight groups

(def stringColor (. (groups.auxBG) 1))

(defn high-colors [] [{:group :TSField
                       :fg (-> (. (syntax.identifier) 1)
                               (ucolors.blend (. (colors.normal-colors) :purple)
                                              0.2)
                               (ucolors.brighten 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSProperty :link :TSField}
                      {:group :TSFuncBuiltin
                       :fg (ucolors.blend (. (syntax.identifier) 1)
                                          (. (colors.normal-colors) :red) 0.3)
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
                               (ucolors.blend (. (colors.normal-colors) :red)
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
                               (ucolors.blend (. (colors.foreground) 3) 0.8)
                               (ucolors.darken 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      (fn []
                        (if (= vim.g.kat_nvim_style :light)
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
                               (ucolors.blend (. (colors.foreground) 3) 0.8)
                               (ucolors.brighten 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.umbraBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSAnnotation
                       :fg (ucolors.blend (. (syntax.preproc) 1)
                                          (. (groups.meldFG) 1) 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 3)
                       :ctermbg :SKIP
                       :italic true}
                      {:group :TSNote
                       :fg (. (groups.shadowFG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.umbraBG) 2)
                       :ctermbg :SKIP}
                      {:group :TSWarning
                       :fg (. (groups.warningFG) 1)
                       :bg (. (groups.warningBG) 1)
                       :ctermfg (. (groups.warningFG) 2)
                       :ctermbg (. (groups.warningBG) 2)}
                      {:group :TSDanger
                       :fg (. (groups.warningFG) 1)
                       :bg (ucolors.brighten (. (groups.errorBG) 1) 0.1)
                       :ctermfg (. (groups.warningFG) 2)
                       :ctermbg (. (groups.errorBG) 2)
                       :italic true}
                      {:group :TSConstructor
                       :fg (ucolors.blend (. (syntax.typeDef) 1)
                                          (. (colors.normal-colors) :red) 0.4)
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
                       :fg (-> (. (groups.fillBG) 1)
                               (ucolors.blend (. (colors.normal-colors) :blue)
                                              0.8)
                               (ucolors.darken 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 3)
                       :ctermbg :SKIP}
                      {:group :TSConstMacro
                       :fg (ucolors.blend (. (syntax.preproc) 1)
                                          (. (groups.meldBG) 1) 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.fillBG) 3)
                       :ctermbg :SKIP}
                      {:group :TSKeywordFunction
                       :fg (-> (. (syntax.statement) 1)
                               (ucolors.blend (. (colors.normal-colors) :green)
                                              0.2)
                               (ucolors.brighten 0.1))
                       :bg :SKIP
                       :ctermfg (. (groups.auxBG) 2)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :TSKeywordReturn
                       :fg (-> (. (syntax.statement) 1)
                               (ucolors.blend (. (colors.normal-colors) :blue)
                                              0.1)
                               (ucolors.brighten 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 3)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :TSKeywordOperator
                       :fg (-> (. (syntax.statement) 1)
                               (ucolors.blend (. (groups.meldFG) 1) 0.1)
                               (ucolors.brighten 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP}
                      {:group :TSPunctDelimiter
                       :fg (ucolors.blend (. (syntax.preproc) 1)
                                          (. (colors.normal-colors) :purple) 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 3)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSPunctBracket
                       :fg (ucolors.blend (. (syntax.preproc) 1)
                                          (. (colors.background) 6) 0.2)
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
                               (ucolors.blend (. (colors.normal-colors) :red)
                                              0.4)
                               (ucolors.darken 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSStringRegex
                       :fg (ucolors.blend stringColor
                                          (. (colors.normal-colors) :blue) 0.5)
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSStringEscape
                       :fg (ucolors.blend stringColor
                                          (. (colors.normal-colors) :red) 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSSymbol
                       :fg (-> stringColor
                               (ucolors.blend (. (colors.normal-colors) :purple)
                                              0.3)
                               (ucolors.saturation 0.8))
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 2)
                       :ctermbg :SKIP}
                      {:group :TSTextReference
                       :fg (. (groups.umbraFG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.umbraFG) 2)
                       :ctermbg :SKIP
                       :italic true}
                      {:group :TSURI
                       :fg (. (groups.infoBG) 1)
                       :bg :SKIP
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg :SKIP
                       :underline true}])

(defn init [] (run.highlight$<-table (high-colors)))
