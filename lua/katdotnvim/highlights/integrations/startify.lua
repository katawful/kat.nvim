local _2afile_2a = "fnl/katdotnvim/highlights/integrations/startify.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.integrations.startify"
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
local colors, groups, run, syntax, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.utils.highlight.run"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["run"] = run
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local function high_colors()
  return {{group = "StartifyBracket", fg = ucolors.blend(groups.selectionBG()[1], groups.meldBG()[1], 0.5), bg = "SKIP", ctermfg = groups.selectionBG()[2], ctermbg = "SKIP", bold = true}, {group = "StartifyFile", fg = ucolors.blend(groups.highlightBG()[1], groups.mainFG()[1], 0.8), bg = "SKIP", ctermfg = groups.highlightBG()[2], ctermbg = "SKIP", bold = true}, {group = "StartifyNumber", fg = groups.selectionBG()[1], bg = "SKIP", ctermfg = groups.selectionBG()[2], ctermbg = "SKIP", bold = true}, {group = "StartifyPath", fg = colors.background()[6], bg = "SKIP", ctermfg = groups.selectionBG()[2], ctermbg = "SKIP"}, {group = "StartifySlash", fg = colors.foreground()[4], bg = "SKIP", ctermfg = groups.mainFG()[2], ctermbg = "SKIP"}, {group = "StartifySection", fg = ucolors.blend((colors["normal-colors"]()).red, groups.mainFG()[1], 0.8), bg = "SKIP", ctermfg = groups.warningBG()[2], ctermbg = "SKIP", bold = true}, {group = "StartifySpecial", fg = colors.background()[6], bg = "SKIP", ctermfg = groups.selectionBG()[3], ctermbg = "SKIP"}, {group = "StartifyHeader", fg = groups.fillBG()[1], bg = "SKIP", ctermfg = groups.fillBG()[2], ctermbg = "SKIP"}, {group = "StartifyFooter", fg = colors.background()[4], bg = "SKIP", ctermfg = groups.selectionBG()[2], ctermbg = "SKIP"}}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a