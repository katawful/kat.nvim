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
local autoload = (require("katdotnvim.aniseed.autoload")).autoload
local colors, groups, run, syntax, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.utils.highlight.run"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["run"] = run
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local function high_colors()
  return {{group = "CmpItemKind", fg = colors.kat.blue.base.color, bg = ucolors.brighten(colors.kat.pink.base.color, 0.1), ctermfg = 4, ctermbg = 5}}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a