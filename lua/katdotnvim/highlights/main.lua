local _2afile_2a = "fnl/katdotnvim/highlights/main.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.main"
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
local colors, main, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["ucolors"] = ucolors
local function mainFG()
  local output = {}
  if ((vim.o.background == "dark") and (main.katContrast == "soft")) then
    output[1] = ucolors.brighten((colors.init("foreground"))[1], 0.8)
    do end (output)[2] = 7
  else
    output[1] = (colors.init("foreground"))[1]
    output[2] = 7
  end
  return output
end
_2amodule_2a["mainFG"] = mainFG
local function mainBG()
  return {(colors.init("background"))[1], 0}
end
_2amodule_2a["mainBG"] = mainBG
local function umbraFG()
  return {(colors.init("foreground"))[2], 15}
end
_2amodule_2a["umbraFG"] = umbraFG
local function umbraBG()
  return {(colors.init("background"))[2], 8}
end
_2amodule_2a["umbraBG"] = umbraBG
local function shadowFG()
  return {(colors.init("foreground"))[3]}
end
_2amodule_2a["shadowFG"] = shadowFG
local function shadowBG()
  return {(colors.init("background"))[3]}
end
_2amodule_2a["shadowBG"] = shadowBG
local function meldFG()
  return {(colors.init("foreground"))[4]}
end
_2amodule_2a["meldFG"] = meldFG
local function meldBG()
  return {(colors.init("background"))[4]}
end
_2amodule_2a["meldBG"] = meldBG
local function selectionFG()
  local output = {mainFG()[1], 7}
  return output
end
_2amodule_2a["selectionFG"] = selectionFG
local function selectionBG()
  return {(colors.init("normalColors")).blue, 4, 12}
end
_2amodule_2a["selectionBG"] = selectionBG
local function fillFG()
  local output = {mainFG()[1], 7}
  return output
end
_2amodule_2a["fillFG"] = fillFG
local function fillBG()
  return {(colors.init("normalColors")).pink, 5, 13}
end
_2amodule_2a["fillBG"] = fillBG
local function highlightFG()
  local output = {mainFG()[1], 7}
  return output
end
_2amodule_2a["highlightFG"] = highlightFG
local function highlightBG()
  return {(colors.init("normalColors")).purple, 6, 14}
end
_2amodule_2a["highlightBG"] = highlightBG
local function errorFG()
  local output = {mainFG()[1], 7}
  return output
end
_2amodule_2a["errorFG"] = errorFG
local function errorBG()
  return {(colors.init("normalColors")).red, 1}
end
_2amodule_2a["errorBG"] = errorBG
local function warningFG()
  local output = {mainFG()[1], 7}
  return output
end
_2amodule_2a["warningFG"] = warningFG
local function warningBG()
  local output = {ucolors.blendColors((colors.init("normalColors")).red, mainBG()[1], 0.7), 9}
  return output
end
_2amodule_2a["warningBG"] = warningBG
local function infoFG()
  local output = {mainBG()[1], 0}
  return output
end
_2amodule_2a["infoFG"] = infoFG
local function infoBG()
  return {(colors.init("normalColors")).orange, 3, 11}
end
_2amodule_2a["infoBG"] = infoBG
local function auxFG()
  local output = mainFG()[1]
  return output
end
_2amodule_2a["auxFG"] = auxFG
local function groupFunction()
  local output = ""
  if (vim.o.background == "light") then
    output = ucolors.saturation(ucolors.darken((colors.init("normalColors")).green, 0.5), 0.4)
  else
    output = ucolors.saturation(ucolors.brighten((colors.init("normalColors")).green, 0.5), -0.2)
  end
  return output
end
_2amodule_2a["groupFunction"] = groupFunction
local function auxBG()
  local output = {groupFunction(), 2, 10}
  return output
end
_2amodule_2a["auxBG"] = auxBG
local function init()
  ucolors.highlight("Normal", mainFG()[1], mainBG()[1], mainFG()[2], mainBG()[2])
  ucolors.highlight("NormalNC", mainFG()[1], mainBG()[1], mainFG()[2], mainBG()[2])
  ucolors.highlight("NormalFloat", mainFG()[1], shadowBG()[1], mainFG()[2], umbraBG()[2])
  ucolors.highlight("NonText", shadowFG()[1], mainBG()[1], umbraFG()[2], mainBG()[2])
  ucolors.highlight("MatchParen", "SKIP", shadowBG()[1], "SKIP", umbraBG()[2], "bold")
  ucolors.highlight("SpecialKey", ucolors.blendColors(errorBG()[1], mainBG()[1], 0.6), "NONE", warningBG()[2], "NONE", "italic")
  ucolors.highlight("Whitespace", (colors.init("foreground"))[5], "SKIP", umbraFG()[2], "SKIP")
  ucolors.highlight("EndOfBuffer", umbraFG()[1], "SKIP", umbraFG()[2], "SKIP", "bold")
  ucolors.highlight("Directory", ucolors.blendColors(ucolors.blendColors(infoBG()[1], mainFG()[1], 0.1), selectionBG()[1], 0.2), "SKIP", selectionBG()[2], "SKIP")
  ucolors.highlight("Conceal", shadowBG()[1], "NONE", umbraBG()[2], "NONE")
  ucolors.highlight("SpellBad", "SKIP", "SKIP", "SKIP", "NONE", "undercurl", errorBG()[1])
  ucolors.highlight("SpellCap", "SKIP", "SKIP", "SKIP", "NONE", "undercurl", selectionBG()[1])
  ucolors.highlight("SpellLocal", "SKIP", "SKIP", "SKIP", "NONE", "undercurl", auxBG()[1])
  ucolors.highlight("SpellRare", "SKIP", "SKIP", "SKIP", "NONE", "undercurl", fillBG()[1])
  ucolors.highlight("StatusLine", (colors.init("background"))[5], ucolors.blendColors(highlightBG()[1], mainBG()[1], 0.7), umbraBG()[2], highlightBG()[3], "bold")
  ucolors.highlight("StatusLineNC", ucolors.blendColors(highlightBG()[1], mainBG()[1], 0.7), (colors.init("background"))[5], umbraBG()[2], highlightBG()[3], "bold")
  if ((vim.o.background == "dark") and (main.katContrast == "soft")) then
    local color = ucolors.brighten(highlightFG()[1], 0.8)
    ucolors.highlight("TabLine", color, highlightBG()[1], highlightFG()[2], highlightBG()[2])
    ucolors.highlight("TabLineFill", fillBG()[1], fillBG()[1], fillBG()[2], fillBG()[2])
    ucolors.highlight("TabLineSel", color, selectionBG()[1], selectionFG()[2], selectionBG()[2], "bold")
  else
    ucolors.highlight("TabLine", highlightFG()[1], highlightBG()[1], highlightFG()[2], highlightBG()[2])
    ucolors.highlight("TabLineFill", fillBG()[1], fillBG()[1], fillBG()[2], fillBG()[2])
    ucolors.highlight("TabLineSel", selectionFG()[1], selectionBG()[1], selectionFG()[2], selectionBG()[2], "bold")
  end
  ucolors.highlight("Title", auxBG()[1], "NONE", auxBG()[2], "NONE", "bold")
  ucolors.highlight("Visual", "SKIP", ucolors.darken(selectionBG()[1], 0.2), "SKIP", warningBG()[2])
  ucolors.highlight("VisualNOS", "SKIP", ucolors.blendColors(selectionBG()[1], mainFG()[1], 0.5), "SKIP", warningBG()[2])
  ucolors.highlight("Pmenu", fillFG()[1], fillBG()[1], fillFG()[2], fillBG()[2])
  ucolors.highlight("PmenuSel", selectionFG()[1], selectionBG()[1], selectionFG()[2], selectionBG()[2])
  ucolors.highlight("PmenuSbar", highlightFG()[1], highlightBG()[1], highlightFG()[2], highlightBG()[2])
  ucolors.highlight("PmenuThumb", selectionFG()[1], selectionBG()[1], selectionFG()[2], selectionBG()[2])
  ucolors.highlight("WildMenu", selectionFG()[1], selectionBG()[1], selectionFG()[2], selectionBG()[2])
  ucolors.highlight("Question", ucolors.blendColors(auxBG()[1], mainFG()[1], 0.7), "SKIP", auxBG()[3], "SKIP", "bold,underline", auxBG()[1])
  ucolors.highlight("QuickFixLine", "SKIP", selectionBG()[1], "SKIP", selectionBG()[2])
  ucolors.highlight("Cursor", "SKIP", mainFG()[1], "SKIP", mainFG()[2], "reverse")
  ucolors.highlight("CursorIM", "SKIP", umbraFG()[1], "SKIP", umbraFG()[2], "reverse")
  ucolors.highlight("lCursor", "SKIP", shadowFG()[1], "SKIP", umbraFG()[2], "reverse")
  ucolors.highlight("CursorColumn", "SKIP", shadowBG()[1], "SKIP", umbraBG()[2])
  ucolors.highlight("CursorLine", "SKIP", shadowBG()[1], "SKIP", umbraBG()[2])
  ucolors.highlight("ColorColumn", "NONE", ucolors.blendColors(selectionBG()[1], mainFG()[1], 0.8), "NONE", selectionBG()[3], "bold")
  ucolors.highlight("TermCursor", "SKIP", mainFG()[1], "SKIP", mainFG()[2], "reverse")
  ucolors.highlight("TermCursorNC", "SKIP", umbraFG()[1], "SKIP", umbraFG()[2], "reverse")
  ucolors.highlight("ErrorMsg", errorFG()[1], errorBG()[1], errorFG()[2], errorBG()[2], "bold")
  ucolors.highlight("WarningMsg", warningFG()[1], warningBG()[1], warningFG()[2], warningBG()[2])
  ucolors.highlight("VertSplit", shadowBG()[1], shadowFG()[1], umbraBG()[2], umbraFG()[2])
  ucolors.highlight("Folded", selectionFG()[1], shadowBG()[1], selectionFG()[2], umbraBG()[2], "bold")
  ucolors.highlight("FoldColumn", selectionBG()[1], "NONE", selectionBG()[2], "NONE", "bold")
  ucolors.highlight("SignColumn", "NONE", "NONE", "NONE", "NONE", "bold")
  ucolors.highlight("IncSearch", mainFG()[1], infoBG()[1], mainFG()[2], infoBG()[2], "NONE")
  ucolors.highlight("Substitute", infoFG()[1], ucolors.blendColors(infoBG()[1], mainFG()[1], 0.7), infoFG()[2], infoBG()[3])
  ucolors.highlight("Search", infoFG()[1], ucolors.blendColors(infoBG()[1], mainBG()[1], 0.7), infoFG()[2], infoBG()[2])
  ucolors.highlight("LineNr", fillBG()[1], "SKIP", fillBG()[2], "SKIP")
  ucolors.highlight("CursorLineNr", ucolors.blendColors(fillBG()[1], mainFG()[1], 0.6), "SKIP", fillBG()[3], "SKIP", "bold")
  ucolors.highlight("ModeMsg", mainFG()[1], shadowBG()[1], mainFG()[2], umbraBG()[2], "bold")
  ucolors.highlight("MsgArea", mainFG()[1], umbraBG()[1], mainFG()[2], umbraBG()[2])
  ucolors.highlight("MsgSeparator", mainFG()[1], umbraBG()[1], mainFG()[2], umbraBG()[2])
  ucolors.highlight("MoreMsg", auxBG()[1], "SKIP", auxBG()[2], "SKIP")
  ucolors.highlight("debugPC", "SKIP", ucolors.blendColors(selectionBG()[1], mainFG()[1], 0.6), "SKIP", selectionBG()[3])
  ucolors.highlight("debugBreakpoint", "SKIP", ucolors.blendColors(errorBG()[1], mainFG()[1], 0.6), "SKIP", warningBG()[2])
  if (vim.fn.has("gui") == 1) then
    ucolors.highlight("Menu", mainFG()[1], mainBG()[1], mainFG()[2], mainBG()[2])
    ucolors.highlight("Tooltip", fillFG()[1], fillBG()[1], fillFG()[2], fillBG()[2])
    return ucolors.highlight("Scrollbar", highlightFG()[1], highlightBG()[1], highlightFG()[2], highlightBG()[2])
  else
    return nil
  end
end
_2amodule_2a["init"] = init
return _2amodule_2a