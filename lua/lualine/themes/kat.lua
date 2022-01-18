local _2afile_2a = "fnl/lualine/themes/kat.fnl"
local _2amodule_name_2a = "lualine.themes.kat"
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
local colors, groups, main, syntax, ucolors, _ = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.main"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.color"), nil
_2amodule_locals_2a["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
_2amodule_locals_2a["_"] = _
local kat = {}
local mainFG = groups.mainFG()
if ((vim.o.background == "dark") and (main.katContrast == "soft")) then
  mainFG = ucolors.brighten(groups.mainFG(), 0.8)
else
end
kat.normal = {a = {bg = groups.highlightBG(), fg = mainFG, gui = "bold"}, b = {bg = ucolors.blendColors(groups.selectionBG(), groups.shadowBG(), 0.4), fg = mainFG}, c = {bg = groups.fillBG(), fg = mainFG}}
kat.insert = {a = {bg = groups.selectionBG(), fg = mainFG, gui = "bold"}, b = {bg = ucolors.blendColors(groups.selectionBG(), groups.shadowBG(), 0.4), fg = mainFG}, c = {bg = ucolors.brighten(groups.selectionBG(), 0.2), fg = mainFG}}
kat.visual = {a = {bg = groups.errorBG(), fg = mainFG, gui = "bold"}, b = {bg = ucolors.blendColors(groups.selectionBG(), groups.shadowBG(), 0.4), fg = mainFG}, c = {bg = groups.highlightBG(), fg = mainFG}}
kat.replace = {a = {bg = groups.infoBG(), fg = mainFG, gui = "bold"}, b = {bg = ucolors.blendColors(groups.selectionBG(), groups.shadowBG(), 0.4), fg = mainFG}, c = {bg = ucolors.brighten(groups.selectionBG(), 0.2), fg = mainFG}}
kat.command = {a = {bg = ucolors.blendColors((colors.init("normalColors")).green, groups.mainBG(), 0.5), fg = mainFG, gui = "bold"}, b = {bg = ucolors.blendColors(groups.selectionBG(), groups.shadowBG(), 0.4), fg = mainFG}, c = {bg = ucolors.blendColors((colors.init("normalColors")).green, groups.mainBG(), 0.7), fg = mainFG}}
kat.terminal = {a = {bg = ucolors.blendColors(groups.fillBG(), groups.mainBG(), 0.8), fg = mainFG, gui = "bold"}, b = {bg = ucolors.blendColors(groups.selectionBG(), groups.shadowBG(), 0.4), fg = mainFG}, c = {bg = ucolors.blendColors(groups.errorBG(), groups.mainBG(), 0.8), fg = mainFG}}
kat.inactive = {a = {bg = (colors.init("foreground"))[6], fg = (colors.init("background"))[1]}, b = {bg = (colors.init("foreground"))[6], fg = (colors.init("background"))[1]}, c = {bg = (colors.init("foreground"))[3], fg = (colors.init("background"))[1]}}
return kat