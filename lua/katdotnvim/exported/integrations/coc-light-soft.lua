local _2afile_2a = "fnl/katdotnvim/exported/integrations/coc-light-soft.fnl"
local _2amodule_name_2a = "katdotnvim.exported.integrations.coc-light-soft"
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
  return {{bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 1, fg = "#eb4949", group = "CocErrorSign"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 9, fg = "#d9757a", group = "CocWarningSign"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 3, fg = "#f2b15c", group = "CocInfoSign"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 2, fg = "#006c4f", group = "CocHintSign"}, {bg = "#daf6ff", ctermbg = 8, ctermfg = 1, fg = "#eb4949", group = "CocErrorFloat"}, {bg = "#daf6ff", ctermbg = 8, ctermfg = 9, fg = "#d9757a", group = "CocWarningFloat"}, {bg = "#daf6ff", ctermbg = 8, ctermfg = 3, fg = "#f2b15c", group = "CocInfoFloat"}, {bg = "#daf6ff", ctermbg = 8, ctermfg = 2, fg = "#006c4f", group = "CocHintFloat"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 1, fg = "#eb4949", group = "CocDiagnosticsError"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 9, fg = "#d9757a", group = "CocDiagnosticsWarning"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 3, fg = "#f2b15c", group = "CocDiagnosticsInfo"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 2, fg = "#006c4f", group = "CocDiagnosticsHint"}, {bg = "SKIP", ctermbg = "NONE", ctermfg = "SKIP", fg = "SKIP", group = "CocErrorHighlight", sp = "#eb4949", undercurl = true}, {bg = "SKIP", ctermbg = "NONE", ctermfg = "SKIP", fg = "SKIP", group = "CocWarningHighlight", sp = "#d9757a", undercurl = true}, {bg = "SKIP", ctermbg = "NONE", ctermfg = "SKIP", fg = "SKIP", group = "CocInfoHighlight", sp = "#f2b15c", undercurl = true}, {bg = "SKIP", ctermbg = "NONE", ctermfg = "SKIP", fg = "SKIP", group = "CocHintHighlight", sp = "#006c4f", undercurl = true}, {bg = "#c23030", ctermbg = 9, ctermfg = "SKIP", fg = "SKIP", group = "CocSelectedText"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 15, fg = "#537680", group = "CocCodeLens"}}
end
_2amodule_2a["render"] = render
local function init()
  return run["highlight$<-table"](render())
end
_2amodule_2a["init"] = init
return _2amodule_2a