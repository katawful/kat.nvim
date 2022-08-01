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
local colors, groups, run, syntax, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.utils.highlight.run"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["run"] = run
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local function high_colors()
  return {{group = "rainbowcol1", fg = ucolors.blend((colors.init("normalColors")).red, groups.meldFG()[1], 0.8), bg = "SKIP", ctermfg = 1, ctermbg = "SKIP"}, {group = "rainbowcol2", fg = ucolors.blend((colors.init("normalColors")).pink, groups.meldFG()[1], 0.8), bg = "SKIP", ctermfg = 2, ctermbg = "SKIP"}, {group = "rainbowcol3", fg = ucolors.blend((colors.init("normalColors")).purple, groups.meldFG()[1], 0.8), bg = "SKIP", ctermfg = 3, ctermbg = "SKIP"}, {group = "rainbowcol4", fg = ucolors.blend((colors.init("normalColors")).blue, groups.meldFG()[1], 0.8), bg = "SKIP", ctermfg = 4, ctermbg = "SKIP"}, {group = "rainbowcol5", fg = ucolors.blend((colors.init("normalColors")).green, groups.meldFG()[1], 0.8), bg = "SKIP", ctermfg = 5, ctermbg = "SKIP"}, {group = "rainbowcol6", fg = ucolors.blend((colors.init("normalColors")).orange, groups.meldFG()[1], 0.8), bg = "SKIP", ctermfg = 6, ctermbg = "SKIP"}, {group = "rainbowcol7", fg = ucolors.blend((colors.init("background"))[6], groups.meldFG()[1], 0.8), bg = "SKIP", ctermfg = 7, ctermbg = "SKIP"}}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a