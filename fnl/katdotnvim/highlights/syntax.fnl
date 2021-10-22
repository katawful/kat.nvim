(module katdotnvim.highlights.syntax
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.color
                   groups katdotnvim.highlights.main
                   }})

; this function handles NeoVim syntax

(def identifier (. colors.background 6))
(def statement (. colors.normalColors :red))
(def preproc (. colors.normalColors :pink))
(def typeDef (. colors.normalColors :orange))
(def special (ucolors.blendColors (. colors.normalColors :pink) (. colors.normalColors :purple) 0.65))

(defn init []
  (ucolors.highlight :Comment groups.meldBG :SKIP (. vim.g.kat_nvim_commentStyle))

  (ucolors.highlight :Constant groups.fillBG :SKIP)

  (ucolors.highlight :String groups.auxBG :SKIP)
  (ucolors.highlight :Character (ucolors.blendColors groups.auxBG groups.mainFG 0.5) :SKIP :bold)

  (ucolors.highlight :Number groups.fillBG :SKIP)
  (ucolors.highlight :Float (ucolors.blendColors groups.fillBG groups.mainFG 0.7) :SKIP)

  (ucolors.highlight :Boolean (ucolors.blendColors groups.selectionBG groups.mainFG 0.7) :SKIP :bold)

  (ucolors.highlight :Identifier identifier :SKIP)
  (ucolors.highlight :Function (ucolors.saturation (ucolors.brighten (ucolors.blendColors identifier (. colors.normalColors :red) 0.3) 0.10) 0.5) :SKIP :bold)
  (if (= vim.g.kat_nvim_style :light)
      (ucolors.highlight :Variable (ucolors.darken (ucolors.blendColors identifier (. colors.foreground 6) 0.5) 0.4) :SKIP)
      (ucolors.highlight :Variable (ucolors.brighten (ucolors.blendColors identifier (. colors.foreground 6) 0.5) 0.4) :SKIP))

  (ucolors.highlight :Statement statement :SKIP :bold)
  (ucolors.highlight :Conditional (ucolors.brighten (ucolors.blendColors statement (. colors.normalColors :purple) 0.2) 0.1) :SKIP)
  (ucolors.highlight :Repeat (ucolors.saturation (ucolors.brighten (ucolors.blendColors statement (. colors.normalColors :orange) 0.2) 0.3) 0.8) :SKIP)
  (ucolors.highlight :Label (ucolors.saturation (ucolors.blendColors statement (. colors.normalColors :pink) 0.2) 1) :SKIP :bold)
  (ucolors.highlight :Operator (ucolors.blendColors statement groups.meldFG 0.2) :SKIP :bold)
  (if (= vim.g.kat_nvim_style :light)
      (do
        (ucolors.highlight :Keyword (ucolors.darken (ucolors.blendColors statement (. colors.normalColors :green) 0.2) 0.5) :SKIP :italic))
      (do
        (ucolors.highlight :Keyword (ucolors.brighten (ucolors.blendColors statement (. colors.normalColors :green) 0.2) 0.5) :SKIP :italic)))
  (ucolors.highlight :Exception (ucolors.brighten (ucolors.blendColors statement (. colors.normalColors :blue) 0.1) 0.2) :SKIP)

  (ucolors.highlight :PreProc preproc :SKIP "bold,italic")
  (ucolors.highlight :Include (ucolors.blendColors preproc (. colors.normalColors :red) 0.2) :SKIP "bold,italic")
  (ucolors.highlight :Define (ucolors.blendColors preproc (. colors.normalColors :purple) 0.2) :SKIP "bold,italic")
  (ucolors.highlight :Macro (ucolors.blendColors preproc (. colors.normalColors :blue) 0.2) :SKIP "bold,italic")
  (ucolors.highlight :PreCondit (ucolors.blendColors preproc (. colors.normalColors :green) 0.2) :SKIP "bold,italic")

  (ucolors.highlight :Type typeDef :SKIP :bold)
  (ucolors.highlight :StorageClass (ucolors.blendColors typeDef (. colors.normalColors :green) 0.2) :SKIP :bold)
  (ucolors.highlight :Structure (ucolors.blendColors typeDef (. colors.normalColors :blue) 0.2) :SKIP :bold)
  (ucolors.highlight :Typedef (ucolors.saturation (ucolors.blendColors typeDef (. colors.background 6) 0.2) 1) :SKIP :bold)

  (ucolors.highlight :Special special :SKIP)
  (ucolors.highlight :SpecialChar (ucolors.blendColors special (. colors.foreground 1) 0.8) :SKIP :bold)
  (ucolors.highlight :Tag (ucolors.blendColors special (. colors.normalColors :red) 0.2) :SKIP :bold)
  (ucolors.highlight :Delimiter (ucolors.blendColors special (ucolors.blendColors (. colors.background 6) groups.mainFG 0.8) 0.2) :SKIP :bold)
  (ucolors.highlight :SpecialComment (ucolors.blendColors special groups.meldBG 0.2) :SKIP (. vim.g.kat_nvim_commentStyle))
  (ucolors.highlight :Debug (ucolors.blendColors special (. colors.normalColors :green) 0.2) :SKIP :bold)

  (ucolors.highlight :Underlined (. colors.background 6) :underline (. colors.background 6))
  (ucolors.highlight :Error groups.errorFG groups.errorBG :bold)
  (ucolors.highlight :Todo groups.infoFG (ucolors.blendColors groups.infoBG (. colors.foreground 1) 0.9))
  (ucolors.highlight :Ignore groups.meldFG :SKIP)

  (ucolors.highlight :DiffDelete groups.mainFG (ucolors.darken (. colors.normalColors :red) 0.2) :bold)
  (ucolors.highlight :DiffAdd :SKIP (. colors.normalColors :green) :bold)
  (ucolors.highlight :DiffChange :SKIP (. colors.normalColors :purple) :bold)
  (ucolors.highlight :DiffText :SKIP (. colors.normalColors :blue) :bold))
