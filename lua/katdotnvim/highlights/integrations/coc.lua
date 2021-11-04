local _2afile_2a = "fnl/katdotnvim/highlights/integrations/coc.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.integrations.lsp"
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
local colors, groups, syntax, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local function init()
  ucolors.highlight("CocErrorSign", groups.errorBG(), "SKIP", "bold")
  ucolors.highlight("CocWarningSign", groups.warningBG(), "SKIP", "bold")
  ucolors.highlight("CocInfoSign", groups.infoBG(), "SKIP", "bold")
  ucolors.highlight("CocHintSign", groups.auxBG(), "SKIP", "bold")
  ucolors.highlight("CocErrorFloat", groups.errorBG(), groups.umbraBG())
  ucolors.highlight("CocWarningFloat", groups.warningBG(), groups.umbraBG())
  ucolors.highlight("CocInfoFloat", groups.infoBG(), groups.umbraBG())
  ucolors.highlight("CocHintFloat", groups.auxBG(), groups.umbraBG())
  ucolors.highlight("CocDiagnosticsError", groups.errorBG(), "SKIP")
  ucolors.highlight("CocDiagnosticsWarning", groups.warningBG(), "SKIP")
  ucolors.highlight("CocDiagnosticsInfo", groups.infoBG(), "SKIP")
  ucolors.highlight("CocDiagnosticsHint", groups.auxBG(), "SKIP")
  ucolors.highlight("CocErrorHighlight", "SKIP", "SKIP", "undercurl", groups.errorBG())
  ucolors.highlight("CocWarningHighlight", "SKIP", "SKIP", "undercurl", groups.warningBG())
  ucolors.highlight("CocInfoHighlight", "SKIP", "SKIP", "undercurl", groups.infoBG())
  ucolors.highlight("CocHintHighlight", "SKIP", "SKIP", "undercurl", groups.auxBG())
  ucolors.highlight("CocSelectedText", "SKIP", ucolors.darken((colors.init("normalColors")).red, 0.2))
  return ucolors.highlight("CocCodeLens", groups.meldBG(), "SKIP")
end
_2amodule_2a["init"] = init