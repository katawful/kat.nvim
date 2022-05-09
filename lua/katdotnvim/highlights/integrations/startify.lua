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
local autoload = (require("aniseed.autoload")).autoload
local colors, groups, syntax, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local function init()
  ucolors["highlight$"]("StartifyBracket", ucolors.blend(groups.selectionBG()[1], groups.meldBG()[1], 0.5), "SKIP", groups.selectionBG()[2], "SKIP", "bold")
  ucolors["highlight$"]("StartifyFile", ucolors.blend(groups.highlightBG()[1], groups.mainFG()[1], 0.8), "SKIP", groups.highlightBG()[2], "SKIP", "bold")
  ucolors["highlight$"]("StartifyNumber", groups.selectionBG()[1], "SKIP", groups.selectionBG()[2], "SKIP", "bold")
  ucolors["highlight$"]("StartifyPath", (colors.init("background"))[6], "SKIP", groups.selectionBG()[2], "SKIP")
  ucolors["highlight$"]("StartifySlash", (colors.init("foreground"))[4], "SKIP", groups.mainFG()[2], "SKIP")
  ucolors["highlight$"]("StartifySection", ucolors.blend((colors.init("normalColors")).red, groups.mainFG()[1], 0.8), "SKIP", groups.warningBG()[2], "SKIP", "bold")
  ucolors["highlight$"]("StartifySpecial", (colors.init("background"))[6], "SKIP", groups.selectionBG()[3], "SKIP")
  ucolors["highlight$"]("StartifyHeader", groups.fillBG()[1], "SKIP", groups.fillBG()[2], "SKIP")
  return ucolors["highlight$"]("StartifyFooter", (colors.init("background"))[4], "SKIP", groups.selectionBG()[2], "SKIP")
end
_2amodule_2a["init"] = init
return _2amodule_2a