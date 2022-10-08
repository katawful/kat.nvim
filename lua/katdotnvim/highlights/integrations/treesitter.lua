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
local function high_colors()
  return {{group = "TSField", fg = colors.kat.teal.mix_purple.color, bg = "SKIP", ctermfg = 6, ctermbg = "SKIP", bold = true}, {group = "TSProperty", link = "TSField"}, {group = "TSFuncBuiltin", fg = colors.kat.teal.mix_red.color, bg = "SKIP", ctermfg = 1, ctermbg = "SKIP", bold = true}, {group = "TSFuncMacro", fg = colors.kat.pink.mix_teal.color, bg = "SKIP", ctermfg = 1, ctermbg = "SKIP", bold = true, italic = true}, {group = "TSMethod", fg = colors.kat.teal.mix_red_brighten_dull.color, bg = "SKIP", ctermfg = 1, ctermbg = "SKIP", bold = true}, {group = "TSVariable", link = "Variable"}, {group = "TSParameter", link = "Variable"}, {group = "TSVariableBuiltin", fg = colors.kat.teal.mix_shadow_fg.color, bg = "SKIP", ctermfg = 4, ctermbg = "SKIP", bold = true}, {group = "TSNamespace", fg = colors.kat.teal.mix_green.color, bg = "SKIP", ctermfg = 2, ctermbg = "SKIP"}, {group = "TSParameterReference", fg = colors.kat.teal.mix_shadow_fg.color, bg = "SKIP", ctermfg = 8, ctermbg = "SKIP", bold = true}, {group = "TSAnnotation", fg = colors.kat.pink.mix_meld_fg.color, bg = "SKIP", ctermfg = 14, ctermbg = "SKIP", italic = true}, {group = "TSNote", fg = colors.kat.fg.shadow.color, bg = "SKIP", ctermfg = 8, ctermbg = "SKIP"}, {group = "TSWarning", fg = colors.kat.fg.auto.color, bg = colors.kat.red.match_bg.color, ctermfg = 7, ctermbg = 9}, {group = "TSDanger", fg = colors.kat.fg.auto.color, bg = ucolors.brighten(colors.kat.red.base.color, 0.1), ctermfg = 7, ctermbg = 1, italic = true}, {group = "TSConstructor", fg = colors.kat.orange.mix_red.color, bg = "SKIP", ctermfg = 3, ctermbg = "SKIP"}, {group = "TSTypeBuiltin", fg = ucolors.darken(colors.kat.orange.base.color, 0.5), bg = "SKIP", ctermfg = 11, ctermbg = "SKIP", bold = true}, {group = "TSConstBuiltin", fg = ucolors.darken(ucolors.blend(colors.kat.pink.base.color, colors.kat.blue.base.color, 0.8), 0.2), bg = "SKIP", ctermfg = 12, ctermbg = "SKIP"}, {group = "TSConstMacro", fg = ucolors.blend(colors.kat.pink.base.color, colors.kat.bg.meld.color, 0.2), bg = "SKIP", ctermfg = 13, ctermbg = "SKIP"}, {group = "TSKeywordFunction", fg = ucolors.brighten(ucolors.blend(colors.kat.red.base.color, colors.kat.green.base.color, 0.2), 0.1), bg = "SKIP", ctermfg = 2, ctermbg = "SKIP", bold = true, italic = true}, {group = "TSKeywordReturn", fg = ucolors.brighten(ucolors.blend(colors.kat.red.base.color, colors.kat.blue.base.color, 0.1), 0.2), bg = "SKIP", ctermfg = 12, ctermbg = "SKIP", bold = true, italic = true}, {group = "TSKeywordOperator", fg = ucolors.brighten(ucolors.blend(colors.kat.red.base.color, colors.kat.fg.meld.color, 0.1), 0.2), bg = "SKIP", ctermfg = 1, ctermbg = "SKIP"}, {group = "TSPunctDelimiter", fg = ucolors.blend(colors.kat.pink.base.color, colors.kat.purple.base.color, 0.2), bg = "SKIP", ctermfg = 14, ctermbg = "SKIP", bold = true}, {group = "TSPunctBracket", fg = ucolors.blend(colors.kat.pink.base.color, colors.kat.bg.sixth.color, 0.2), bg = "SKIP", ctermfg = 6, ctermbg = "SKIP", bold = true}, {group = "TSPunctSpecial", fg = ucolors.blend(colors.kat.pink.base.color, colors.kat.plum.base.color, 0.4), bg = "SKIP", ctermfg = 13, ctermbg = "SKIP", bold = true}, {group = "TSTagDelimiter", fg = ucolors.darken(ucolors.blend(colors.kat.pink.base.color, colors.kat.red.base.color, 0.4), 0.2), bg = "SKIP", ctermfg = 9, ctermbg = "SKIP", bold = true}, {group = "TSStringRegex", fg = colors.kat.green.mix_blue.color, bg = "SKIP", ctermfg = 4, ctermbg = "SKIP", bold = true}, {group = "TSStringEscape", fg = colors.kat.green.mix_red.color, bg = "SKIP", ctermfg = 1, ctermbg = "SKIP", bold = true}, {group = "TSSymbol", fg = colors.kat.green.mix_purple.color, bg = "SKIP", ctermfg = 6, ctermbg = "SKIP"}, {group = "TSTextReference", fg = colors.kat.fg.umbra.color, bg = "SKIP", ctermfg = 15, ctermbg = "SKIP", italic = true}, {group = "TSURI", fg = colors.kat.orange.base.color, bg = "SKIP", ctermfg = 3, ctermbg = "SKIP", underline = true}}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a