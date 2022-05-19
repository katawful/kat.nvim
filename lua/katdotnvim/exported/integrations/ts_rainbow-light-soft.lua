local _2afile_2a = "fnl/katdotnvim/exported/integrations/ts_rainbow-light-soft.fnl"
local _2amodule_name_2a = "katdotnvim.exported.integrations.ts_rainbow-light-soft"
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
local run = autoload("katdotnvim.utils.highlight.run")
do end (_2amodule_locals_2a)["run"] = run
local function render()
  return {{bg = "SKIP", ctermbg = "SKIP", ctermfg = 1, fg = "#d05561", group = "rainbowcol1"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 2, fg = "#d597b4", group = "rainbowcol2"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 3, fg = "#755dad", group = "rainbowcol3"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 4, fg = "#38a4ce", group = "rainbowcol4"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 5, fg = "#37ceae", group = "rainbowcol5"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 6, fg = "#d5a870", group = "rainbowcol6"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 7, fg = "#21313f", group = "rainbowcol7"}}
end
_2amodule_2a["render"] = render
local function init()
  return run["highlight$<-table"](render())
end
_2amodule_2a["init"] = init
return _2amodule_2a