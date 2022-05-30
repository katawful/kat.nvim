local _2afile_2a = "fnl/katdotnvim/highlights/syntax.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.syntax"
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
local colors, groups, main, run, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.highlight.run"), autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["run"] = run
_2amodule_locals_2a["ucolors"] = ucolors
local function identifier()
  local output = {ucolors.blend((colors["normal-colors"]()).blue, colors.background()[6], 0.65), 12}
  return output
end
_2amodule_2a["identifier"] = identifier
local function statement()
  return {(colors["normal-colors"]()).red, 1}
end
_2amodule_2a["statement"] = statement
local function preproc()
  return {(colors["normal-colors"]()).pink, 5}
end
_2amodule_2a["preproc"] = preproc
local function typeDef()
  return {(colors["normal-colors"]()).orange, 3}
end
_2amodule_2a["typeDef"] = typeDef
local function special()
  local output = {ucolors.blend((colors["normal-colors"]()).pink, (colors["normal-colors"]()).purple, 0.65), 13}
  return output
end
_2amodule_2a["special"] = special
local function high_colors()
  local function _1_()
    if (vim.o.background == "light") then
      return {group = "Variable", fg = ucolors.darken(ucolors.blend(identifier()[1], colors.foreground()[6], 0.5), 0.4), bg = "SKIP", ctermfg = groups.selectionBG()[2], ctermbg = "SKIP"}
    else
      return {group = "Variable", fg = ucolors.brighten(ucolors.blend(identifier()[1], colors.foreground()[6], 0.5), 0.4), bg = "SKIP", ctermfg = groups.selectionBG()[2], ctermbg = "SKIP"}
    end
  end
  local function _3_()
    if (vim.o.background == "light") then
      return {group = "Keyword", fg = ucolors.darken(ucolors.blend(statement()[1], groups.auxBG()[1], 0.2), 0.5), bg = "SKIP", ctermfg = groups.auxBG()[3], ctermbg = "SKIP", italic = true}
    else
      return {group = "Keyword", fg = ucolors.brighten(ucolors.blend(statement()[1], groups.auxBG()[1], 0.2), 0.5), bg = "SKIP", ctermfg = groups.auxBG()[3], ctermbg = "SKIP", italic = true}
    end
  end
  return {{group = "Comment", fg = groups.meldBG()[1], bg = "SKIP", ctermfg = groups.selectionBG()[3], ctermbg = "SKIP", [vim.g.kat_nvim_commentStyle] = true}, {group = "Constant", fg = groups.fillBG()[1], bg = "SKIP", ctermfg = groups.fillBG()[2], ctermbg = "SKIP"}, {group = "String", fg = groups.auxBG()[1], bg = "SKIP", ctermfg = groups.auxBG()[3], ctermbg = "SKIP"}, {group = "Character", fg = ucolors.blend(groups.auxBG()[1], groups.mainFG()[1], 0.5), bg = "SKIP", ctermfg = groups.auxBG()[3], ctermbg = "SKIP", bold = true}, {group = "Number", fg = groups.fillBG()[1], bg = "SKIP", ctermfg = groups.fillBG()[2], ctermbg = "SKIP"}, {group = "Float", fg = ucolors.blend(groups.fillBG()[1], groups.mainFG()[1], 0.7), bg = "SKIP", ctermfg = groups.fillBG()[3], ctermbg = "SKIP"}, {group = "Boolean", fg = ucolors.blend(groups.selectionBG()[1], groups.mainFG()[1], 0.7), bg = "SKIP", ctermfg = groups.selectionBG()[3], ctermbg = "SKIP", bold = true}, {group = "Identifier", fg = identifier()[1], bg = "SKIP", ctermfg = identifier()[2], ctermbg = "SKIP"}, {group = "Function", fg = ucolors.saturation(ucolors.brighten(ucolors.blend(identifier()[1], groups.errorBG()[1], 0.3), 0.1), 0.5), bg = "SKIP", ctermfg = groups.warningBG()[2], ctermbg = "SKIP", bold = true}, _1_, {group = "Statement", fg = statement()[1], bg = "SKIP", ctermfg = statement()[2], ctermbg = "SKIP", bold = true}, {group = "Conditional", fg = ucolors.brighten(ucolors.blend(statement()[1], groups.highlightBG()[1], 0.2), 0.1), bg = "SKIP", ctermfg = groups.highlightBG()[2], ctermbg = "SKIP"}, {group = "Repeat", fg = ucolors.saturation(ucolors.brighten(ucolors.blend(statement()[1], groups.infoBG()[1], 0.2), 0.3), 0.8), bg = "SKIP", ctermfg = groups.infoBG()[2], ctermbg = "SKIP"}, {group = "Label", fg = ucolors.saturation(ucolors.blend(statement()[1], groups.fillBG()[1], 0.2), 1), bg = "SKIP", ctermfg = groups.fillBG()[2], ctermbg = "SKIP", bold = true}, {group = "Operator", fg = ucolors.blend(statement()[1], groups.meldFG()[1], 0.2), bg = "SKIP", ctermfg = groups.mainFG()[2], ctermbg = "SKIP", bold = true}, _3_, {group = "Exception", fg = ucolors.brighten(ucolors.blend(statement()[1], groups.selectionBG()[1], 0.1), 0.2), bg = "SKIP", ctermfg = groups.selectionBG()[2], ctermbg = "SKIP"}, {group = "PreProc", fg = preproc()[1], bg = "SKIP", ctermfg = preproc()[2], ctermbg = "SKIP", bold = true, italic = true}, {group = "Include", fg = ucolors.blend(preproc()[1], groups.errorBG()[1], 0.2), bg = "SKIP", ctermfg = preproc()[2], ctermbg = "SKIP", bold = true, italic = true}, {group = "Define", fg = ucolors.blend(preproc()[1], groups.highlightBG()[1], 0.2), bg = "SKIP", ctermfg = groups.highlightBG()[3], ctermbg = "SKIP", bold = true, italic = true}, {group = "Macro", fg = ucolors.blend(preproc()[1], groups.selectionBG()[1], 0.2), bg = "SKIP", ctermfg = groups.selectionBG()[3], ctermbg = "SKIP", bold = true, italic = true}, {group = "PreCondit", fg = ucolors.blend(preproc()[1], groups.auxBG()[1], 0.2), bg = "SKIP", ctermfg = groups.auxBG()[3], ctermbg = "SKIP", bold = true, italic = true}, {group = "Type", fg = typeDef()[1], bg = "SKIP", ctermfg = typeDef()[2], ctermbg = "SKIP", bold = true}, {group = "StorageClass", fg = ucolors.blend(typeDef()[1], groups.auxBG()[1], 0.2), bg = "SKIP", ctermfg = typeDef()[2], ctermbg = "SKIP", bold = true}, {group = "Structure", fg = ucolors.blend(typeDef()[1], groups.selectionBG()[1], 0.2), bg = "SKIP", ctermfg = typeDef()[2], ctermbg = "SKIP", bold = true}, {group = "Typedef", fg = ucolors.saturation(ucolors.blend(typeDef()[1], colors.background()[6], 0.2), 1), bg = "SKIP", ctermfg = typeDef()[2], ctermbg = "SKIP", bold = true}, {group = "Special", fg = special()[1], bg = "SKIP", ctermfg = special()[2], ctermbg = "SKIP"}, {group = "SpecialChar", fg = ucolors.blend(special()[1], groups.mainFG()[1], 0.8), bg = "SKIP", ctermfg = special()[2], ctermbg = "SKIP", bold = true}, {group = "Tag", fg = ucolors.blend(special()[1], groups.errorBG()[1], 0.2), bg = "SKIP", ctermfg = special()[2], ctermbg = "SKIP", bold = true}, {group = "Delimiter", fg = ucolors.blend(ucolors.blend(colors.background()[6], groups.mainFG()[1], 0.8), special()[1], 0.8), bg = "SKIP", ctermfg = special()[2], ctermbg = "SKIP", bold = true}, {group = "SpecialComment", fg = ucolors.blend(special()[1], groups.meldBG()[1], 0.2), bg = "SKIP", ctermfg = special()[2], ctermbg = "SKIP", [vim.g.kat_nvim_commentStyle] = true}, {group = "Debug", fg = ucolors.blend(special()[1], groups.auxBG()[1], 0.2), bg = "SKIP", ctermfg = special()[2], ctermbg = "SKIP", bold = true}, {group = "Underlined", fg = colors.background()[6], bg = "SKIP", ctermfg = groups.umbraFG()[2], ctermbg = "SKIP", underline = true, sp = colors.background()[6]}, {group = "Error", fg = groups.errorFG()[1], bg = groups.errorBG()[1], ctermfg = groups.errorFG()[2], ctermbg = groups.errorBG()[2], bold = true}, {group = "Todo", fg = groups.infoFG()[1], bg = ucolors.blend(groups.infoBG()[1], groups.mainFG()[1], 0.9), ctermfg = groups.infoFG()[2], ctermbg = groups.infoBG()[2]}, {group = "Ignore", fg = groups.meldFG()[1], bg = "SKIP", ctermfg = groups.umbraFG()[2], ctermbg = "SKIP"}, {group = "DiffDelete", fg = groups.mainFG()[1], bg = ucolors.darken(groups.errorBG()[1], 0.2), ctermfg = groups.mainFG()[2], ctermbg = groups.errorBG()[2], bold = true}, {group = "DiffAdd", fg = "SKIP", bg = groups.auxBG()[1], ctermfg = groups.mainFG()[2], ctermbg = groups.auxBG()[2], bold = true}, {group = "DiffChange", fg = "SKIP", bg = groups.highlightBG()[1], ctermfg = groups.mainFG()[2], ctermbg = groups.highlightBG()[2], bold = true}, {group = "DiffText", fg = "SKIP", bg = groups.selectionBG()[1], ctermfg = groups.mainFG()[2], ctermbg = groups.selectionBG()[2], bold = true}, {group = "diffAdded", fg = ucolors.blend(groups.auxBG()[1], groups.mainFG()[1], 0.4), bg = ucolors.blend(groups.auxBG()[1], groups.mainBG()[1], 0.6), ctermfg = groups.mainFG()[2], ctermbg = groups.auxBG()[3], bold = true}, {group = "diffChanged", fg = ucolors.blend(groups.selectionBG()[1], groups.mainFG()[1], 0.4), bg = ucolors.blend(groups.selectionBG()[1], groups.mainBG()[1], 0.6), ctermfg = groups.mainFG()[2], ctermbg = groups.selectionBG()[3], bold = true}, {group = "diffRemoved", fg = ucolors.blend(groups.errorBG()[1], groups.mainFG()[1], 0.4), bg = ucolors.blend(groups.errorBG()[1], groups.mainBG()[1], 0.6), ctermfg = groups.mainFG()[2], ctermbg = groups.warningBG()[2], bold = true}}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a