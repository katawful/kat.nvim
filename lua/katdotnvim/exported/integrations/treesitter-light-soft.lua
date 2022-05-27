local _2afile_2a = "fnl/katdotnvim/exported/integrations/treesitter-light-soft.fnl"
local _2amodule_name_2a = "katdotnvim.exported.integrations.treesitter-light-soft"
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
  return {{bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 6, fg = "#857ab9", group = "TSField"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 1, fg = "#af585f", group = "TSFuncBuiltin"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 1, fg = "#4c8199", group = "TSFuncMacro", italic = true}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 1, fg = "#c75f68", group = "TSMethod"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 4, fg = "#1f5c73", group = "TSVariableBuiltin"}, {{bg = "SKIP", ctermbg = "SKIP", ctermfg = 2, fg = "#2ed3b2", group = "TSNamespace"}}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 8, fg = "#3690b3", group = "TSParameterReference"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 14, fg = "#7f8abd", group = "TSAnnotation", italic = true}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 8, fg = "#405881", group = "TSNote"}, {bg = "#d9757a", ctermbg = 9, ctermfg = 7, fg = "#202f47", group = "TSWarning"}, {bg = "#ec6363", ctermbg = 1, ctermfg = 7, fg = "#202f47", group = "TSDanger", italic = true}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 3, fg = "#ee7351", group = "TSConstructor"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 11, fg = "#755428", group = "TSTypeBuiltin"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 12, fg = "#b47299", group = "TSConstBuiltin"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 13, fg = "#737e8a", group = "TSConstMacro"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 2, fg = "#56cb9e", group = "TSKeywordFunction", italic = true}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 12, fg = "#49b7dd", group = "TSKeywordReturn", italic = true}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 1, fg = "#8c97c3", group = "TSKeywordOperator"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 14, fg = "#9262aa", group = "TSPunctDelimiter"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 6, fg = "#3e363c", group = "TSPunctBracket"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 13, fg = "#d98caf", group = "TSPunctSpecial"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 9, fg = "#d93546", group = "TSTagDelimiter"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 4, fg = "#178c91", group = "TSStringRegex"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 1, fg = "#bc504a", group = "TSStringEscape"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 6, fg = "#4955b2", group = "TSSymbol"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 15, fg = "#121c2d", group = "TSTextReference", italic = true}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 3, fg = "#f2b15c", group = "TSURI", underline = true}}
end
_2amodule_2a["render"] = render
local function init()
  return run["highlight$<-table"](render())
end
_2amodule_2a["init"] = init
return _2amodule_2a