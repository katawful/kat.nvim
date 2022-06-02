local _2afile_2a = "fnl/lualine/themes/kat.fnl"
local ucolors = require("katdotnvim.utils.highlight.utils")
local colors = require("katdotnvim.color")
local syntax = require("katdotnvim.highlights.syntax")
local groups = require("katdotnvim.highlights.main")
local main = require("katdotnvim.main")
local mainFG = groups.mainFG()[1]
if ((vim.o.background == "dark") and (main.contrast == "soft")) then
  mainFG = ucolors.brighten(groups.mainFG()[1], 0.8)
else
end
local kat = {}
if (vim.o.termguicolors == true) then
  kat["normal"] = {a = {bg = groups.highlightBG()[1], fg = mainFG, gui = "bold"}, b = {bg = ucolors.blend(groups.selectionBG()[1], groups.shadowBG()[1], 0.4), fg = mainFG}, c = {bg = groups.fillBG()[1], fg = mainFG}}
  kat["insert"] = {a = {bg = groups.selectionBG()[1], fg = mainFG, gui = "bold"}, b = {bg = ucolors.blend(groups.selectionBG()[1], groups.shadowBG()[1], 0.4), fg = mainFG}, c = {bg = ucolors.brighten(groups.selectionBG()[1], 0.2), fg = mainFG}}
  kat["visual"] = {a = {bg = groups.errorBG()[1], fg = mainFG, gui = "bold"}, b = {bg = ucolors.blend(groups.selectionBG()[1], groups.shadowBG()[1], 0.4), fg = mainFG}, c = {bg = groups.highlightBG()[1], fg = mainFG}}
  kat["replace"] = {a = {bg = groups.infoBG()[1], fg = mainFG, gui = "bold"}, b = {bg = ucolors.blend(groups.selectionBG()[1], groups.shadowBG()[1], 0.4), fg = mainFG}, c = {bg = ucolors.brighten(groups.selectionBG()[1], 0.2), fg = mainFG}}
  kat["command"] = {a = {bg = ucolors.blend((colors["normal-colors"]()).green, groups.mainBG()[1], 0.5), fg = mainFG, gui = "bold"}, b = {bg = ucolors.blend(groups.selectionBG()[1], groups.shadowBG()[1], 0.4), fg = mainFG}, c = {bg = ucolors.blend((colors["normal-colors"]()).green, groups.mainBG()[1], 0.7), fg = mainFG}}
  kat["terminal"] = {a = {bg = ucolors.blend(groups.fillBG()[1], groups.mainBG()[1], 0.8), fg = mainFG, gui = "bold"}, b = {bg = ucolors.blend(groups.selectionBG()[1], groups.shadowBG()[1], 0.4), fg = mainFG}, c = {bg = ucolors.blend(groups.errorBG()[1], groups.mainBG()[1], 0.8), fg = mainFG}}
  kat["inactive"] = {a = {bg = colors.foreground()[6], fg = colors.background()[1]}, b = {bg = colors.foreground()[6], fg = colors.background()[1]}, c = {bg = colors.foreground()[3], fg = colors.background()[1]}}
else
  kat["normal"] = {a = {bg = groups.highlightBG()[2], fg = mainFG, gui = "bold"}, b = {bg = groups.selectionBG()[3], fg = mainFG}, c = {bg = groups.fillBG()[2], fg = mainFG}}
  kat["insert"] = {a = {bg = groups.selectionBG()[2], fg = mainFG, gui = "bold"}, b = {bg = groups.selectionBG()[3], fg = mainFG}, c = {bg = groups.selectionBG()[2], fg = mainFG}}
  kat["visual"] = {a = {bg = groups.errorBG()[2], fg = mainFG, gui = "bold"}, b = {bg = groups.selectionBG()[3], fg = mainFG}, c = {bg = groups.highlightBG()[2], fg = mainFG}}
  kat["replace"] = {a = {bg = groups.infoBG()[2], fg = mainFG, gui = "bold"}, b = {bg = groups.selectionBG()[2], fg = mainFG}, c = {bg = groups.selectionBG()[2], fg = mainFG}}
  kat["command"] = {a = {bg = groups.auxBG()[2], fg = mainFG, gui = "bold"}, b = {bg = groups.selectionBG()[3], fg = mainFG}, c = {bg = groups.auxBG()[3], fg = mainFG}}
  kat["terminal"] = {a = {bg = groups.fillBG()[3], fg = mainFG, gui = "bold"}, b = {bg = groups.selectionBG()[3], fg = mainFG}, c = {bg = groups.warningBG()[2], fg = mainFG}}
  kat["inactive"] = {a = {bg = groups.umbraFG()[2], fg = groups.mainBG()[1]}, b = {bg = groups.umbraFG()[2], fg = groups.mainBG()[2]}, c = {bg = groups.umbraFG()[2], fg = groups.mainBG()[2]}}
end
return kat