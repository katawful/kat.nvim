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
local autoload = (require("aniseed.autoload")).autoload
local colors, groups, syntax, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local function init()
  ucolors["highlight$"]("markdownItalic", "SKIP", "SKIP", "SKIP", "SKIP", "italic")
  ucolors["highlight$"]("markdownBold", "SKIP", "SKIP", "SKIP", "SKIP", "bold")
  ucolors["highlight$"]("markdownBoldItalic", "SKIP", "SKIP", "SKIP", "SKIP", "bold,italic")
  ucolors["highlight$"]("markdownH1", ucolors.darken((colors.init("normalColors")).blue, 0), "SKIP", 4, "SKIP", "bold")
  ucolors["highlight$"]("markdownH2", ucolors.darken((colors.init("normalColors")).blue, 0.3), "SKIP", 12, "SKIP", "bold")
  ucolors["highlight$"]("markdownH3", ucolors.darken((colors.init("normalColors")).orange, 0), "SKIP", 3, "SKIP", "bold")
  ucolors["highlight$"]("markdownH4", ucolors.darken((colors.init("normalColors")).orange, 0.3), "SKIP", 11, "SKIP", "bold")
  ucolors["highlight$"]("markdownH5", ucolors.darken((colors.init("normalColors")).pink, 0), "SKIP", 5, "SKIP", "bold")
  ucolors["highlight$"]("markdownH6", ucolors.darken((colors.init("normalColors")).pink, 0.3), "SKIP", 13, "SKIP", "bold")
  ucolors["highlight$"]("markdownCode", groups.meldFG()[1], groups.shadowBG()[1], groups.umbraFG()[2], groups.umbraBG()[2])
  ucolors["highlight$"]("markdownCodeDelimiter", groups.shadowBG()[1], "SKIP", groups.umbraBG()[2], "SKIP")
  ucolors["highlight$"]("markdownBlockqutoe", groups.umbraFG()[1], "SKIP", groups.umbraFG()[2], "SKIP", "bold")
  ucolors["highlight$"]("markdownListMarker", groups.fillBG()[1], "SKIP", groups.fillBG()[2], "SKIP", "bold")
  ucolors["highlight$"]("markdownOrderedListMarker", groups.fillBG()[1], "SKIP", groups.fillBG()[2], "SKIP", "bold")
  ucolors["highlight$"]("markdownRule", groups.errorBG()[1], "SKIP", groups.errorBG()[2], "SKIP")
  ucolors["highlight$"]("markdownHeadingRule", groups.errorBG()[1], "SKIP", groups.errorBG()[2], "SKIP")
  ucolors["highlight$"]("markdownUrlDelimiter", groups.meldBG()[1], "SKIP", groups.umbraFG()[2], "SKIP", "bold")
  ucolors["highlight$"]("markdownLinkDelimiter", groups.meldBG()[1], "SKIP", groups.umbraFG()[2], "SKIP", "bold")
  ucolors["highlight$"]("markdownLinkTextDelimiter", groups.meldBG()[1], "SKIP", groups.umbraFG()[2], "SKIP", "bold")
  ucolors["highlight$"]("markdownHeadingDelimiter", groups.infoBG()[1], "SKIP", groups.infoBG()[2], "SKIP", "bold")
  ucolors["highlight$"]("markdownUrl", groups.highlightBG()[1], "SKIP", groups.highlightBG()[2], "SKIP")
  ucolors["highlight$"]("markdownUrlTitleDelimiter", groups.auxBG()[1], "SKIP", groups.auxBG()[2], "SKIP", "bold")
  ucolors["highlight$"]("markdownLinkText", groups.shadowFG()[1], "SKIP", groups.umbraFG()[2], "SKIP", "underline", (colors.init("foreground"))[3])
  return ucolors["highlight$"]("markdownIdDeclaration", groups.shadowFG()[1], "SKIP", groups.umbraFG()[2], "SKIP", "underline", (colors.init("foreground"))[3])
end
_2amodule_2a["init"] = init
return _2amodule_2a