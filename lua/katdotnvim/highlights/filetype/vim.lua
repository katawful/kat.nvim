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
local colors, groups, syntax, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local function init()
  ucolors["highlight$"]("vimCommentTitle", groups.shadowBG()[1], groups.shadowFG()[1], groups.umbraBG()[2], groups.umbraFG()[2], "bold,italic")
  ucolors["highlight$"]("vimBracket", ucolors.blend((colors.init("normalColors")).pink, groups.mainFG()[1], 0.7), "SKIP", groups.fillBG()[2], "SKIP")
  ucolors["highlight$"]("vimMapModKey", ucolors.blend((colors.init("normalColors")).pink, groups.mainFG()[1], 0.8), "SKIP", groups.fillBG()[2], "SKIP")
  ucolors["highlight$"]("vimFuncSID", groups.umbraFG()[1], "SKIP", groups.umbraFG()[2], "SKIP")
  ucolors["highlight$"]("vimSetSep", groups.umbraFG()[1], "SKIP", groups.umbraFG()[2], "SKIP")
  ucolors["highlight$"]("vimSep", groups.umbraFG()[1], "SKIP", groups.umbraFG()[2], "SKIP")
  ucolors["highlight$"]("vimContinue", groups.umbraFG()[1], "SKIP", groups.umbraFG()[2], "SKIP")
  vim.cmd("hi def link vimOperParen Variable")
  vim.cmd("hi def link vimFunction Function")
  vim.cmd("hi def link vimIsCommand Identifier")
  return vim.cmd("hi def link vimUserFunc Function")
end
_2amodule_2a["init"] = init
return _2amodule_2a