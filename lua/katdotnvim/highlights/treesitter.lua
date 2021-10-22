local _2afile_2a = "fnl/katdotnvim/highlights/treesitter.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.treesitter"
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
local stringColor = groups.auxBG
_2amodule_2a["stringColor"] = stringColor
local function init()
  vim.cmd("hi def link TSVariable Variable")
  ucolors.highlight("TSField", ucolors.brighten(ucolors.blendColors(syntax.identifier, colors.normalColors.purple, 0.2), 0.2), "SKIP", "bold")
  vim.cmd("hi def link TSProperty TSField")
  ucolors.highlight("TSFuncBuiltin", ucolors.blendColors(syntax.identifier, colors.normalColors.red, 0.3), "SKIP", "bold")
  ucolors.highlight("TSFuncMacro", ucolors.blendColors(syntax.preproc, syntax.identifier, 0.2), "SKIP", "bold,italic")
  ucolors.highlight("TSMethod", ucolors.saturation(ucolors.brighten(ucolors.blendColors(syntax.identifier, colors.normalColors.red, 0.3), 0.1), 0.1), "SKIP", "bold")
  ucolors.highlight("TSVariableBuiltin", ucolors.darken(ucolors.blendColors(syntax.identifier, colors.foreground[3], 0.8), 0.2), "SKIP")
  if (vim.g.kat_nvim_style == "light") then
    ucolors.highlight("TSNamespace", ucolors.darken(ucolors.blendColors(syntax.identifier, colors.normalColors.green, 0.3), 0.4), "SKIP")
  else
    ucolors.highlight("TSNamespace", ucolors.brighten(ucolors.blendColors(syntax.identifier, colors.normalColors.green, 0.3), 0.2), "SKIP")
  end
  vim.cmd("hi def link TSParameter Variable")
  ucolors.highlight("TSParameterReference", ucolors.brighten(ucolors.blendColors(syntax.identifier, colors.foreground[3], 0.8), 0.2), "SKIP", "bold")
  ucolors.highlight("TSAnnotation", ucolors.blendColors(syntax.preproc, groups.meldFG, 0.2), "SKIP", "italic")
  ucolors.highlight("TSNote", groups.shadowFG, "SKIP")
  ucolors.highlight("TSWarning", groups.warningFG, groups.warningBG)
  ucolors.highlight("TSDanger", groups.warningFG, ucolors.brighten(groups.errorBG, 0.1), "italic")
  ucolors.highlight("TSConstructor", ucolors.blendColors(syntax.typeDef, colors.normalColors.red, 0.4), "SKIP")
  ucolors.highlight("TSTypeBuiltin", ucolors.darken(syntax.typeDef, 0.5), "SKIP", "bold")
  ucolors.highlight("TSConstBuiltin", ucolors.darken(ucolors.blendColors(groups.fillBG, colors.normalColors.blue, 0.8), 0.2), "SKIP")
  ucolors.highlight("TSConstMacro", ucolors.blendColors(syntax.preproc, groups.meldBG, 0.2), "SKIP")
  ucolors.highlight("TSKeywordFunction", ucolors.brighten(ucolors.blendColors(syntax.statement, colors.normalColors.green, 0.2), 0.1), "SKIP", "bold,italic")
  ucolors.highlight("TSKeywordReturn", ucolors.brighten(ucolors.blendColors(syntax.statement, colors.normalColors.blue, 0.1), 0.2), "SKIP", "bold,italic")
  ucolors.highlight("TSKeywordOperator", ucolors.brighten(ucolors.blendColors(syntax.statement, groups.meldFG, 0.1), 0.2), "SKIP")
  ucolors.highlight("TSPunctDelimiter", ucolors.blendColors(syntax.preproc, colors.normalColors.purple, 0.2), "SKIP", "bold")
  ucolors.highlight("TSPunctBracket", ucolors.blendColors(syntax.preproc, colors.background[6], 0.2), "SKIP", "bold")
  ucolors.highlight("TSPunctSpecial", ucolors.blendColors(syntax.preproc, syntax.special, 0.4), "SKIP", "bold")
  ucolors.highlight("TSTagDelimiter", ucolors.darken(ucolors.blendColors(syntax.preproc, colors.normalColors.red, 0.4), 0.2), "SKIP", "bold")
  ucolors.highlight("TSStringRegex", ucolors.blendColors(stringColor, colors.normalColors.blue, 0.5), "SKIP", "bold")
  ucolors.highlight("TSStringEscape", ucolors.blendColors(stringColor, colors.normalColors.red, 0.2), "SKIP", "bold")
  ucolors.highlight("TSSymbol", ucolors.saturation(ucolors.blendColors(stringColor, colors.normalColors.purple, 0.3), 0.8), "SKIP")
  ucolors.highlight("TSTextReference", groups.umbraFG, "SKIP", "italic")
  return ucolors.highlight("TSURI", groups.infoBG, "SKIP", "underline")
end
_2amodule_2a["init"] = init