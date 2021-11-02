local _2afile_2a = "fnl/katdotnvim/highlights/indent_blankline.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.indent_blankline"
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
  ucolors.highlight("IndentBlanklineChar", groups.shadowBG(), "SKIP", "nocombine")
  ucolors.highlight("IndentBlanklineSpaceChar", groups.shadowBG(), "SKIP", "nocombine")
  ucolors.highlight("IndentBlanklineSpaceChar", groups.shadowBG(), "SKIP", "nocombine")
  return ucolors.highlight("IndentBlanklineContextChar", groups.selectionBG(), "SKIP", "nocombine")
end
_2amodule_2a["init"] = init