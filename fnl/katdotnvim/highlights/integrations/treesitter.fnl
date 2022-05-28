(module katdotnvim.highlights.integrations.treesitter
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.color
                   groups katdotnvim.highlights.main
                   run katdotnvim.utils.highlight.run
                   syntax katdotnvim.highlights.syntax}})

; this handles all tree-sitter highlight groups

(def stringColor (. (groups.auxBG) 1))

(defn high-colors [] [{:group :TSField
                       :fg (ucolors.brighten (ucolors.blend (. (syntax.identifier)
                                                               1)
                                                            (. (colors.init :normalColors)
                                                               :purple)
                                                            0.2)
                                             0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSProperty :link :TSField}
                      {:group :TSFuncBuiltin
                       :fg (ucolors.blend (. (syntax.identifier) 1)
                                          (. (colors.init :normalColors) :red)
                                          0.3)
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
                       :fg (ucolors.saturation (ucolors.brighten (ucolors.blend (. (syntax.identifier)
                                                                                   1)
                                                                                (. (colors.init :normalColors)
                                                                                   :red)
                                                                                0.3)
                                                                 0.1)
                                               0.1)
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSVariable :link :Variable}
                      {:group :TSParameter :link :Variable}
                      {:group :TSVariableBuiltin
                       :fg (ucolors.darken (ucolors.blend (. (syntax.identifier)
                                                             1)
                                                          (. (colors.init :foreground)
                                                             3)
                                                          0.8)
                                           0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      (fn []
                        (if (= vim.g.kat_nvim_style :light)
                            (do
                              {:group :TSNamespace
                               :fg (ucolors.darken (ucolors.blend (. (syntax.identifier)
                                                                     1)
                                                                  (. (colors.init :normalColors)
                                                                     :green)
                                                                  0.3)
                                                   0.4)
                               :bg :SKIP
                               :ctermfg (. (groups.auxBG) 2)
                               :ctermbg :SKIP})
                            (do
                              {:group :TSNamespace
                               :fg (ucolors.brighten (ucolors.blend (. (syntax.identifier)
                                                                       1)
                                                                    (. (colors.init :normalColors)
                                                                       :green)
                                                                    0.3)
                                                     0.2)
                               :bg :SKIP
                               :ctermfg (. (groups.auxBG) 2)
                               :ctermbg :SKIP})))
                      {:group :TSParameterReference
                       :fg (ucolors.brighten (ucolors.blend (. (syntax.identifier)
                                                               1)
                                                            (. (colors.init :foreground)
                                                               3)
                                                            0.8)
                                             0.2)
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
                                          (. (colors.init :normalColors) :red)
                                          0.4)
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
                       :fg (ucolors.darken (ucolors.blend (. (groups.fillBG) 1)
                                                          (. (colors.init :normalColors)
                                                             :blue)
                                                          0.8)
                                           0.2)
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
                       :fg (ucolors.brighten (ucolors.blend (. (syntax.statement)
                                                               1)
                                                            (. (colors.init :normalColors)
                                                               :green)
                                                            0.2)
                                             0.1)
                       :bg :SKIP
                       :ctermfg (. (groups.auxBG) 2)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :TSKeywordReturn
                       :fg (ucolors.brighten (ucolors.blend (. (syntax.statement)
                                                               1)
                                                            (. (colors.init :normalColors)
                                                               :blue)
                                                            0.1)
                                             0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 3)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :TSKeywordOperator
                       :fg (ucolors.brighten (ucolors.blend (. (syntax.statement)
                                                               1)
                                                            (. (groups.meldFG)
                                                               1)
                                                            0.1)
                                             0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP}
                      {:group :TSPunctDelimiter
                       :fg (ucolors.blend (. (syntax.preproc) 1)
                                          (. (colors.init :normalColors)
                                             :purple)
                                          0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 3)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSPunctBracket
                       :fg (ucolors.blend (. (syntax.preproc) 1)
                                          (. (colors.init :background) 6) 0.2)
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
                       :fg (ucolors.darken (ucolors.blend (. (syntax.preproc) 1)
                                                          (. (colors.init :normalColors)
                                                             :red)
                                                          0.4)
                                           0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSStringRegex
                       :fg (ucolors.blend stringColor
                                          (. (colors.init :normalColors) :blue)
                                          0.5)
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSStringEscape
                       :fg (ucolors.blend stringColor
                                          (. (colors.init :normalColors) :red)
                                          0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSSymbol
                       :fg (ucolors.saturation (ucolors.blend stringColor
                                                              (. (colors.init :normalColors)
                                                                 :purple)
                                                              0.3)
                                               0.8)
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
