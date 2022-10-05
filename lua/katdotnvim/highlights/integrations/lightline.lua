local _2afile_2a = "fnl/katdotnvim/highlights/integrations/lightline.fnl"
local ucolors = require("katdotnvim.utils.highlight.utils")
local colors = require("katdotnvim.color")
local syntax = require("katdotnvim.highlights.syntax")
local groups = require("katdotnvim.highlights.main")
local main = require("katdotnvim.main")
local mainFG = colors.kat.fg.auto.color
if (((main["background-mut"])[1] == "dark") and ((main["contrast-mut"])[1] == "soft")) then
  mainFG[1] = ucolors.brighten(colors.kat.fg.auto.color, 0.8)
else
end
local function mainFG0()
  local output = colors.kat.fg.auto.color
  if (((main["background-mut"])[1] == "dark") and ((main["contrast-mut"])[1] == "soft")) then
    output = ucolors.brighten(colors.kat.fg.auto.color, 0.8)
  else
  end
  return output
end
local function normalMode_c()
  local output = {colors.kat.fg.auto.color, colors.kat.pink.base.color, (mainFG0())[2], groups.fillBG()[2], ""}
  return output
end
local function normalMode_b()
  local output = {colors.kat.fg.auto.color, ucolors.blend(colors.kat.blue.base.color, colors.kat.bg.shadow.color, 0.4), (mainFG0())[2], groups.selectionBG()[3], ""}
  return output
end
local function normalMode_a()
  local output = {colors.kat.fg.auto.color, colors.kat.purple.base.color, (mainFG0())[2], groups.highlightBG()[2], "bold"}
  return output
end
local function replaceMode_c()
  local output = {colors.kat.fg.auto.color, ucolors.brighten(colors.kat.blue.base.color, 0.2), (mainFG0())[2], groups.selectionBG()[2], ""}
  return output
end
local function replaceMode_b()
  local output = {colors.kat.fg.auto.color, ucolors.blend(colors.kat.blue.base.color, colors.kat.bg.shadow.color, 0.4), (mainFG0())[2], groups.selectionBG()[3], ""}
  return output
end
local function replaceMode_a()
  local output = {colors.kat.fg.auto.color, colors.kat.orange.base.color, (mainFG0())[2], groups.infoBG()[2], "bold"}
  return output
end
local function visualMode_c()
  local output = {colors.kat.fg.auto.color, colors.kat.purple.base.color, (mainFG0())[2], groups.highlightBG()[2], ""}
  return output
end
local function visualMode_b()
  local output = {colors.kat.fg.auto.color, ucolors.blend(colors.kat.blue.base.color, colors.kat.bg.shadow.color, 0.4), (mainFG0())[2], groups.selectionBG()[3], ""}
  return output
end
local function visualMode_a()
  local output = {colors.kat.fg.auto.color, colors.kat.red.base.color, (mainFG0())[2], colors.kat.red.base.color, "bold"}
  return output
end
local function insertMode_c()
  local output = {colors.kat.fg.auto.color, ucolors.brighten(colors.kat.blue.base.color, 0.2), (mainFG0())[2], groups.selectionBG()[2], ""}
  return output
end
local function insertMode_b()
  local output = {colors.kat.fg.auto.color, ucolors.blend(colors.kat.blue.base.color, colors.kat.bg.shadow.color, 0.4), (mainFG0())[2], groups.selectionBG()[3], ""}
  return output
end
local function insertMode_a()
  local output = {colors.kat.fg.auto.color, colors.kat.blue.base.color, (mainFG0())[2], groups.selectionBG()[2], "bold"}
  return output
end
local function terminalMode_c()
  local output = {colors.kat.fg.auto.color, ucolors.blend(colors.kat.red.base.color, colors.kat.bg.base.color, 0.8), (mainFG0())[2], groups.warningBG()[2], ""}
  return output
end
local function terminalMode_b()
  local output = {colors.kat.fg.auto.color, ucolors.blend(colors.kat.blue.base.color, colors.kat.bg.shadow.color, 0.4), (mainFG0())[2], groups.selectionBG()[3], ""}
  return output
end
local function terminalMode_a()
  local output = {colors.kat.fg.auto.color, ucolors.blend(colors.kat.pink.base.color, colors.kat.bg.base.color, 0.8), (mainFG0())[2], groups.fillBG()[2], "bold"}
  return output
end
local function inactiveGroup()
  local output = {colors.kat.bg.base.color, colors.kat.fg.shadow.color, groups.mainBG()[2], groups.umbraFG()[2], ""}
  return output
end
local function warningGroup()
  local output = {colors.kat.fg.auto.color, colors.kat.red.match_bg.color, (mainFG0())[2], groups.warningBG()[2], ""}
  return output
end
local function errorGroup()
  local output = {colors.kat.fg.auto.color, colors.kat.red.base.color, (mainFG0())[2], groups.errorBG()[2], ""}
  return output
end
local function modifiedC(mode)
  local output = {}
  do
    local _3_ = mode
    if (_3_ == "normal") then
      output = {colors.kat.fg.auto.color, "", (mainFG0())[2], "", ""}
    elseif (_3_ == "insert") then
      output = {colors.kat.fg.auto.color, "", (mainFG0())[2], "", ""}
    elseif (_3_ == "replace") then
      output = {colors.kat.fg.auto.color, "", (mainFG0())[2], "", ""}
    elseif (_3_ == "visual") then
      output = {colors.kat.fg.auto.color, "", (mainFG0())[2], "", ""}
    elseif (_3_ == "inactive") then
      output = {colors.kat.bg.base.color, "", groups.mainBG()[2], "", ""}
    else
    end
  end
  return output
end
return modifiedC