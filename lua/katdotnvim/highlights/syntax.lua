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
local colors, groups, main, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["main"] = main
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
local function init()
  ucolors["highlight$"]("Comment", groups.meldBG()[1], "SKIP", groups.selectionBG()[3], "SKIP", vim.g.kat_nvim_commentStyle)
  ucolors["highlight$"]("Constant", groups.fillBG()[1], "SKIP", groups.fillBG()[2], "SKIP")
  ucolors["highlight$"]("String", groups.auxBG()[1], "SKIP", groups.auxBG()[3], "SKIP")
  ucolors["highlight$"]("Character", ucolors.blend(groups.auxBG()[1], groups.mainFG()[1], 0.5), "SKIP", groups.auxBG()[3], "SKIP", "bold")
  ucolors["highlight$"]("Number", groups.fillBG()[1], "SKIP", groups.fillBG()[2], "SKIP")
  ucolors["highlight$"]("Float", ucolors.blend(groups.fillBG()[1], groups.mainFG()[1], 0.7), "SKIP", groups.fillBG()[3], "SKIP")
  ucolors["highlight$"]("Boolean", ucolors.blend(groups.selectionBG()[1], groups.mainFG()[1], 0.7), "SKIP", groups.selectionBG()[3], "SKIP", "bold")
  ucolors["highlight$"]("Identifier", identifier()[1], "SKIP", identifier()[2], "SKIP")
  ucolors["highlight$"]("Function", ucolors.saturation(ucolors.brighten(ucolors.blend(identifier()[1], groups.errorBG()[1], 0.3), 0.1), 0.5), "SKIP", groups.warningBG()[2], "SKIP", "bold")
  if (vim.o.background == "light") then
    ucolors["highlight$"]("Variable", ucolors.darken(ucolors.blend(identifier()[1], colors.foreground()[6], 0.5), 0.4), "SKIP", groups.selectionBG()[2], "SKIP")
  else
    ucolors["highlight$"]("Variable", ucolors.brighten(ucolors.blend(identifier()[1], colors.foreground()[6], 0.5), 0.4), "SKIP", groups.selectionBG()[2], "SKIP")
  end
  ucolors["highlight$"]("Statement", statement()[1], "SKIP", statement()[2], "SKIP", "bold")
  ucolors["highlight$"]("Conditional", ucolors.brighten(ucolors.blend(statement()[1], groups.highlightBG()[1], 0.2), 0.1), "SKIP", groups.highlightBG()[2], "SKIP")
  ucolors["highlight$"]("Repeat", ucolors.saturation(ucolors.brighten(ucolors.blend(statement()[1], groups.infoBG()[1], 0.2), 0.3), 0.8), "SKIP", groups.infoBG()[2], "SKIP")
  ucolors["highlight$"]("Label", ucolors.saturation(ucolors.blend(statement()[1], groups.fillBG()[1], 0.2), 1), "SKIP", groups.fillBG()[2], "SKIP", "bold")
  ucolors["highlight$"]("Operator", ucolors.blend(statement()[1], groups.meldFG()[1], 0.2), "SKIP", groups.mainFG()[2], "SKIP", "bold")
  if (vim.o.background == "light") then
    ucolors["highlight$"]("Keyword", ucolors.darken(ucolors.blend(statement()[1], groups.auxBG()[1], 0.2), 0.5), "SKIP", groups.auxBG()[3], "SKIP", "italic")
  else
    ucolors["highlight$"]("Keyword", ucolors.brighten(ucolors.blend(statement()[1], groups.auxBG()[1], 0.2), 0.5), "SKIP", groups.auxBG()[3], "SKIP", "italic")
  end
  ucolors["highlight$"]("Exception", ucolors.brighten(ucolors.blend(statement()[1], groups.selectionBG()[1], 0.1), 0.2), "SKIP", groups.selectionBG()[2], "SKIP")
  ucolors["highlight$"]("PreProc", preproc()[1], "SKIP", preproc()[2], "SKIP", "bold,italic")
  ucolors["highlight$"]("Include", ucolors.blend(preproc()[1], groups.errorBG()[1], 0.2), "SKIP", preproc()[2], "SKIP", "bold,italic")
  ucolors["highlight$"]("Define", ucolors.blend(preproc()[1], groups.highlightBG()[1], 0.2), "SKIP", groups.highlightBG()[3], "SKIP", "bold,italic")
  ucolors["highlight$"]("Macro", ucolors.blend(preproc()[1], groups.selectionBG()[1], 0.2), "SKIP", groups.selectionBG()[3], "SKIP", "bold,italic")
  ucolors["highlight$"]("PreCondit", ucolors.blend(preproc()[1], groups.auxBG()[1], 0.2), "SKIP", groups.auxBG()[3], "SKIP", "bold,italic")
  ucolors["highlight$"]("Type", typeDef()[1], "SKIP", typeDef()[2], "SKIP", "bold")
  ucolors["highlight$"]("StorageClass", ucolors.blend(typeDef()[1], groups.auxBG()[1], 0.2), "SKIP", typeDef()[2], "SKIP", "bold")
  ucolors["highlight$"]("Structure", ucolors.blend(typeDef()[1], groups.selectionBG()[1], 0.2), "SKIP", typeDef()[2], "SKIP", "bold")
  ucolors["highlight$"]("Typedef", ucolors.saturation(ucolors.blend(typeDef()[1], colors.background()[6], 0.2), 1), "SKIP", typeDef()[2], "SKIP", "bold")
  ucolors["highlight$"]("Special", special()[1], "SKIP", special()[2], "SKIP")
  ucolors["highlight$"]("SpecialChar", ucolors.blend(special()[1], groups.mainFG()[1], 0.8), "SKIP", special()[2], "SKIP", "bold")
  ucolors["highlight$"]("Tag", ucolors.blend(special()[1], groups.errorBG()[1], 0.2), "SKIP", special()[2], "SKIP", "bold")
  ucolors["highlight$"]("Delimiter", ucolors.blend(special()[1], ucolors.blend(colors.background()[6], groups.mainFG()[1], 0.8), 0.2), "SKIP", special()[2], "SKIP", "bold")
  ucolors["highlight$"]("SpecialComment", ucolors.blend(special()[1], groups.meldBG()[1], 0.2), "SKIP", special()[2], "SKIP", vim.g.kat_nvim_commentStyle)
  ucolors["highlight$"]("Debug", ucolors.blend(special()[1], groups.auxBG()[1], 0.2), "SKIP", special()[2], "SKIP", "bold")
  ucolors["highlight$"]("Underlined", colors.background()[6], "SKIP", groups.umbraFG()[2], "SKIP", "underline", colors.background()[6])
  ucolors["highlight$"]("Error", groups.errorFG()[1], groups.errorBG()[1], groups.errorFG()[2], groups.errorBG()[2], "bold")
  ucolors["highlight$"]("Todo", groups.infoFG()[1], ucolors.blend(groups.infoBG()[1], groups.mainFG()[1], 0.9), groups.infoFG()[2], groups.infoBG()[2])
  ucolors["highlight$"]("Ignore", groups.meldFG()[1], "SKIP", groups.umbraFG()[2], "SKIP")
  ucolors["highlight$"]("DiffDelete", groups.mainFG()[1], ucolors.darken(groups.errorBG()[1], 0.2), groups.mainFG()[2], groups.errorBG()[2], "bold")
  ucolors["highlight$"]("DiffAdd", "SKIP", groups.auxBG()[1], groups.mainFG()[2], groups.auxBG()[2], "bold")
  ucolors["highlight$"]("DiffChange", "SKIP", groups.highlightBG()[1], groups.mainFG()[2], groups.highlightBG()[2], "bold")
  ucolors["highlight$"]("DiffText", "SKIP", groups.selectionBG()[1], groups.mainFG()[2], groups.selectionBG()[2], "bold")
  ucolors["highlight$"]("diffAdded", ucolors.blend(groups.auxBG()[1], groups.mainFG()[1], 0.4), ucolors.blend(groups.auxBG()[1], groups.mainBG()[1], 0.6), groups.mainFG()[2], groups.auxBG()[3], "bold")
  ucolors["highlight$"]("diffChanged", ucolors.blend(groups.selectionBG()[1], groups.mainFG()[1], 0.4), ucolors.blend(groups.selectionBG()[1], groups.mainBG()[1], 0.6), groups.mainFG()[2], groups.selectionBG()[3], "bold")
  return ucolors["highlight$"]("diffRemoved", ucolors.blend(groups.errorBG()[1], groups.mainFG()[1], 0.4), ucolors.blend(groups.errorBG()[1], groups.mainBG()[1], 0.6), groups.mainFG()[2], groups.warningBG()[2], "bold")
end
_2amodule_2a["init"] = init
return _2amodule_2a