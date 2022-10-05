local _2afile_2a = "fnl/katdotnvim/highlights/integrations/treesitter.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.integrations.treesitter"
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
local colors, groups, main, run, syntax, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.highlight.run"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["run"] = run
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local stringColor = colors.kat.green.auto.color
_2amodule_2a["stringColor"] = stringColor
local function high_colors()
  local function _1_()
    if ((main["background-mut"])[1] == "light") then
      return {group = "TSNamespace", fg = ucolors.darken(ucolors.blend(syntax.identifier()[1], (colors["normal-colors"]()).green, 0.3), 0.4), bg = "SKIP", ctermfg = groups.auxBG()[2], ctermbg = "SKIP"}
    else
      return {group = "TSNamespace", fg = ucolors.brighten(ucolors.blend(syntax.identifier()[1], (colors["normal-colors"]()).green, 0.3), 0.2), bg = "SKIP", ctermfg = groups.auxBG()[2], ctermbg = "SKIP"}
    end
  end
  return {{group = "TSField", fg = ucolors.brighten(ucolors.blend(syntax.identifier()[1], colors.kat.purple.base.color, 0.2), 0.2), bg = "SKIP", ctermfg = groups.highlightBG()[2], ctermbg = "SKIP", bold = true}, {group = "TSProperty", link = "TSField"}, {group = "TSFuncBuiltin", fg = ucolors.blend(syntax.identifier()[1], colors.kat.red.base.color, 0.3), bg = "SKIP", ctermfg = groups.errorBG()[2], ctermbg = "SKIP", bold = true}, {group = "TSFuncMacro", fg = ucolors.blend(syntax.preproc()[1], syntax.identifier()[1], 0.2), bg = "SKIP", ctermfg = groups.errorBG()[2], ctermbg = "SKIP", bold = true, italic = true}, {group = "TSMethod", fg = ucolors.saturation(ucolors.brighten(ucolors.blend(syntax.identifier()[1], colors.kat.red.base.color, 0.3), 0.1), 0.1), bg = "SKIP", ctermfg = groups.errorBG()[2], ctermbg = "SKIP", bold = true}, {group = "TSVariable", link = "Variable"}, {group = "TSParameter", link = "Variable"}, {group = "TSVariableBuiltin", fg = ucolors.darken(ucolors.blend(syntax.identifier()[1], colors.kat.fg.shadow.color, 0.8), 0.2), bg = "SKIP", ctermfg = groups.selectionBG()[2], ctermbg = "SKIP", bold = true}, _1_, {group = "TSParameterReference", fg = ucolors.brighten(ucolors.blend(syntax.identifier()[1], colors.kat.fg.shadow.color, 0.8), 0.2), bg = "SKIP", ctermfg = groups.umbraBG()[2], ctermbg = "SKIP", bold = true}, {group = "TSAnnotation", fg = ucolors.blend(syntax.preproc()[1], colors.kat.fg.meld.color, 0.2), bg = "SKIP", ctermfg = groups.highlightBG()[3], ctermbg = "SKIP", italic = true}, {group = "TSNote", fg = colors.kat.fg.shadow.color, bg = "SKIP", ctermfg = groups.umbraBG()[2], ctermbg = "SKIP"}, {group = "TSWarning", fg = colors.kat.fg.auto.color, bg = colors.kat.red.match_bg.color, ctermfg = groups.warningFG()[2], ctermbg = groups.warningBG()[2]}, {group = "TSDanger", fg = colors.kat.fg.auto.color, bg = ucolors.brighten(colors.kat.red.base.color, 0.1), ctermfg = groups.warningFG()[2], ctermbg = groups.errorBG()[2], italic = true}, {group = "TSConstructor", fg = ucolors.blend(syntax.typeDef()[1], colors.kat.red.base.color, 0.4), bg = "SKIP", ctermfg = groups.infoBG()[2], ctermbg = "SKIP"}, {group = "TSTypeBuiltin", fg = ucolors.darken(syntax.typeDef()[1], 0.5), bg = "SKIP", ctermfg = groups.infoBG()[3], ctermbg = "SKIP", bold = true}, {group = "TSConstBuiltin", fg = ucolors.darken(ucolors.blend(colors.kat.pink.base.color, colors.kat.blue.base.color, 0.8), 0.2), bg = "SKIP", ctermfg = groups.selectionBG()[3], ctermbg = "SKIP"}, {group = "TSConstMacro", fg = ucolors.blend(syntax.preproc()[1], colors.kat.bg.meld.color, 0.2), bg = "SKIP", ctermfg = groups.fillBG()[3], ctermbg = "SKIP"}, {group = "TSKeywordFunction", fg = ucolors.brighten(ucolors.blend(syntax.statement()[1], colors.kat.green.base.color, 0.2), 0.1), bg = "SKIP", ctermfg = groups.auxBG()[2], ctermbg = "SKIP", bold = true, italic = true}, {group = "TSKeywordReturn", fg = ucolors.brighten(ucolors.blend(syntax.statement()[1], colors.kat.blue.base.color, 0.1), 0.2), bg = "SKIP", ctermfg = groups.selectionBG()[3], ctermbg = "SKIP", bold = true, italic = true}, {group = "TSKeywordOperator", fg = ucolors.brighten(ucolors.blend(syntax.statement()[1], colors.kat.fg.meld.color, 0.1), 0.2), bg = "SKIP", ctermfg = groups.errorBG()[2], ctermbg = "SKIP"}, {group = "TSPunctDelimiter", fg = ucolors.blend(syntax.preproc()[1], colors.kat.purple.base.color, 0.2), bg = "SKIP", ctermfg = groups.highlightBG()[3], ctermbg = "SKIP", bold = true}, {group = "TSPunctBracket", fg = ucolors.blend(syntax.preproc()[1], colors.kat.bg.sixth.color, 0.2), bg = "SKIP", ctermfg = groups.highlightBG()[2], ctermbg = "SKIP", bold = true}, {group = "TSPunctSpecial", fg = ucolors.blend(syntax.preproc()[1], syntax.special()[1], 0.4), bg = "SKIP", ctermfg = groups.fillBG()[3], ctermbg = "SKIP", bold = true}, {group = "TSTagDelimiter", fg = ucolors.darken(ucolors.blend(syntax.preproc()[1], colors.kat.red.base.color, 0.4), 0.2), bg = "SKIP", ctermfg = groups.warningBG()[2], ctermbg = "SKIP", bold = true}, {group = "TSStringRegex", fg = ucolors.blend(stringColor, colors.kat.blue.base.color, 0.5), bg = "SKIP", ctermfg = groups.selectionBG()[2], ctermbg = "SKIP", bold = true}, {group = "TSStringEscape", fg = ucolors.blend(stringColor, colors.kat.red.base.color, 0.2), bg = "SKIP", ctermfg = groups.errorBG()[2], ctermbg = "SKIP", bold = true}, {group = "TSSymbol", fg = ucolors.saturation(ucolors.blend(stringColor, colors.kat.purple.base.color, 0.3), 0.8), bg = "SKIP", ctermfg = groups.highlightBG()[2], ctermbg = "SKIP"}, {group = "TSTextReference", fg = colors.kat.fg.umbra.color, bg = "SKIP", ctermfg = groups.umbraFG()[2], ctermbg = "SKIP", italic = true}, {group = "TSURI", fg = colors.kat.orange.base.color, bg = "SKIP", ctermfg = groups.infoBG()[2], ctermbg = "SKIP", underline = true}}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a