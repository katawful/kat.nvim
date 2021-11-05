local _2afile_2a = "fnl/katdotnvim/highlights/integrations/lightline.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.integrations.lightline"
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
local colors, groups, main, syntax, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.main"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local function mainFG()
  local output = groups.mainFG()
  if ((main.katStyle == "dark") and (main.katContrast == "soft")) then
    output = ucolors.brighten(groups.mainFG(), 0.8)
  else
  end
  return output
end
_2amodule_2a["mainFG"] = mainFG
local function normalMode_c()
  local output = {mainFG(), groups.fillBG(), "NONE", "NONE", ""}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["normalMode_c"] = normalMode_c
local function normalMode_b()
  local output = {mainFG(), ucolors.blendColors(groups.selectionBG(), groups.shadowBG(), 0.4), "NONE", "NONE", ""}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["normalMode_b"] = normalMode_b
local function normalMode_a()
  local output = {mainFG(), groups.highlightBG(), "NONE", "NONE", ""}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["normalMode_a"] = normalMode_a
local function replaceMode_c()
  local output = {mainFG(), ucolors.brighten(groups.selectionBG(), 0.2), "NONE", "NONE", ""}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["replaceMode_c"] = replaceMode_c
local function replaceMode_b()
  local output = {mainFG(), ucolors.blendColors(groups.selectionBG(), groups.shadowBG(), 0.4), "NONE", "NONE", ""}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["replaceMode_b"] = replaceMode_b
local function replaceMode_a()
  local output = {mainFG(), groups.infoBG(), "NONE", "NONE", "bold"}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["replaceMode_a"] = replaceMode_a
local function visualMode_c()
  local output = {mainFG(), groups.highlightBG(), "NONE", "NONE", ""}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["visualMode_c"] = visualMode_c
local function visualMode_b()
  local output = {mainFG(), ucolors.blendColors(groups.selectionBG(), groups.shadowBG(), 0.4), "NONE", "NONE", ""}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["visualMode_b"] = visualMode_b
local function visualMode_a()
  local output = {mainFG(), groups.errorBG(), "NONE", "NONE", "bold"}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["visualMode_a"] = visualMode_a
local function insertMode_c()
  local output = {mainFG(), ucolors.brighten(groups.selectionBG(), 0.2), "NONE", "NONE", ""}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["insertMode_c"] = insertMode_c
local function insertMode_b()
  local output = {mainFG(), ucolors.blendColors(groups.selectionBG(), groups.shadowBG(), 0.4), "NONE", "NONE", ""}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["insertMode_b"] = insertMode_b
local function insertMode_a()
  local output = {mainFG(), groups.selectionBG(), "NONE", "NONE", "bold"}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["insertMode_a"] = insertMode_a
local function terminalMode_c()
  local output = {mainFG(), ucolors.blendColors(groups.errorBG(), groups.mainBG(), 0.8), "NONE", "NONE", ""}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["terminalMode_c"] = terminalMode_c
local function terminalMode_b()
  local output = {mainFG(), ucolors.blendColors(groups.selectionBG(), groups.shadowBG(), 0.4), "NONE", "NONE", ""}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["terminalMode_b"] = terminalMode_b
local function terminalMode_a()
  local output = {mainFG(), ucolors.blendColors(groups.fillBG(), groups.mainBG(), 0.8), "NONE", "NONE", "bold"}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["terminalMode_a"] = terminalMode_a
local function inactiveGroup()
  local output = {groups.mainBG(), (colors.init("foreground"))[3], "", "", ""}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["inactiveGroup"] = inactiveGroup
local function warningGroup()
  local output = {mainFG(), groups.warningBG(), "", "", ""}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["warningGroup"] = warningGroup
local function errorGroup()
  local output = {mainFG(), groups.errorBG(), "", "", ""}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["errorGroup"] = errorGroup
local function modifiedC(mode)
  local output = {}
  do
    local _2_ = mode
    if (_2_ == "normal") then
      output = {mainFG(), "", "", "", ""}
    elseif (_2_ == "insert") then
      output = {mainFG(), "", "", "", ""}
    elseif (_2_ == "replace") then
      output = {mainFG(), "", "", "", ""}
    elseif (_2_ == "visual") then
      output = {mainFG(), "", "", "", ""}
    elseif (_2_ == "inactive") then
      output = {groups.mainBG(), "", "", "", ""}
    else
    end
  end
  return output
end
_2amodule_2a["modifiedC"] = modifiedC