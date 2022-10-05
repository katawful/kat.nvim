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
local autoload = (require("katdotnvim.aniseed.autoload")).autoload
local colors, groups, main, run, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.highlight.run"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["run"] = run
_2amodule_locals_2a["ucolors"] = ucolors
local function identifier()
  local output = {ucolors.blend((colors["normal-colors"]()).blue, colors.kat.bg.sixth.color, 0.65), 12}
  return output
end
_2amodule_2a["identifier"] = identifier
local function statement()
  return {colors.kat.red.base.color, 1}
end
_2amodule_2a["statement"] = statement
local function preproc()
  return {colors.kat.pink.base.color, 5}
end
_2amodule_2a["preproc"] = preproc
local function typeDef()
  return {colors.kat.orange.base.color, 3}
end
_2amodule_2a["typeDef"] = typeDef
local function special()
  local output = {ucolors.blend(colors.kat.pink.base.color, (colors["normal-colors"]()).purple, 0.65), 13}
  return output
end
_2amodule_2a["special"] = special
local function high_colors()
  local function _1_()
    if ((main["background-mut"])[1] == "light") then
      return {group = "Variable", fg = ucolors.darken(ucolors.blend(identifier()[1], colors.kat.fg.sixth.color, 0.5), 0.4), bg = "SKIP", ctermfg = groups.selectionBG()[2], ctermbg = "SKIP"}
    else
      return {group = "Variable", fg = ucolors.brighten(ucolors.blend(identifier()[1], colors.kat.fg.sixth.color, 0.5), 0.4), bg = "SKIP", ctermfg = groups.selectionBG()[2], ctermbg = "SKIP"}
    end
  end
  local function _3_()
    if ((main["background-mut"])[1] == "light") then
      return {group = "Keyword", fg = ucolors.darken(ucolors.blend(statement()[1], colors.kat.green.auto.color, 0.2), 0.5), bg = "SKIP", ctermfg = groups.auxBG()[3], ctermbg = "SKIP", italic = true}
    else
      return {group = "Keyword", fg = ucolors.brighten(ucolors.blend(statement()[1], colors.kat.green.auto.color, 0.2), 0.5), bg = "SKIP", ctermfg = groups.auxBG()[3], ctermbg = "SKIP", italic = true}
    end
  end
  return {{group = "Comment", fg = colors.kat.bg.meld.color, bg = "SKIP", ctermfg = groups.selectionBG()[3], ctermbg = "SKIP", [vim.g.kat_nvim_commentStyle] = true}, {group = "Constant", fg = colors.kat.pink.base.color, bg = "SKIP", ctermfg = groups.fillBG()[2], ctermbg = "SKIP"}, {group = "String", fg = colors.kat.green.auto.color, bg = "SKIP", ctermfg = groups.auxBG()[3], ctermbg = "SKIP"}, {group = "Character", fg = ucolors.blend(colors.kat.green.auto.color, colors.kat.fg.auto.color, 0.5), bg = "SKIP", ctermfg = groups.auxBG()[3], ctermbg = "SKIP", bold = true}, {group = "Number", fg = colors.kat.pink.base.color, bg = "SKIP", ctermfg = groups.fillBG()[2], ctermbg = "SKIP"}, {group = "Float", fg = ucolors.blend(colors.kat.pink.base.color, colors.kat.fg.auto.color, 0.7), bg = "SKIP", ctermfg = groups.fillBG()[3], ctermbg = "SKIP"}, {group = "Boolean", fg = ucolors.blend(colors.kat.blue.base.color, colors.kat.fg.auto.color, 0.7), bg = "SKIP", ctermfg = groups.selectionBG()[3], ctermbg = "SKIP", bold = true}, {group = "Identifier", fg = identifier()[1], bg = "SKIP", ctermfg = identifier()[2], ctermbg = "SKIP"}, {group = "Function", fg = ucolors.saturation(ucolors.brighten(ucolors.blend(identifier()[1], colors.kat.red.base.color, 0.3), 0.1), 0.5), bg = "SKIP", ctermfg = groups.warningBG()[2], ctermbg = "SKIP", bold = true}, _1_, {group = "Statement", fg = statement()[1], bg = "SKIP", ctermfg = statement()[2], ctermbg = "SKIP", bold = true}, {group = "Conditional", fg = ucolors.brighten(ucolors.blend(statement()[1], colors.kat.purple.base.color, 0.2), 0.1), bg = "SKIP", ctermfg = groups.highlightBG()[2], ctermbg = "SKIP"}, {group = "Repeat", fg = ucolors.saturation(ucolors.brighten(ucolors.blend(statement()[1], colors.kat.orange.base.color, 0.2), 0.3), 0.8), bg = "SKIP", ctermfg = groups.infoBG()[2], ctermbg = "SKIP"}, {group = "Label", fg = ucolors.saturation(ucolors.blend(statement()[1], colors.kat.pink.base.color, 0.2), 1), bg = "SKIP", ctermfg = groups.fillBG()[2], ctermbg = "SKIP", bold = true}, {group = "Operator", fg = ucolors.blend(statement()[1], colors.kat.fg.meld.color, 0.2), bg = "SKIP", ctermfg = groups.mainFG()[2], ctermbg = "SKIP", bold = true}, _3_, {group = "Exception", fg = ucolors.brighten(ucolors.blend(statement()[1], colors.kat.blue.base.color, 0.1), 0.2), bg = "SKIP", ctermfg = groups.selectionBG()[2], ctermbg = "SKIP"}, {group = "PreProc", fg = preproc()[1], bg = "SKIP", ctermfg = preproc()[2], ctermbg = "SKIP", bold = true, italic = true}, {group = "Include", fg = ucolors.blend(preproc()[1], colors.kat.red.base.color, 0.2), bg = "SKIP", ctermfg = preproc()[2], ctermbg = "SKIP", bold = true, italic = true}, {group = "Define", fg = ucolors.blend(preproc()[1], colors.kat.purple.base.color, 0.2), bg = "SKIP", ctermfg = groups.highlightBG()[3], ctermbg = "SKIP", bold = true, italic = true}, {group = "Macro", fg = ucolors.blend(preproc()[1], colors.kat.blue.base.color, 0.2), bg = "SKIP", ctermfg = groups.selectionBG()[3], ctermbg = "SKIP", bold = true, italic = true}, {group = "PreCondit", fg = ucolors.blend(preproc()[1], colors.kat.green.auto.color, 0.2), bg = "SKIP", ctermfg = groups.auxBG()[3], ctermbg = "SKIP", bold = true, italic = true}, {group = "Type", fg = typeDef()[1], bg = "SKIP", ctermfg = typeDef()[2], ctermbg = "SKIP", bold = true}, {group = "StorageClass", fg = ucolors.blend(typeDef()[1], colors.kat.green.auto.color, 0.2), bg = "SKIP", ctermfg = typeDef()[2], ctermbg = "SKIP", bold = true}, {group = "Structure", fg = ucolors.blend(typeDef()[1], colors.kat.blue.base.color, 0.2), bg = "SKIP", ctermfg = typeDef()[2], ctermbg = "SKIP", bold = true}, {group = "Typedef", fg = ucolors.saturation(ucolors.blend(typeDef()[1], colors.kat.bg.sixth.color, 0.2), 1), bg = "SKIP", ctermfg = typeDef()[2], ctermbg = "SKIP", bold = true}, {group = "Special", fg = special()[1], bg = "SKIP", ctermfg = special()[2], ctermbg = "SKIP"}, {group = "SpecialChar", fg = ucolors.blend(special()[1], colors.kat.fg.auto.color, 0.8), bg = "SKIP", ctermfg = special()[2], ctermbg = "SKIP", bold = true}, {group = "Tag", fg = ucolors.blend(special()[1], colors.kat.red.base.color, 0.2), bg = "SKIP", ctermfg = special()[2], ctermbg = "SKIP", bold = true}, {group = "Delimiter", fg = ucolors.blend(ucolors.blend(colors.kat.bg.sixth.color, colors.kat.fg.auto.color, 0.8), special()[1], 0.8), bg = "SKIP", ctermfg = special()[2], ctermbg = "SKIP", bold = true}, {group = "SpecialComment", fg = ucolors.blend(special()[1], colors.kat.bg.meld.color, 0.2), bg = "SKIP", ctermfg = special()[2], ctermbg = "SKIP", [vim.g.kat_nvim_commentStyle] = true}, {group = "Debug", fg = ucolors.blend(special()[1], colors.kat.green.auto.color, 0.2), bg = "SKIP", ctermfg = special()[2], ctermbg = "SKIP", bold = true}, {group = "Underlined", fg = colors.kat.bg.sixth.color, bg = "SKIP", ctermfg = groups.umbraFG()[2], ctermbg = "SKIP", underline = true, sp = colors.kat.bg.sixth.color}, {group = "Error", fg = colors.kat.fg.auto.color, bg = colors.kat.red.base.color, ctermfg = groups.errorFG()[2], ctermbg = groups.errorBG()[2], bold = true}, {group = "Todo", fg = colors.kat.bg.base.color, bg = ucolors.blend(colors.kat.orange.base.color, colors.kat.fg.auto.color, 0.9), ctermfg = groups.infoFG()[2], ctermbg = groups.infoBG()[2]}, {group = "Ignore", fg = colors.kat.fg.meld.color, bg = "SKIP", ctermfg = groups.umbraFG()[2], ctermbg = "SKIP"}, {group = "DiffDelete", fg = colors.kat.fg.auto.color, bg = ucolors.darken(colors.kat.red.base.color, 0.2), ctermfg = groups.mainFG()[2], ctermbg = groups.errorBG()[2], bold = true}, {group = "DiffAdd", fg = "SKIP", bg = colors.kat.green.auto.color, ctermfg = groups.mainFG()[2], ctermbg = groups.auxBG()[2], bold = true}, {group = "DiffChange", fg = "SKIP", bg = colors.kat.purple.base.color, ctermfg = groups.mainFG()[2], ctermbg = groups.highlightBG()[2], bold = true}, {group = "DiffText", fg = "SKIP", bg = colors.kat.blue.base.color, ctermfg = groups.mainFG()[2], ctermbg = groups.selectionBG()[2], bold = true}, {group = "diffAdded", fg = ucolors.blend(colors.kat.green.auto.color, colors.kat.fg.auto.color, 0.4), bg = ucolors.blend(colors.kat.green.auto.color, colors.kat.bg.base.color, 0.6), ctermfg = groups.mainFG()[2], ctermbg = groups.auxBG()[3], bold = true}, {group = "diffChanged", fg = ucolors.blend(colors.kat.blue.base.color, colors.kat.fg.auto.color, 0.4), bg = ucolors.blend(colors.kat.blue.base.color, colors.kat.bg.base.color, 0.6), ctermfg = groups.mainFG()[2], ctermbg = groups.selectionBG()[3], bold = true}, {group = "diffRemoved", fg = ucolors.blend(colors.kat.red.base.color, colors.kat.fg.auto.color, 0.4), bg = ucolors.blend(colors.kat.red.base.color, colors.kat.bg.base.color, 0.6), ctermfg = groups.mainFG()[2], ctermbg = groups.warningBG()[2], bold = true}}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a