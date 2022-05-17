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
local colors, groups, run, syntax, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.utils.highlight.run"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["run"] = run
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local function high_colors()
  return {{group = "markdownItalic", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "SKIP", italic = true}, {group = "markdownBold", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "SKIP", bold = true}, {group = "markdownBoldItalic", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "SKIP", bold = true, italic = true}, {group = "markdownH1", fg = ucolors.darken((colors.init("normalColors")).blue, 0), bg = "SKIP", ctermfg = 4, ctermbg = "SKIP", bold = true}, {group = "markdownH2", fg = ucolors.darken((colors.init("normalColors")).blue, 0.3), bg = "SKIP", ctermfg = 12, ctermbg = "SKIP", bold = true}, {group = "markdownH3", fg = ucolors.darken((colors.init("normalColors")).orange, 0), bg = "SKIP", ctermfg = 3, ctermbg = "SKIP", bold = true}, {group = "markdownH4", fg = ucolors.darken((colors.init("normalColors")).orange, 0.3), bg = "SKIP", ctermfg = 11, ctermbg = "SKIP", bold = true}, {group = "markdownH5", fg = ucolors.darken((colors.init("normalColors")).pink, 0), bg = "SKIP", ctermfg = 5, ctermbg = "SKIP", bold = true}, {group = "markdownH6", fg = ucolors.darken((colors.init("normalColors")).pink, 0.3), bg = "SKIP", ctermfg = 13, ctermbg = "SKIP", bold = true}, {group = "markdownCode", fg = groups.meldFG()[1], bg = groups.shadowBG()[1], ctermfg = groups.umbraFG()[2], ctermbg = groups.umbraBG()[2]}, {group = "markdownCodeDelimiter", fg = groups.shadowBG()[1], bg = "SKIP", ctermfg = groups.umbraBG()[2], ctermbg = "SKIP"}, {group = "markdownBlockqutoe", fg = groups.umbraFG()[1], bg = "SKIP", ctermfg = groups.umbraFG()[2], ctermbg = "SKIP", bold = true}, {group = "markdownListMarker", fg = groups.fillBG()[1], bg = "SKIP", ctermfg = groups.fillBG()[2], ctermbg = "SKIP", bold = true}, {group = "markdownOrderedListMarker", fg = groups.fillBG()[1], bg = "SKIP", ctermfg = groups.fillBG()[2], ctermbg = "SKIP", bold = true}, {group = "markdownRule", fg = groups.errorBG()[1], bg = "SKIP", ctermfg = groups.errorBG()[2], ctermbg = "SKIP"}, {group = "markdownHeadingRule", fg = groups.errorBG()[1], bg = "SKIP", ctermfg = groups.errorBG()[2], ctermbg = "SKIP"}, {group = "markdownUrlDelimiter", fg = groups.meldBG()[1], bg = "SKIP", ctermfg = groups.umbraFG()[2], ctermbg = "SKIP", bold = true}, {group = "markdownLinkDelimiter", fg = groups.meldBG()[1], bg = "SKIP", ctermfg = groups.umbraFG()[2], ctermbg = "SKIP", bold = true}, {group = "markdownLinkTextDelimiter", fg = groups.meldBG()[1], bg = "SKIP", ctermfg = groups.umbraFG()[2], ctermbg = "SKIP", bold = true}, {group = "markdownHeadingDelimiter", fg = groups.infoBG()[1], bg = "SKIP", ctermfg = groups.infoBG()[2], ctermbg = "SKIP", bold = true}, {group = "markdownUrl", fg = groups.highlightBG()[1], bg = "SKIP", ctermfg = groups.highlightBG()[2], ctermbg = "SKIP"}, {group = "markdownUrlTitleDelimiter", fg = groups.auxBG()[1], bg = "SKIP", ctermfg = groups.auxBG()[2], ctermbg = "SKIP", bold = true}, {group = "markdownLinkText", fg = groups.shadowFG()[1], bg = "SKIP", ctermfg = groups.umbraFG()[2], ctermbg = "SKIP", underline = true, sp = (colors.init("foreground"))[3]}, {group = "markdownIdDeclaration", fg = groups.shadowFG()[1], bg = "SKIP", ctermfg = groups.umbraFG()[2], ctermbg = "SKIP", underline = true, sp = (colors.init("foreground"))[3]}}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a