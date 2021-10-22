local _2afile_2a = "fnl/katdotnvim/highlights/ts_rainbow.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.ts_rainbow"
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
  ucolors.highlight("rainbowcol1", ucolors.blendColors(colors.normalColors.red, groups.meldFG, 0.8), "SKIP")
  ucolors.highlight("rainbowcol2", ucolors.blendColors(colors.normalColors.pink, groups.meldFG, 0.8), "SKIP")
  ucolors.highlight("rainbowcol3", ucolors.blendColors(colors.normalColors.purple, groups.meldFG, 0.8), "SKIP")
  ucolors.highlight("rainbowcol4", ucolors.blendColors(colors.normalColors.blue, groups.meldFG, 0.8), "SKIP")
  ucolors.highlight("rainbowcol5", ucolors.blendColors(colors.normalColors.green, groups.meldFG, 0.8), "SKIP")
  ucolors.highlight("rainbowcol6", ucolors.blendColors(colors.background[6], groups.meldFG, 0.8), "SKIP")
  return ucolors.highlight("rainbowcol7", ucolors.blendColors(colors.foreground[6], groups.meldFG, 0.8), "SKIP")
end
_2amodule_2a["init"] = init