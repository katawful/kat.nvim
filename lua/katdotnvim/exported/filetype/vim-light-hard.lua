local _2afile_2a = "fnl/katdotnvim/exported/filetype/vim-light-hard.fnl"
local _2amodule_name_2a = "katdotnvim.exported.filetype.vim-light-hard"
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
  return {{bg = "#405881", bold = true, ctermbg = 15, ctermfg = 8, fg = "#78aab8", group = "vimCommentTitle", italic = true}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 5, fg = "#af7689", group = "vimBracket"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 5, fg = "#c58297", group = "vimMapModKey"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 15, fg = "#202f47", group = "vimFuncSID"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 15, fg = "#202f47", group = "vimSetSep"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 15, fg = "#202f47", group = "vimSep"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 15, fg = "#202f47", group = "vimContinue"}, {group = "vimOperParen", link = "Variable"}, {group = "vimFunction", link = "Function"}, {group = "vimIsCommand", link = "Identifier"}, {group = "vimUserFunc", link = "Function"}}
end
_2amodule_2a["render"] = render
local function init()
  return run["highlight$<-table"](render())
end
_2amodule_2a["init"] = init
return _2amodule_2a