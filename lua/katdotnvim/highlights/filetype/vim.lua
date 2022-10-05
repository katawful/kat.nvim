local _2afile_2a = "fnl/katdotnvim/highlights/filetype/vim.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.filetype.vim"
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
  return {{group = "vimCommentTitle", fg = colors.kat.bg.shadow.color, bg = colors.kat.fg.shadow.color, ctermfg = groups.umbraBG()[2], ctermbg = groups.umbraFG()[2], bold = true, italic = true}, {group = "vimBracket", fg = ucolors.blend((colors.init("normalColors")).pink, colors.kat.fg.auto.color, 0.7), bg = "SKIP", ctermfg = groups.fillBG()[2], ctermbg = "SKIP"}, {group = "vimMapModKey", fg = ucolors.blend((colors.init("normalColors")).pink, colors.kat.fg.auto.color, 0.8), bg = "SKIP", ctermfg = groups.fillBG()[2], ctermbg = "SKIP"}, {group = "vimFuncSID", fg = colors.kat.fg.umbra.color, bg = "SKIP", ctermfg = groups.umbraFG()[2], ctermbg = "SKIP"}, {group = "vimSetSep", fg = colors.kat.fg.umbra.color, bg = "SKIP", ctermfg = groups.umbraFG()[2], ctermbg = "SKIP"}, {group = "vimSep", fg = colors.kat.fg.umbra.color, bg = "SKIP", ctermfg = groups.umbraFG()[2], ctermbg = "SKIP"}, {group = "vimContinue", fg = colors.kat.fg.umbra.color, bg = "SKIP", ctermfg = groups.umbraFG()[2], ctermbg = "SKIP"}, {group = "vimOperParen", link = "Variable"}, {group = "vimFunction", link = "Function"}, {group = "vimIsCommand", link = "Identifier"}, {group = "vimUserFunc", link = "Function"}}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a