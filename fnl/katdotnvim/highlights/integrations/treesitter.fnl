(module katdotnvim.highlights.integrations.treesitter
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.highlight.utils
                   groups katdotnvim.highlights.main
                   run katdotnvim.utils.highlight.run
                   main katdotnvim.main
                   syntax katdotnvim.highlights.syntax}})

;;; this handles all tree-sitter highlight groups

(defn high-colors [] [{:group "@field"
                       :fg colors.kat.teal.mix_purple.color
                       :bg :SKIP
                       :ctermfg 6
                       :ctermbg :SKIP
                       :bold true}
                      {:group "@comment" :link "Comment"}
                      {:group "@error" :link "Error"}
                      {:group "@none"
                       :fg :NONE
                       :bg :NONE
                       :ctermfg :NONE
                       :ctermbg :NONE}
                      {:group "@property" :link "@field"}
                      {:group "@function.builtin"
                       :fg colors.kat.teal.mix_red.color
                       :bg :SKIP
                       :ctermfg 1
                       :ctermbg :SKIP
                       :bold true}
                      {:group "@function.macro"
                       :fg colors.kat.pink.mix_teal.color
                       :bg :SKIP
                       :ctermfg 1
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group "@function.call"
                       :fg (-> colors.kat.red.base.color
                               (ucolors.blend colors.kat.green.base.color 0.7))
                       :bg :SKIP
                       :ctermfg 1
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group "@method"
                       :fg colors.kat.teal.mix_red_brighten_dull.color
                       :bg :SKIP
                       :ctermfg 1
                       :ctermbg :SKIP
                       :bold true}
                      {:group "@method.call"
                       :fg (-> colors.kat.teal.mix_red_brighten_dull.color
                               (ucolors.blend colors.kat.green.base.color 0.7))
                       :bg :SKIP
                       :ctermfg 1
                       :ctermbg :SKIP
                       :bold true}
                      {:group "@variable" :link :Variable}
                      {:group "@parameter" :link :Variable}
                      {:group "@variable.builtin"
                       :fg colors.kat.teal.mix_shadow_fg.color
                       :bg :SKIP
                       :ctermfg 4
                       :ctermbg :SKIP
                       :bold true}
                      {:group "@namespace"
                       :fg colors.kat.teal.mix_green.color
                       :bg :SKIP
                       :ctermfg 2
                       :ctermbg :SKIP}
                      {:group "@parameter.reference"
                       :fg colors.kat.teal.mix_shadow_fg.color
                       :bg :SKIP
                       :ctermfg 8
                       :ctermbg :SKIP
                       :bold true}
                      {:group "@annotation"
                       :fg colors.kat.pink.mix_meld_fg.color
                       :bg :SKIP
                       :ctermfg 14
                       :ctermbg :SKIP
                       :italic true}
                      {:group "@note"
                       :fg colors.kat.fg.shadow.color
                       :bg :SKIP
                       :ctermfg 8
                       :ctermbg :SKIP}
                      {:group "@constructor"
                       :fg colors.kat.orange.mix_red.color
                       :bg :SKIP
                       :ctermfg 3
                       :ctermbg :SKIP}
                      {:group "@type" :link :Type}
                      {:group "@type.builtin"
                       :fg (ucolors.darken colors.kat.orange.base.color 0.5)
                       :bg :SKIP
                       :ctermfg 11
                       :ctermbg :SKIP
                       :bold true}
                      {:group "@type.definition" :link :Typedef}
                      {:group "@type.qualifier"
                       :fg (ucolors.brighten colors.kat.orange.base.color 0.5)
                       :bg :SKIP
                       :ctermfg 11
                       :ctermbg :SKIP
                       :bold true}
                      {:group "@storageclass" :link "StorageClass"}
                      {:group "@attribute"
                       :fg (-> colors.kat.pink.base.color
                               (ucolors.blend colors.kat.green.base.color 0.7))
                       :bg :SKIP
                       :ctermfg 6
                       :cterbg :SKIP
                       :bold true}
                      {:group "@constant" :link :Constant}
                      {:group "@constant.builtin"
                       :fg (-> colors.kat.pink.base.color
                               (ucolors.blend colors.kat.blue.base.color 0.8)
                               (ucolors.darken 0.2))
                       :bg :SKIP
                       :ctermfg 12
                       :ctermbg :SKIP}
                      {:group "@constant.macro"
                       :fg (ucolors.blend colors.kat.pink.base.color
                                          colors.kat.bg.meld.color 0.2)
                       :bg :SKIP
                       :ctermfg 13
                       :ctermbg :SKIP}
                      {:group "@keyword" :link :Keyword}
                      {:group "@keyword.function"
                       :fg (-> colors.kat.red.base.color
                               (ucolors.blend colors.kat.green.base.color 0.2)
                               (ucolors.brighten 0.1))
                       :bg :SKIP
                       :ctermfg 2
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group "@keyword.return"
                       :fg (-> colors.kat.red.base.color
                               (ucolors.blend colors.kat.blue.base.color 0.1)
                               (ucolors.brighten 0.2))
                       :bg :SKIP
                       :ctermfg 12
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group "@keyword.operator"
                       :fg (-> colors.kat.red.base.color
                               (ucolors.blend colors.kat.fg.meld.color 0.1)
                               (ucolors.brighten 0.2))
                       :bg :SKIP
                       :ctermfg 1
                       :ctermbg :SKIP}
                      {:group "@punctuation.delimiter"
                       :fg (ucolors.blend colors.kat.pink.base.color
                                          colors.kat.purple.base.color 0.2)
                       :bg :SKIP
                       :ctermfg 14
                       :ctermbg :SKIP
                       :bold true}
                      {:group "@punctuation.bracket"
                       :fg (ucolors.blend colors.kat.pink.base.color
                                          colors.kat.bg.sixth.color 0.2)
                       :bg :SKIP
                       :ctermfg 6
                       :ctermbg :SKIP
                       :bold true}
                      {:group "@punctuation.special"
                       :fg (ucolors.blend colors.kat.pink.base.color
                                          colors.kat.plum.base.color 0.4)
                       :bg :SKIP
                       :ctermfg 13
                       :ctermbg :SKIP
                       :bold true}
                      {:group "@tag.delimiter"
                       :fg (-> colors.kat.pink.base.color
                               (ucolors.blend colors.kat.red.base.color 0.4)
                               (ucolors.darken 0.2))
                       :bg :SKIP
                       :ctermfg 9
                       :ctermbg :SKIP
                       :bold true}
                      {:group "@string" :link "String"}
                      {:group "@string.special"
                       :fg colors.kat.plum.match_fg.color
                       :bg :SKIP
                       :ctermfg 13
                       :ctermbg :SKIP}
                      {:group "@string.regex"
                       :fg colors.kat.green.mix_blue.color
                       :bg :SKIP
                       :ctermfg 4
                       :ctermbg :SKIP
                       :bold true}
                      {:group "@string.escape"
                       :fg colors.kat.green.mix_red.color
                       :bg :SKIP
                       :ctermfg 1
                       :ctermbg :SKIP
                       :bold true}
                      {:group "@character" :link :Character}
                      {:group "@character.special" :link :SpecialCharacter}
                      {:group "@symbol"
                       :fg colors.kat.green.mix_purple.color
                       :bg :SKIP
                       :ctermfg 6
                       :ctermbg :SKIP}
                      {:group "@text" :link :Normal}
                      {:group "@text.strong"
                       :fg colors.kat.fg.auto.color
                       :bg :SKIP
                       :ctermfg 7
                       :ctermbg :SKIP
                       :bold true}
                      {:group "@text.emphasis"
                       :fg colors.kat.fg.auto.color
                       :bg :SKIP
                       :ctermfg 7
                       :ctermbg :SKIP
                       :italic true}
                      {:group "@text.underline"
                       :fg colors.kat.fg.auto.color
                       :bg :SKIP
                       :ctermfg 7
                       :ctermbg :SKIP
                       :underline true}
                      {:group "@text.strike"
                       :fg colors.kat.fg.auto.color
                       :bg :SKIP
                       :ctermfg 7
                       :ctermbg :SKIP
                       :strikethrough true}
                      {:group "@text.literal"
                       :fg colors.kat.bg.meld.color
                       :bg :SKIP
                       :ctermfg 15
                       :ctermbg :SKIP
                       :italic true}
                      {:group "@text.reference"
                       :fg colors.kat.fg.umbra.color
                       :bg :SKIP
                       :ctermfg 15
                       :ctermbg :SKIP
                       :italic true}
                      {:group "@text.math"
                       :fg colors.kat.blue.base.color
                       :bg :SKIP
                       :ctermfg 4
                       :ctermbg :SKIP
                       :bold true}
                      {:group "@text.environment"
                       :fg colors.kat.fg.umbra.color
                       :bg :SKIP
                       :ctermfg 15
                       :ctermbg :SKIP}
                      {:group "@text.environment.name"
                       :fg colors.kat.green.auto.color
                       :bg :SKIP
                       :ctermfg 4
                       :ctermbg :SKIP
                       :bold true
                       :italic true}
                      {:group "@text.uri"
                       :fg colors.kat.orange.base.color
                       :bg :SKIP
                       :ctermfg 3
                       :ctermbg :SKIP
                       :underline true}
                      {:group "@text.todo" :link :Todo}
                      {:group "@text.note"
                       :fg colors.kat.bg.base.color
                       :bg colors.kat.green.auto.color
                       :ctermfg 0
                       :ctermbg 2}
                      {:group "@text.warning" :link :WarningMsg}
                      {:group "@text.danger"
                       :fg colors.kat.bg.base.color
                       :bg colors.kat.red.match_bg.color
                       :ctermfg 0
                       :ctermbg 3
                       :bold true}
                      {:group "@text.diff.add" :link :DiffAdd}
                      {:group "@text.diff.delete" :link :DiffDelete}
                      {:group "@tag" :link :Tag}
                      {:group "@tag.attribute"
                       :fg (-> colors.kat.red.base.color
                               (ucolors.blend colors.kat.green.base.color 0.7)
                               (ucolors.blend colors.kat.pink.base.color 0.7))
                       :bg :SKIP
                       :ctermfg 0
                       :ctermbg :SKIP
                       :bold true}
                      {:group "@tag.delimiter"
                       :fg (-> colors.kat.red.base.color
                               (ucolors.blend (-> colors.kat.bg.sixth.color
                                                  (ucolors.blend colors.kat.fg.base.color 0.8)
                                                  (ucolors.blend colors.kat.plum.base.color 0.8))
                                              0.3))
                       :bg :SKIP
                       :ctermfg 0
                       :ctermbg :SKIP
                       :bold true}])


(defn init [] (run.highlight$<-table (high-colors)))
