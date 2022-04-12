local _2afile_2a = "fnl/katdotnvim/highlights/integrations/ts_rainbow.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.integrations.ts_rainbow"
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
  ucolors.highlight("rainbowcol1", ucolors.blend((colors.init("normalColors")).red, groups.meldFG()[1], 0.8), "SKIP", 1, "SKIP")
  ucolors.highlight("rainbowcol2", ucolors.blend((colors.init("normalColors")).pink, groups.meldFG()[1], 0.8), "SKIP", 2, "SKIP")
  ucolors.highlight("rainbowcol3", ucolors.blend((colors.init("normalColors")).purple, groups.meldFG()[1], 0.8), "SKIP", 3, "SKIP")
  ucolors.highlight("rainbowcol4", ucolors.blend((colors.init("normalColors")).blue, groups.meldFG()[1], 0.8), "SKIP", 4, "SKIP")
  ucolors.highlight("rainbowcol5", ucolors.blend((colors.init("normalColors")).green, groups.meldFG()[1], 0.8), "SKIP", 5, "SKIP")
  ucolors.highlight("rainbowcol6", ucolors.blend((colors.init("normalColors")).orange, groups.meldFG()[1], 0.8), "SKIP", 6, "SKIP")
  return ucolors.highlight("rainbowcol7", ucolors.blend((colors.init("background"))[6], groups.meldFG()[1], 0.8), "SKIP", 7, "SKIP")
end
_2amodule_2a["init"] = init
return _2amodule_2a