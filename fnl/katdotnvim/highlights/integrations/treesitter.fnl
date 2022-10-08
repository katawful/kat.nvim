(module katdotnvim.highlights.integrations.treesitter
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.highlight.utils
                   groups katdotnvim.highlights.main
                   run katdotnvim.utils.highlight.run
                   main katdotnvim.main
                   syntax katdotnvim.highlights.syntax}})

;;; this handles all tree-sitter highlight groups

(defn high-colors [] [{:group :TSField
                       :fg colors.kat.teal.mix_purple.color
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSProperty :link :TSField}
                      {:group :TSFuncBuiltin
                       :fg colors.kat.teal.mix_red.color
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSFuncMacro
                       :fg colors.kat.pink.mix_teal.color
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :TSMethod
                       :fg colors.kat.teal.mix_red_brighten_dull.color
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSVariable :link :Variable}
                      {:group :TSParameter :link :Variable}
                      {:group :TSVariableBuiltin
                       :fg colors.kat.teal.mix_shadow_fg.color
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSNamespace
                       :fg colors.kat.teal.mix_green.color
                       :bg :SKIP
                       :ctermfg (. (groups.auxBG) 2)
                       :ctermbg :SKIP}
                      {:group :TSParameterReference
                       :fg colors.kat.teal.mix_shadow_fg.color
                       :bg :SKIP
                       :ctermfg (. (groups.umbraBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSAnnotation
                       :fg colors.kat.pink.mix_meld_fg.color
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
                       :fg colors.kat.orange.mix_red.color
                       :bg :SKIP
                       :ctermfg (. (groups.infoBG) 2)
                       :ctermbg :SKIP}
                      {:group :TSTypeBuiltin
                       :fg (ucolors.darken colors.kat.orange.base.color 0.5)
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
                       :fg (ucolors.blend colors.kat.pink.base.color
                                          colors.kat.bg.meld.color 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.fillBG) 3)
                       :ctermbg :SKIP}
                      {:group :TSKeywordFunction
                       :fg (-> colors.kat.red.base.color
                               (ucolors.blend colors.kat.green.base.color
                                              0.2)
                               (ucolors.brighten 0.1))
                       :bg :SKIP
                       :ctermfg (. (groups.auxBG) 2)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :TSKeywordReturn
                       :fg (-> colors.kat.red.base.color
                               (ucolors.blend colors.kat.blue.base.color
                                              0.1)
                               (ucolors.brighten 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 3)
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group :TSKeywordOperator
                       :fg (-> colors.kat.red.base.color
                               (ucolors.blend colors.kat.fg.meld.color 0.1)
                               (ucolors.brighten 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP}
                      {:group :TSPunctDelimiter
                       :fg (ucolors.blend colors.kat.pink.base.color
                                          colors.kat.purple.base.color 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 3)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSPunctBracket
                       :fg (ucolors.blend colors.kat.pink.base.color
                                          colors.kat.bg.sixth.color 0.2)
                       :bg :SKIP
                       :ctermfg (. (groups.highlightBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSPunctSpecial
                       :fg (ucolors.blend colors.kat.pink.base.color
                                          colors.kat.plum.base.color 0.4)
                       :bg :SKIP
                       :ctermfg (. (groups.fillBG) 3)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSTagDelimiter
                       :fg (-> colors.kat.pink.base.color
                               (ucolors.blend colors.kat.red.base.color
                                              0.4)
                               (ucolors.darken 0.2))
                       :bg :SKIP
                       :ctermfg (. (groups.warningBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSStringRegex
                       :fg colors.kat.green.mix_blue.color
                       :bg :SKIP
                       :ctermfg (. (groups.selectionBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSStringEscape
                       :fg colors.kat.green.mix_red.color
                       :bg :SKIP
                       :ctermfg (. (groups.errorBG) 2)
                       :ctermbg :SKIP
                       :bold true}
                      {:group :TSSymbol
                       :fg colors.kat.green.mix_purple.color
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
