(module katdotnvim.highlights.integrations.treesitter
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.color
                   groups katdotnvim.highlights.main
                   syntax katdotnvim.highlights.syntax}})

; this handles all tree-sitter highlight groups

(def stringColor (. (groups.auxBG) 1))

(defn init []

  (vim.cmd "hi def link TSVariable Variable")

  (ucolors.highlight :TSField
                     (ucolors.brighten (ucolors.blend  (. (syntax.identifier) 1)
                                                       (. (colors.init :normalColors) :purple)
                                                       0.2)
                                       0.2)
                     :SKIP
                     (. (groups.highlightBG) 2)
                     :SKIP
                     :bold)

  (vim.cmd "hi def link TSProperty TSField")

  (ucolors.highlight :TSFuncBuiltin
                     (ucolors.blend  (. (syntax.identifier) 1)
                                     (. (colors.init :normalColors) :red)
                                     0.3)
                     :SKIP
                     (. (groups.errorBG) 2)
                     :SKIP
                     :bold)

  (ucolors.highlight :TSFuncMacro
                     (ucolors.blend  (. (syntax.preproc) 1)
                                     (. (syntax.identifier) 1)
                                     0.2)
                     :SKIP
                     (. (groups.errorBG) 2)
                     :SKIP
                     "bold,italic")

  (ucolors.highlight :TSMethod
                     (ucolors.saturation (ucolors.brighten (ucolors.blend  (. (syntax.identifier) 1)
                                                                           (. (colors.init :normalColors) :red)
                                                                           0.3)
                                                           0.10)
                                         0.1)
                     :SKIP
                     (. (groups.errorBG) 2)
                     :SKIP
                     :bold)

  (ucolors.highlight :TSVariableBuiltin
                     (ucolors.darken (ucolors.blend  (. (syntax.identifier) 1)
                                                     (. (colors.init :foreground) 3)
                                                     0.8)
                                     0.2)
                     :SKIP
                     (. (groups.selectionBG) 2)
                     :SKIP
                     :bold)

  (if (= vim.g.kat_nvim_style :light)
      (do (ucolors.highlight :TSNamespace
                             (ucolors.darken (ucolors.blend  (. (syntax.identifier) 1)
                                                             (. (colors.init :normalColors) :green)
                                                             0.3)
                                             0.4)
                             :SKIP
                             (. (groups.auxBG) 2)
                             :SKIP))

      (do (ucolors.highlight :TSNamespace
                             (ucolors.brighten (ucolors.blend  (. (syntax.identifier) 1)
                                                               (. (colors.init :normalColors) :green)
                                                               0.3)
                                               0.2)
                             :SKIP
                             (. (groups.auxBG) 2)
                             :SKIP)))

  (vim.cmd "hi def link TSParameter Variable")

  (ucolors.highlight :TSParameterReference
                     (ucolors.brighten (ucolors.blend  (. (syntax.identifier) 1)
                                                       (. (colors.init :foreground) 3)
                                                       0.8)
                                       0.2)
                     :SKIP
                     (. (groups.umbraBG) 2)
                     :SKIP
                     :bold)

  (ucolors.highlight :TSAnnotation
                     (ucolors.blend  (. (syntax.preproc) 1)
                                     (. (groups.meldFG) 1)
                                     0.2)
                     :SKIP
                     (. (groups.highlightBG) 3)
                     :SKIP
                     :italic)

  (ucolors.highlight :TSNote
                     (. (groups.shadowFG) 1)
                     :SKIP
                     (. (groups.umbraBG) 2)
                     :SKIP)

  (ucolors.highlight :TSWarning
                     (. (groups.warningFG) 1)
                     (. (groups.warningBG) 1)
                     (. (groups.warningFG) 2)
                     (. (groups.warningBG) 2))

  (ucolors.highlight :TSDanger
                     (. (groups.warningFG) 1)
                     (ucolors.brighten (. (groups.errorBG) 1) 0.1)
                     (. (groups.warningFG) 2)
                     (. (groups.errorBG) 2)
                     :italic)

  (ucolors.highlight :TSConstructor
                     (ucolors.blend  (. (syntax.typeDef) 1)
                                     (. (colors.init :normalColors) :red)
                                     0.4)
                     :SKIP
                     (. (groups.infoBG) 2)
                     :SKIP)

  (ucolors.highlight :TSTypeBuiltin
                     (ucolors.darken (. (syntax.typeDef) 1) 0.5)
                     :SKIP
                     (. (groups.infoBG) 3)
                     :SKIP
                     :bold)

  (ucolors.highlight :TSConstBuiltin
                     (ucolors.darken (ucolors.blend  (. (groups.fillBG) 1)
                                                     (. (colors.init :normalColors) :blue)
                                                     0.8)
                                     0.2)
                     :SKIP
                     (. (groups.selectionBG) 3)
                     :SKIP)

  (ucolors.highlight :TSConstMacro
                     (ucolors.blend  (. (syntax.preproc) 1)
                                     (. (groups.meldBG) 1)
                                     0.2)
                     :SKIP
                     (. (groups.fillBG) 3)
                     :SKIP)

  (ucolors.highlight :TSKeywordFunction
                     (ucolors.brighten (ucolors.blend  (. (syntax.statement) 1)
                                                       (. (colors.init :normalColors) :green)
                                                       0.2)
                                       0.1)
                     :SKIP
                     (. (groups.auxBG) 2)
                     :SKIP
                     "bold,italic")

  (ucolors.highlight :TSKeywordReturn
                     (ucolors.brighten (ucolors.blend  (. (syntax.statement) 1)
                                                       (. (colors.init :normalColors) :blue)
                                                       0.1)
                                       0.2)
                     :SKIP
                     (. (groups.selectionBG) 3)
                     :SKIP
                     "bold,italic")

  (ucolors.highlight :TSKeywordOperator
                     (ucolors.brighten (ucolors.blend  (. (syntax.statement) 1)
                                                       (. (groups.meldFG) 1)
                                                       0.1)
                                       0.2)
                     :SKIP
                     (. (groups.errorBG) 2)
                     :SKIP)

  (ucolors.highlight :TSPunctDelimiter
                     (ucolors.blend  (. (syntax.preproc) 1)
                                     (. (colors.init :normalColors) :purple)
                                     0.2)
                     :SKIP
                     (. (groups.highlightBG) 3)
                     :SKIP
                     "bold")

  (ucolors.highlight :TSPunctBracket
                     (ucolors.blend  (. (syntax.preproc) 1)
                                     (. (colors.init :background) 6)
                                     0.2)
                     :SKIP
                     (. (groups.highlightBG) 2)
                     :SKIP
                     "bold")

  (ucolors.highlight :TSPunctSpecial
                     (ucolors.blend  (. (syntax.preproc) 1)
                                     (. (syntax.special) 1)
                                     0.4)
                     :SKIP
                     (. (groups.fillBG) 3)
                     :SKIP
                     "bold")

  (ucolors.highlight :TSTagDelimiter
                     (ucolors.darken (ucolors.blend  (. (syntax.preproc) 1)
                                                     (. (colors.init :normalColors) :red)
                                                     0.4)
                                     0.2)
                     :SKIP
                     (. (groups.warningBG) 2)
                     :SKIP
                     "bold")

  (ucolors.highlight :TSStringRegex
                     (ucolors.blend  stringColor
                                          (. (colors.init :normalColors) :blue)
                                          0.5)
                     :SKIP
                     (. (groups.selectionBG) 2)
                     :SKIP
                     :bold)

  (ucolors.highlight :TSStringEscape
                     (ucolors.blend  stringColor
                                          (. (colors.init :normalColors) :red)
                                          0.2)
                     :SKIP
                     (. (groups.errorBG) 2)
                     :SKIP
                     :bold)

  (ucolors.highlight :TSSymbol
                     (ucolors.saturation (ucolors.blend  stringColor
                                                              (. (colors.init :normalColors) :purple)
                                                              0.3)
                                         0.8)
                     :SKIP
                     (. (groups.highlightBG) 2)
                     :SKIP)

  (ucolors.highlight :TSTextReference
                     (. (groups.umbraFG) 1)
                     :SKIP
                     (. (groups.umbraFG) 2)
                     :SKIP
                     :italic)

  (ucolors.highlight :TSURI
                     (. (groups.infoBG) 1)
                     :SKIP
                     (. (groups.infoBG) 2)
                     :SKIP
                     :underline))
