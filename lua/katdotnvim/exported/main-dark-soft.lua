local _2afile_2a = "fnl/katdotnvim/exported/main-dark-soft.fnl"
local _2amodule_name_2a = "katdotnvim.exported.main-dark-soft"
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
  return {{bg = "#202f47", ctermbg = 0, ctermfg = 7, fg = "#f0f8fb", group = "Normal"}, {bg = "#202f47", ctermbg = 0, ctermfg = 7, fg = "#f0f8fb", group = "NormalNC"}, {bg = "#405881", ctermbg = 8, ctermfg = 7, fg = "#f0f8fb", group = "NormalFloat"}, {bg = "#202f47", ctermbg = 0, ctermfg = 15, fg = "#78aab8", group = "NonText"}, {bg = "#405881", bold = true, ctermbg = 8, ctermfg = "SKIP", fg = "SKIP", group = "MatchParen"}, {bg = "NONE", ctermbg = "NONE", ctermfg = 9, fg = "#9a3f48", group = "SpecialKey", italic = true}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 15, fg = "#30474e", group = "Whitespace"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 15, fg = "#daf6ff", group = "EndOfBuffer"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 4, fg = "#54bad7", group = "Directory"}, {bg = "NONE", ctermbg = "NONE", ctermfg = 8, fg = "#405881", group = "Conceal"}, {bg = "SKIP", ctermbg = "NONE", ctermfg = "SKIP", fg = "SKIP", group = "SpellBad", sp = "#eb4949", undercurl = true}, {bg = "SKIP", ctermbg = "NONE", ctermfg = "SKIP", fg = "SKIP", group = "SpellCap", sp = "#2dacd2", undercurl = true}, {bg = "SKIP", ctermbg = "NONE", ctermfg = "SKIP", fg = "SKIP", group = "SpellLocal", sp = "#7df9ca", undercurl = true}, {bg = "SKIP", ctermbg = "NONE", ctermfg = "SKIP", fg = "SKIP", group = "SpellRare", sp = "#f29cb1", undercurl = true}, {bg = "#5f488b", bold = true, ctermbg = 14, ctermfg = 8, fg = "#9fb4df", group = "StatusLine"}, {bg = "#9fb4df", bold = true, ctermbg = 14, ctermfg = 8, fg = "#5f488b", group = "StatusLineNC"}, {bg = "#2dacd2", bold = true, ctermbg = 4, ctermfg = 7, fg = "#f0f8fb", group = "TabLineSel"}, {bg = "NONE", bold = true, ctermbg = "NONE", ctermfg = 2, fg = "#7df9ca", group = "Title"}, {bg = "#2187a6", ctermbg = 9, ctermfg = "SKIP", fg = "SKIP", group = "Visual"}, {bg = "#8fd2e6", ctermbg = 9, ctermfg = "SKIP", fg = "SKIP", group = "VisualNOS"}, {bg = "#f29cb1", ctermbg = 5, ctermfg = 7, fg = "#f0f8fb", group = "Pmenu"}, {bg = "#2dacd2", ctermbg = 4, ctermfg = 7, fg = "#f0f8fb", group = "PmenuSel"}, {bg = "#7a53a8", ctermbg = 6, ctermfg = 7, fg = "#f0f8fb", group = "PmenuSbar"}, {bg = "#2dacd2", ctermbg = 4, ctermfg = 7, fg = "#f0f8fb", group = "PmenuThumb"}, {bg = "#2dacd2", ctermbg = 4, ctermfg = 7, fg = "#f0f8fb", group = "WildMenu"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 10, fg = "#a0f9d9", group = "Question", sp = "#7df9ca", underline = true}, {bg = "#2dacd2", ctermbg = 4, ctermfg = "SKIP", fg = "SKIP", group = "QuickFixLine"}, {bg = "#f0f8fb", ctermbg = 7, ctermfg = "SKIP", fg = "SKIP", group = "Cursor", reverse = true}, {bg = "#daf6ff", ctermbg = 15, ctermfg = "SKIP", fg = "SKIP", group = "CursorIM", reverse = true}, {bg = "#78aab8", ctermbg = 15, ctermfg = "SKIP", fg = "SKIP", group = "lCursor", reverse = true}, {bg = "#405881", ctermbg = 8, ctermfg = "SKIP", fg = "SKIP", group = "CursorColumn"}, {bg = "#405881", ctermbg = 8, ctermfg = "SKIP", fg = "SKIP", group = "CursorLine"}, {bg = "#54bbda", bold = true, ctermbg = 12, ctermfg = "NONE", fg = "NONE", group = "ColorColumn"}, {bg = "#f0f8fb", ctermbg = 7, ctermfg = "SKIP", fg = "SKIP", group = "TermCursor", reverse = true}, {bg = "#daf6ff", ctermbg = 15, ctermfg = "SKIP", fg = "SKIP", group = "TermCursorNC", reverse = true}, {bg = "#eb4949", bold = true, ctermbg = 1, ctermfg = 7, fg = "#f0f8fb", group = "ErrorMsg"}, {bg = "#ae4148", ctermbg = 9, ctermfg = 7, fg = "#f0f8fb", group = "WarningMsg"}, {bg = "#78aab8", ctermbg = 15, ctermfg = 8, fg = "#405881", group = "VertSplit"}, {bg = "#405881", bold = true, ctermbg = 8, ctermfg = 7, fg = "#f0f8fb", group = "Folded"}, {bg = "NONE", bold = true, ctermbg = "NONE", ctermfg = 4, fg = "#2dacd2", group = "FoldColumn"}, {bg = "NONE", bold = true, ctermbg = "NONE", ctermfg = "NONE", fg = "NONE", group = "SignColumn"}, {reverse = false, bg = "#f2b15c", ctermbg = 3, ctermfg = 7, fg = "#f0f8fb", group = "IncSearch"}, {bg = "#f1c68c", ctermbg = 11, ctermfg = 0, fg = "#202f47", group = "Substitute"}, {bg = "#b38a56", ctermbg = 3, ctermfg = 0, fg = "#202f47", group = "Search"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 5, fg = "#f29cb1", group = "LineNr"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 13, fg = "#f1c1cf", group = "CursorLineNr"}, {bg = "#405881", bold = true, ctermbg = 8, ctermfg = 7, fg = "#f0f8fb", group = "ModeMsg"}, {bg = "#121c2d", ctermbg = 8, ctermfg = 7, fg = "#f0f8fb", group = "MsgArea"}, {bg = "#121c2d", ctermbg = 8, ctermfg = 7, fg = "#f0f8fb", group = "MsgSeparator"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 2, fg = "#7df9ca", group = "MoreMsg"}, {bg = "#7bcae2", ctermbg = 12, ctermfg = "SKIP", fg = "SKIP", group = "debugPC"}, {bg = "#ed8f90", ctermbg = 9, ctermfg = "SKIP", fg = "SKIP", group = "debugBreakpoint"}}
end
_2amodule_2a["render"] = render
local function init()
  return run["highlight$<-table"](render())
end
_2amodule_2a["init"] = init
return _2amodule_2a