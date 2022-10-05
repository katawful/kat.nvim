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
local autoload = (require("katdotnvim.aniseed.autoload")).autoload
local colors, groups, run, syntax, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.utils.highlight.run"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["run"] = run
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local function high_colors()
  return {{group = "CocErrorSign", fg = colors.kat.red.base.color, bg = "SKIP", ctermfg = groups.errorBG()[2], ctermbg = "SKIP", bold = true}, {group = "CocWarningSign", fg = colors.kat.red.match_bg.color, bg = "SKIP", ctermfg = groups.warningBG()[2], ctermbg = "SKIP", bold = true}, {group = "CocInfoSign", fg = colors.kat.orange.base.color, bg = "SKIP", ctermfg = groups.infoBG()[2], ctermbg = "SKIP", bold = true}, {group = "CocHintSign", fg = colors.kat.green.auto.color, bg = "SKIP", ctermfg = groups.auxBG()[2], ctermbg = "SKIP", bold = true}, {group = "CocErrorFloat", fg = colors.kat.red.base.color, bg = colors.kat.bg.umbra.color, ctermfg = groups.errorBG()[2], ctermbg = groups.umbraBG()[2]}, {group = "CocWarningFloat", fg = colors.kat.red.match_bg.color, bg = colors.kat.bg.umbra.color, ctermfg = groups.warningBG()[2], ctermbg = groups.umbraBG()[2]}, {group = "CocInfoFloat", fg = colors.kat.orange.base.color, bg = colors.kat.bg.umbra.color, ctermfg = groups.infoBG()[2], ctermbg = groups.umbraBG()[2]}, {group = "CocHintFloat", fg = colors.kat.green.auto.color, bg = colors.kat.bg.umbra.color, ctermfg = groups.auxBG()[2], ctermbg = groups.umbraBG()[2]}, {group = "CocDiagnosticsError", fg = colors.kat.red.base.color, bg = "SKIP", ctermfg = groups.errorBG()[2], ctermbg = "SKIP"}, {group = "CocDiagnosticsWarning", fg = colors.kat.red.match_bg.color, bg = "SKIP", ctermfg = groups.warningBG()[2], ctermbg = "SKIP"}, {group = "CocDiagnosticsInfo", fg = colors.kat.orange.base.color, bg = "SKIP", ctermfg = groups.infoBG()[2], ctermbg = "SKIP"}, {group = "CocDiagnosticsHint", fg = colors.kat.green.auto.color, bg = "SKIP", ctermfg = groups.auxBG()[2], ctermbg = "SKIP"}, {group = "CocErrorHighlight", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = colors.kat.red.base.color}, {group = "CocWarningHighlight", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = colors.kat.red.match_bg.color}, {group = "CocInfoHighlight", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = colors.kat.orange.base.color}, {group = "CocHintHighlight", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = colors.kat.green.auto.color}, {group = "CocSelectedText", fg = "SKIP", bg = ucolors.darken((colors.init("normalColors")).red, 0.2), ctermfg = "SKIP", ctermbg = groups.warningBG()[2]}, {group = "CocCodeLens", fg = colors.kat.bg.meld.color, bg = "SKIP", ctermfg = groups.umbraFG()[2], ctermbg = "SKIP"}}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a