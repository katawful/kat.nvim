local _2afile_2a = "fnl/katdotnvim/exported/integrations/fugitive.fnl"
local _2amodule_name_2a = "katdotnvim.exported.integrations.fugitive"
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
  return {{bg = "#405881", ctermbg = 8, ctermfg = "SKIP", fg = "SKIP", group = "fugitiveHunk", nocombine = true}, {bg = "#405881", ctermbg = 8, ctermfg = "SKIP", fg = "SKIP", group = "gitDiff", nocombine = true}}
end
_2amodule_2a["render"] = render
local function init()
  return run["highlight$<-table"](render())
end
_2amodule_2a["init"] = init
return _2amodule_2a