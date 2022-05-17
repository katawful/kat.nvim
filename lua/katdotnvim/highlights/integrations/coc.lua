local _2afile_2a = "fnl/katdotnvim/highlights/integrations/coc.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.integrations.coc"
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
local colors, groups, run, syntax, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.utils.highlight.run"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["run"] = run
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local function high_colors()
  return {{group = "CocErrorSign", fg = groups.errorBG()[1], bg = "SKIP", ctermfg = groups.errorBG()[2], ctermbg = "SKIP", bold = true}, {group = "CocWarningSign", fg = groups.warningBG()[1], bg = "SKIP", ctermfg = groups.warningBG()[2], ctermbg = "SKIP", bold = true}, {group = "CocInfoSign", fg = groups.infoBG()[1], bg = "SKIP", ctermfg = groups.infoBG()[2], ctermbg = "SKIP", bold = true}, {group = "CocHintSign", fg = groups.auxBG()[1], bg = "SKIP", ctermfg = groups.auxBG()[2], ctermbg = "SKIP", bold = true}, {group = "CocErrorFloat", fg = groups.errorBG()[1], bg = groups.umbraBG()[1], ctermfg = groups.errorBG()[2], ctermbg = groups.umbraBG()[2]}, {group = "CocWarningFloat", fg = groups.warningBG()[1], bg = groups.umbraBG()[1], ctermfg = groups.warningBG()[2], ctermbg = groups.umbraBG()[2]}, {group = "CocInfoFloat", fg = groups.infoBG()[1], bg = groups.umbraBG()[1], ctermfg = groups.infoBG()[2], ctermbg = groups.umbraBG()[2]}, {group = "CocHintFloat", fg = groups.auxBG()[1], bg = groups.umbraBG()[1], ctermfg = groups.auxBG()[2], ctermbg = groups.umbraBG()[2]}, {group = "CocDiagnosticsError", fg = groups.errorBG()[1], bg = "SKIP", ctermfg = groups.errorBG()[2], ctermbg = "SKIP"}, {group = "CocDiagnosticsWarning", fg = groups.warningBG()[1], bg = "SKIP", ctermfg = groups.warningBG()[2], ctermbg = "SKIP"}, {group = "CocDiagnosticsInfo", fg = groups.infoBG()[1], bg = "SKIP", ctermfg = groups.infoBG()[2], ctermbg = "SKIP"}, {group = "CocDiagnosticsHint", fg = groups.auxBG()[1], bg = "SKIP", ctermfg = groups.auxBG()[2], ctermbg = "SKIP"}, {group = "CocErrorHighlight", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = groups.errorBG()[1]}, {group = "CocWarningHighlight", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = groups.warningBG()[1]}, {group = "CocInfoHighlight", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = groups.infoBG()[1]}, {group = "CocHintHighlight", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = groups.auxBG()[1]}, {group = "CocSelectedText", fg = "SKIP", bg = ucolors.darken((colors.init("normalColors")).red, 0.2), ctermfg = "SKIP", ctermbg = groups.warningBG()[2]}, {group = "CocCodeLens", fg = groups.meldBG()[1], bg = "SKIP", ctermfg = groups.umbraFG()[2], ctermbg = "SKIP"}}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a