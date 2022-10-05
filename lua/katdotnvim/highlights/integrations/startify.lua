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
  return {{group = "StartifyBracket", fg = ucolors.blend(colors.kat.blue.base.color, colors.kat.bg.meld.color, 0.5), bg = "SKIP", ctermfg = groups.selectionBG()[2], ctermbg = "SKIP", bold = true}, {group = "StartifyFile", fg = ucolors.blend(colors.kat.purple.base.color, colors.kat.fg.auto.color, 0.8), bg = "SKIP", ctermfg = groups.highlightBG()[2], ctermbg = "SKIP", bold = true}, {group = "StartifyNumber", fg = colors.kat.blue.base.color, bg = "SKIP", ctermfg = groups.selectionBG()[2], ctermbg = "SKIP", bold = true}, {group = "StartifyPath", fg = colors.kat.bg.sixth.color, bg = "SKIP", ctermfg = groups.selectionBG()[2], ctermbg = "SKIP"}, {group = "StartifySlash", fg = colors.kat.fg.meld.color, bg = "SKIP", ctermfg = groups.mainFG()[2], ctermbg = "SKIP"}, {group = "StartifySection", fg = ucolors.blend(colors.kat.red.base.color, colors.kat.fg.auto.color, 0.8), bg = "SKIP", ctermfg = groups.warningBG()[2], ctermbg = "SKIP", bold = true}, {group = "StartifySpecial", fg = colors.kat.bg.sixth.color, bg = "SKIP", ctermfg = groups.selectionBG()[3], ctermbg = "SKIP"}, {group = "StartifyHeader", fg = colors.kat.pink.base.color, bg = "SKIP", ctermfg = groups.fillBG()[2], ctermbg = "SKIP"}, {group = "StartifyFooter", fg = colors.kat.bg.meld.color, bg = "SKIP", ctermfg = groups.selectionBG()[2], ctermbg = "SKIP"}}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a