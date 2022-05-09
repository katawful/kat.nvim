local _2afile_2a = "fnl/katdotnvim/highlights/integrations/cmp.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.integrations.cmp"
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
  return ucolors["highlight$"]("CmpItemKind", groups.selectionBG()[1], ucolors.brighten(groups.fillBG()[1], 0.1), groups.selectionBG()[2], groups.fillBG()[2])
end
_2amodule_2a["init"] = init
return _2amodule_2a