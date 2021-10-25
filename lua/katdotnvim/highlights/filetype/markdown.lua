local _2afile_2a = "fnl/katdotnvim/highlights/filetype/markdown.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.filetype.markdown"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("katdotnvim.aniseed.autoload")).autoload
local colors, groups, syntax, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local function init()
  ucolors.highlight("markdownItalic", "SKIP", "SKIP", "italic")
  ucolors.highlight("markdownBold", "SKIP", "SKIP", "bold")
  ucolors.highlight("markdownBoldItalic", "SKIP", "SKIP", "bold,italic")
  ucolors.highlight("markdownH1", ucolors.darken(colors.normalColors.blue, 0), "SKIP", "bold")
  ucolors.highlight("markdownH2", ucolors.darken(colors.normalColors.blue, 0.3), "SKIP", "bold")
  ucolors.highlight("markdownH3", ucolors.darken(colors.normalColors.orange, 0), "SKIP", "bold")
  ucolors.highlight("markdownH4", ucolors.darken(colors.normalColors.orange, 0.3), "SKIP", "bold")
  ucolors.highlight("markdownH5", ucolors.darken(colors.normalColors.pink, 0), "SKIP", "bold")
  ucolors.highlight("markdownH6", ucolors.darken(colors.normalColors.pink, 0.3), "SKIP", "bold")
  ucolors.highlight("markdownCode", groups.meldFG, groups.shadowBG)
  ucolors.highlight("markdownCode", groups.meldFG, groups.shadowBG)
  ucolors.highlight("markdownCodeDelimiter", groups.shadowBG, "SKIP")
  ucolors.highlight("markdownBlockqutoe", groups.umbraFG, "SKIP", "bold")
  ucolors.highlight("markdownListMarker", groups.fillBG, "SKIP", "bold")
  ucolors.highlight("markdownOrderedListMarker", groups.fillBG, "SKIP", "bold")
  ucolors.highlight("markdownRule", colors.normalColors.red, "SKIP")
  ucolors.highlight("markdownHeadingRule", colors.normalColors.red, "SKIP")
  ucolors.highlight("markdownUrlDelimiter", groups.meldBG, "SKIP", "bold")
  ucolors.highlight("markdownLinkDelimiter", groups.meldBG, "SKIP", "bold")
  ucolors.highlight("markdownLinkTextDelimiter", groups.meldBG, "SKIP", "bold")
  ucolors.highlight("markdownHeadingDelimiter", groups.infoBG, "SKIP", "bold")
  ucolors.highlight("markdownUrl", colors.normalColors.purple, "SKIP")
  ucolors.highlight("markdownUrlTitleDelimiter", groups.auxBG, "SKIP", "bold")
  ucolors.highlight("markdownLinkText", colors.foreground[3], "SKIP", "underline", colors.foreground[3])
  return ucolors.highlight("markdownIdDeclaration", colors.foreground[3], "SKIP", "underline", colors.foreground[3])
end
_2amodule_2a["init"] = init