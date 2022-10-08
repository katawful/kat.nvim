local _2afile_2a = "fnl/katdotnvim/highlights/integrations/airline.fnl"
local ucolors = require("katdotnvim.utils.highlight.utils")
local colors = require("katdotnvim.color")
local syntax = require("katdotnvim.highlights.syntax")
local groups = require("katdotnvim.highlights.main")
local main = require("katdotnvim.main")
local mainFG = (require("katdotnvim.highlights.main")).mainFG()
if (((main["background-mut"])[1] == "dark") and ((main["contrast-mut"])[1] == "soft")) then
  mainFG[1] = ucolors.brighten(colors.kat.fg.auto.color, 0.8)
else
end
local function normalMode_c()
  local output = {colors.kat.fg.auto.color, colors.kat.pink.base.color, 7, 5, ""}
  return output
end
local function normalMode_b()
  local output = {colors.kat.fg.auto.color, colors.kat.blue.mix_shadow_bg.color, 7, 4, ""}
  return output
end
local function normalMode_a()
  local output = {colors.kat.fg.auto.color, colors.kat.purple.base.color, 7, 6, ""}
  return output
end
local function replaceMode_c()
  local output = {colors.kat.fg.auto.color, colors.kat.blue.brighten.color, 7, 4, ""}
  return output
end
local function replaceMode_b()
  local output = {colors.kat.fg.auto.color, colors.kat.blue.mix_shadow_bg.color, 7, 12, ""}
  return output
end
local function replaceMode_a()
  local output = {colors.kat.fg.auto.color, colors.kat.orange.base.color, 7, 3, "bold"}
  return output
end
local function visualMode_c()
  local output = {colors.kat.fg.auto.color, colors.kat.purple.base.color, 7, 6, ""}
  return output
end
local function visualMode_b()
  local output = {colors.kat.fg.auto.color, colors.kat.blue.mix_shadow_bg.color, 7, 12, ""}
  return output
end
local function visualMode_a()
  local output = {colors.kat.fg.auto.color, colors.kat.red.base.color, 7, 1, "bold"}
  return output
end
local function insertMode_c()
  local output = {colors.kat.fg.auto.color, ucolors.brighten(colors.kat.blue.base.color, 0.2), 7, 4, ""}
  return output
end
local function insertMode_b()
  local output = {colors.kat.fg.auto.color, colors.kat.blue.mix_shadow_bg.color, 7, 12, ""}
  return output
end
local function insertMode_a()
  local output = {colors.kat.fg.auto.color, colors.kat.blue.base.color, 7, 4, "bold"}
  return output
end
local function terminalMode_c()
  local output = {colors.kat.fg.auto.color, colors.kat.red.match_bg.color, 7, 1, ""}
  return output
end
local function terminalMode_b()
  local output = {colors.kat.fg.auto.color, colors.kat.blue.mix_shadow_bg.color, 7, 12, ""}
  return output
end
local function terminalMode_a()
  local output = {colors.kat.fg.auto.color, colors.kat.pink.match_bg.color, 7, 13, "bold"}
  return output
end
local function inactiveGroup()
  local output = {colors.kat.bg.base.color, colors.kat.fg.shadow.color, 7, 8, ""}
  return output
end
local function warningGroup()
  local output = {colors.kat.fg.auto.color, colors.kat.red.match_bg.color, 7, 9, ""}
  return output
end
local function errorGroup()
  local output = {colors.kat.fg.auto.color, colors.kat.red.base.color, 7, 1, ""}
  return output
end
local function modifiedC(mode)
  local output = {}
  do
    local _2_ = mode
    if (_2_ == "normal") then
      output = {colors.kat.fg.auto.color, "", 7, "", ""}
    elseif (_2_ == "insert") then
      output = {colors.kat.fg.auto.color, "", 7, "", ""}
    elseif (_2_ == "replace") then
      output = {colors.kat.fg.auto.color, "", 7, "", ""}
    elseif (_2_ == "visual") then
      output = {colors.kat.fg.auto.color, "", 7, "", ""}
    elseif (_2_ == "inactive") then
      output = {colors.kat.bg.base.color, "", 0, "", ""}
    else
    end
  end
  return output
end
return modifiedC