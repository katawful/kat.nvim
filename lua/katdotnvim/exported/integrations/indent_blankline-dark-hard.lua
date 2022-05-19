local _2afile_2a = "fnl/katdotnvim/exported/integrations/indent_blankline-dark-hard.fnl"
local _2amodule_name_2a = "katdotnvim.exported.integrations.indent_blankline-dark-hard"
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
  return {{bg = "SKIP", ctermbg = "SKIP", ctermfg = 8, fg = "#405881", group = "IndentBlanklineChar", nocombine = true}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 8, fg = "#405881", group = "IndentBlanklineSpaceChar", nocombine = true}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 8, fg = "#405881", group = "IndentBlanklineSpaceChar", nocombine = true}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 4, fg = "#2dacd2", group = "IndentBlanklineContextChar", nocombine = true}}
end
_2amodule_2a["render"] = render
local function init()
  return run["highlight$<-table"](render())
end
_2amodule_2a["init"] = init
return _2amodule_2a