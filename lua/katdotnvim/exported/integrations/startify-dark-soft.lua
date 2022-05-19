local _2afile_2a = "fnl/katdotnvim/exported/integrations/startify-dark-soft.fnl"
local _2amodule_name_2a = "katdotnvim.exported.integrations.startify-dark-soft"
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
  return {{bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 4, fg = "#4899c9", group = "StartifyBracket"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 6, fg = "#9274b9", group = "StartifyFile"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 4, fg = "#2dacd2", group = "StartifyNumber"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 4, fg = "#e0e5f4", group = "StartifyPath"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 7, fg = "#537680", group = "StartifySlash"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 9, fg = "#ec6c6d", group = "StartifySection"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 12, fg = "#e0e5f4", group = "StartifySpecial"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 5, fg = "#f29cb1", group = "StartifyHeader"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 4, fg = "#6285c0", group = "StartifyFooter"}}
end
_2amodule_2a["render"] = render
local function init()
  return run["highlight$<-table"](render())
end
_2amodule_2a["init"] = init
return _2amodule_2a