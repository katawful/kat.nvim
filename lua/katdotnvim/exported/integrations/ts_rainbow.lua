local _2afile_2a = "fnl/katdotnvim/exported/integrations/ts_rainbow.fnl"
local _2amodule_name_2a = "katdotnvim.exported.integrations.ts_rainbow"
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
local run = autoload("katdotnvim.utils.highlight.run")
do end (_2amodule_locals_2a)["run"] = run
local function render()
  return {{bg = "SKIP", ctermbg = "SKIP", ctermfg = 1, fg = "#cd5254", group = "rainbowcol1"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 2, fg = "#d294a7", group = "rainbowcol2"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 3, fg = "#725aa0", group = "rainbowcol3"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 4, fg = "#35a1c2", group = "rainbowcol4"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 5, fg = "#34cba2", group = "rainbowcol5"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 6, fg = "#d2a563", group = "rainbowcol6"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 7, fg = "#c4cfdd", group = "rainbowcol7"}}
end
_2amodule_2a["render"] = render
local function init()
  return run["highlight$<-table"](render())
end
_2amodule_2a["init"] = init
return _2amodule_2a