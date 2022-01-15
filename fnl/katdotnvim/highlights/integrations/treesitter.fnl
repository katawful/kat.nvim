(module katdotnvim.highlights.integrations.treesitter
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.color
                   groups katdotnvim.highlights.main
                   syntax katdotnvim.highlights.syntax}})

; this handles all tree-sitter highlight groups

(def stringColor (groups.auxBG))

(defn init []
  (vim.cmd "hi def link TSVariable Variable")
  (ucolors.highlight :TSField (ucolors.brighten (ucolors.blendColors (syntax.identifier) (. (colors.init :normalColors) :purple) 0.2) 0.2) :SKIP :bold)
  (vim.cmd "hi def link TSProperty TSField")
  (ucolors.highlight :TSFuncBuiltin (ucolors.blendColors (syntax.identifier) (. (colors.init :normalColors) :red) 0.3) :SKIP :bold)
  (ucolors.highlight :TSFuncMacro (ucolors.blendColors (syntax.preproc) (syntax.identifier) 0.2) :SKIP "bold,italic")
  (ucolors.highlight :TSMethod (ucolors.saturation (ucolors.brighten (ucolors.blendColors (syntax.identifier) (. (colors.init :normalColors) :red) 0.3) 0.10) 0.1) :SKIP :bold)
  (ucolors.highlight :TSVariableBuiltin (ucolors.darken (ucolors.blendColors (syntax.identifier) (. (colors.init :foreground) 3) 0.8) 0.2) :SKIP)
  (if (= vim.g.kat_nvim_style :light)
      (do (ucolors.highlight :TSNamespace (ucolors.darken (ucolors.blendColors (syntax.identifier) (. (colors.init :normalColors) :green) 0.3) 0.4) :SKIP))
      (do (ucolors.highlight :TSNamespace (ucolors.brighten (ucolors.blendColors (syntax.identifier) (. (colors.init :normalColors) :green) 0.3) 0.2) :SKIP)))

  (vim.cmd "hi def link TSParameter Variable")
  (ucolors.highlight :TSParameterReference (ucolors.brighten (ucolors.blendColors (syntax.identifier) (. (colors.init :foreground) 3) 0.8) 0.2) :SKIP :bold)

  (ucolors.highlight :TSAnnotation (ucolors.blendColors (syntax.preproc) (groups.meldFG) 0.2) :SKIP :italic)

  (ucolors.highlight :TSNote (groups.shadowFG) :SKIP)

  (ucolors.highlight :TSWarning (groups.warningFG) (groups.warningBG))
  (ucolors.highlight :TSDanger (groups.warningFG) (ucolors.brighten (groups.errorBG) 0.1) :italic)

  (ucolors.highlight :TSConstructor (ucolors.blendColors (syntax.typeDef) (. (colors.init :normalColors) :red) 0.4) :SKIP)
  (ucolors.highlight :TSTypeBuiltin (ucolors.darken (syntax.typeDef) 0.5) :SKIP :bold)

  (ucolors.highlight :TSConstBuiltin (ucolors.darken (ucolors.blendColors (groups.fillBG) (. (colors.init :normalColors) :blue) 0.8) 0.2) :SKIP)
  (ucolors.highlight :TSConstMacro (ucolors.blendColors (syntax.preproc) (groups.meldBG) 0.2) :SKIP)

  (ucolors.highlight :TSKeywordFunction (ucolors.brighten (ucolors.blendColors (syntax.statement) (. (colors.init :normalColors) :green) 0.2) 0.1) :SKIP "bold,italic")
  (ucolors.highlight :TSKeywordReturn (ucolors.brighten (ucolors.blendColors (syntax.statement) (. (colors.init :normalColors) :blue) 0.1) 0.2) :SKIP "bold,italic")
  (ucolors.highlight :TSKeywordOperator (ucolors.brighten (ucolors.blendColors (syntax.statement) (groups.meldFG) 0.1) 0.2) :SKIP)

  (ucolors.highlight :TSPunctDelimiter (ucolors.blendColors (syntax.preproc) (. (colors.init :normalColors) :purple) 0.2) :SKIP "bold")
  (ucolors.highlight :TSPunctBracket (ucolors.blendColors (syntax.preproc) (. (colors.init :background) 6) 0.2) :SKIP "bold")
  (ucolors.highlight :TSPunctSpecial (ucolors.blendColors (syntax.preproc) (syntax.special) 0.4) :SKIP "bold")
  (ucolors.highlight :TSTagDelimiter (ucolors.darken (ucolors.blendColors (syntax.preproc) (. (colors.init :normalColors) :red) 0.4) 0.2) :SKIP "bold")

  (ucolors.highlight :TSStringRegex (ucolors.blendColors stringColor (. (colors.init :normalColors) :blue) 0.5) :SKIP :bold)
  (ucolors.highlight :TSStringEscape (ucolors.blendColors stringColor (. (colors.init :normalColors) :red) 0.2) :SKIP :bold)
  (ucolors.highlight :TSSymbol (ucolors.saturation (ucolors.blendColors stringColor (. (colors.init :normalColors) :purple) 0.3) 0.8) :SKIP)
  (ucolors.highlight :TSTextReference (groups.umbraFG) :SKIP :italic)

  (ucolors.highlight :TSURI (groups.infoBG) :SKIP :underline))
