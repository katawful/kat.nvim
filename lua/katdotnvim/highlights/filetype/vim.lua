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
  ucolors.highlight("vimCommentTitle", groups.shadowBG(), groups.shadowFG(), "bold,italic")
  ucolors.highlight("vimBracket", ucolors.blendColors((colors.init("normalColors")).pink, groups.mainFG(), 0.7), "SKIP")
  ucolors.highlight("vimMapModKey", ucolors.blendColors((colors.init("normalColors")).pink, groups.mainFG(), 0.8), "SKIP")
  ucolors.highlight("vimFuncSID", groups.umbraFG(), "SKIP")
  ucolors.highlight("vimSetSep", groups.umbraFG(), "SKIP")
  ucolors.highlight("vimSep", groups.umbraFG(), "SKIP")
  return ucolors.highlight("vimContinue", groups.umbraFG(), "SKIP")
end
_2amodule_2a["init"] = init