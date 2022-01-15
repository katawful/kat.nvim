(module katdotnvim.highlights.filetype.markdown
        {autoload {ucolors katdotnvim.utils.color
                   colors katdotnvim.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main}})

(defn init []
  (ucolors.highlight :markdownItalic :SKIP :SKIP :italic)
  (ucolors.highlight :markdownBold :SKIP :SKIP :bold)
  (ucolors.highlight :markdownBoldItalic :SKIP :SKIP "bold,italic")

  (ucolors.highlight :markdownH1 (ucolors.darken (. (colors.init :normalColors) :blue) 0.0) :SKIP :bold)
  (ucolors.highlight :markdownH2 (ucolors.darken (. (colors.init :normalColors) :blue) 0.3) :SKIP :bold)
  (ucolors.highlight :markdownH3 (ucolors.darken (. (colors.init :normalColors) :orange) 0.0) :SKIP :bold)
  (ucolors.highlight :markdownH4 (ucolors.darken (. (colors.init :normalColors) :orange) 0.3) :SKIP :bold)
  (ucolors.highlight :markdownH5 (ucolors.darken (. (colors.init :normalColors) :pink) 0.0) :SKIP :bold)
  (ucolors.highlight :markdownH6 (ucolors.darken (. (colors.init :normalColors) :pink) 0.3) :SKIP :bold)

  (ucolors.highlight :markdownCode (groups.meldFG) (groups.shadowBG))
  (ucolors.highlight :markdownCode (groups.meldFG) (groups.shadowBG))
  (ucolors.highlight :markdownCodeDelimiter (groups.shadowBG) :SKIP)

  (ucolors.highlight :markdownBlockqutoe (groups.umbraFG) :SKIP :bold)
  (ucolors.highlight :markdownListMarker (groups.fillBG) :SKIP :bold)
  (ucolors.highlight :markdownOrderedListMarker (groups.fillBG) :SKIP :bold)
  (ucolors.highlight :markdownRule (. (colors.init :normalColors) :red) :SKIP)
  (ucolors.highlight :markdownHeadingRule (. (colors.init :normalColors) :red) :SKIP)

  (ucolors.highlight :markdownUrlDelimiter (groups.meldBG) :SKIP :bold)
  (ucolors.highlight :markdownLinkDelimiter (groups.meldBG) :SKIP :bold)
  (ucolors.highlight :markdownLinkTextDelimiter (groups.meldBG) :SKIP :bold)

  (ucolors.highlight :markdownHeadingDelimiter (groups.infoBG) :SKIP :bold)
  (ucolors.highlight :markdownUrl (. (colors.init :normalColors) :purple) :SKIP)
  (ucolors.highlight :markdownUrlTitleDelimiter (groups.auxBG) :SKIP :bold)

  (ucolors.highlight :markdownLinkText (. (colors.init :foreground) 3) :SKIP :underline (. (colors.init :foreground) 3))
  (ucolors.highlight :markdownIdDeclaration (. (colors.init :foreground) 3) :SKIP :underline (. (colors.init :foreground) 3)))
