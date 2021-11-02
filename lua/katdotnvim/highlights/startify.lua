local _2afile_2a = "fnl/katdotnvim/highlights/startify.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.startify"
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
  ucolors.highlight("StartifyBracket", ucolors.blendColors(groups.selectionBG(), groups.meldBG(), 0.5), "SKIP", "bold")
  ucolors.highlight("StartifyFile", ucolors.blendColors(groups.highlightBG(), groups.mainFG(), 0.8), "SKIP", "bold")
  ucolors.highlight("StartifyNumber", groups.selectionBG(), "SKIP", "bold")
  ucolors.highlight("StartifyPath", (colors.init("background"))[6], "SKIP")
  ucolors.highlight("StartifySlash", (colors.init("foreground"))[4], "SKIP")
  ucolors.highlight("StartifySection", ucolors.blendColors((colors.init("normalColors")).red, groups.mainFG(), 0.8), "SKIP", "bold")
  ucolors.highlight("StartifySpecial", (colors.init("background"))[6], "SKIP")
  ucolors.highlight("StartifyHeader", groups.fillBG(), "SKIP")
  return ucolors.highlight("StartifyFooter", (colors.init("background"))[4], "SKIP")
end
_2amodule_2a["init"] = init