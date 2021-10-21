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
local colors, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["ucolors"] = ucolors
local mainFG = colors.foreground[1]
_2amodule_2a["mainFG"] = mainFG
local mainBG = colors.background[1]
_2amodule_2a["mainBG"] = mainBG
local umbraFG = colors.foreground[2]
_2amodule_2a["umbraFG"] = umbraFG
local umbraBG = colors.background[2]
_2amodule_2a["umbraBG"] = umbraBG
local shadowFG = colors.foreground[3]
_2amodule_2a["shadowFG"] = shadowFG
local shadowBG = colors.background[3]
_2amodule_2a["shadowBG"] = shadowBG
local meldFG = colors.foreground[4]
_2amodule_2a["meldFG"] = meldFG
local meldBG = colors.background[4]
_2amodule_2a["meldBG"] = meldBG
local selectionFG = mainFG
_2amodule_2a["selectionFG"] = selectionFG
local selectionBG = colors.normalColors.blue
_2amodule_2a["selectionBG"] = selectionBG
local fillFG = mainFG
_2amodule_2a["fillFG"] = fillFG
local fillBG = colors.normalColors.pink
_2amodule_2a["fillBG"] = fillBG
local highlightFG = mainFG
_2amodule_2a["highlightFG"] = highlightFG
local highlightBG = colors.normalColors.purple
_2amodule_2a["highlightBG"] = highlightBG
local errorFG = mainFG
_2amodule_2a["errorFG"] = errorFG
local errorBG = colors.normalColors.red
_2amodule_2a["errorBG"] = errorBG
local warningFG = mainFG
_2amodule_2a["warningFG"] = warningFG
local warningBG = ucolors.blendColors(colors.normalColors.red, mainBG, 0.7)
do end (_2amodule_2a)["warningBG"] = warningBG
local infoFG = mainBG
_2amodule_2a["infoFG"] = infoFG
local infoBG = colors.normalColors.orange
_2amodule_2a["infoBG"] = infoBG
local auxFG = mainFG
_2amodule_2a["auxFG"] = auxFG
local function groupFunction()
  local output = ""
  if (vim.g.kat_nvim_settings.style == "light") then
    output = ucolors.saturation(ucolors.darken(colors.normalColors.green, 0.5), 0.4)
  else
    output = ucolors.saturation(ucolors.brighten(colors.normalColors.green, 0.5), -0.2)
  end
  return output
end
_2amodule_2a["groupFunction"] = groupFunction
local auxBG = groupFunction()
do end (_2amodule_2a)["auxBG"] = auxBG
local function init()
  ucolors.highlight("Normal", mainFG, mainBG)
  ucolors.highlight("NormalNC", mainFG, mainBG)
  ucolors.highlight("NormalFloat", mainFG, shadowBG)
  ucolors.highlight("NonText", shadowFG, mainBG)
  ucolors.highlight("MatchParen", "SKIP", shadowBG, "bold")
  ucolors.highlight("SpecialKey", ucolors.blendColors(colors.normalColors.red, colors.background[1], 0.6), "NONE", "italic")
  ucolors.highlight("Whitespace", colors.foreground[6], "SKIP")
  ucolors.highlight("EndOfBuffer", umbraFG, "SKIP", "bold")
  ucolors.highlight("Directory", ucolors.blendColors(ucolors.blendColors(infoBG, mainFG, 0.1), selectionBG, 0.2), "SKIP")
  ucolors.highlight("Conceal", shadowBG, "NONE")
  ucolors.highlight("SpellBad", "SKIP", "SKIP", "undercurl", colors.normalColors.red)
  ucolors.highlight("SpellCap", "SKIP", "SKIP", "undercurl", colors.normalColors.blue)
  ucolors.highlight("SpellLocal", "SKIP", "SKIP", "undercurl", colors.normalColors.green)
  ucolors.highlight("SpellRare", "SKIP", "SKIP", "undercurl", colors.normalColors.pink)
  ucolors.highlight("StatusLine", colors.background[5], ucolors.blendColors(colors.normalColors.purple, colors.background[1], 0.7), "bold")
  ucolors.highlight("StatusLineNC", ucolors.blendColors(colors.normalColors.purple, colors.background[1], 0.7), colors.background[5], "bold")
  ucolors.highlight("TabLine", highlightFG, highlightBG, "NONE")
  ucolors.highlight("TabLineFill", fillBG, fillBG)
  ucolors.highlight("TabLineSel", selectionFG, selectionBG, "bold")
  ucolors.highlight("Title", colors.normalColors.green, "NONE", "bold")
  ucolors.highlight("Visual", "SKIP", ucolors.darken(colors.normalColors.red, 0.2))
  ucolors.highlight("VisualNOS", "SKIP", ucolors.blendColors(colors.normalColors.red, colors.foreground[1], 0.5))
  ucolors.highlight("Pmenu", fillFG, fillBG)
  ucolors.highlight("PmenuSel", selectionFG, selectionBG)
  ucolors.highlight("PmenuSbar", highlightFG, highlightBG)
  ucolors.highlight("PmenuThumb", selectionFG, selectionBG)
  ucolors.highlight("WildMenu", selectionFG, selectionBG)
  ucolors.highlight("Question", ucolors.blendColors(colors.normalColors.green, colors.foreground[1], 0.7), "SKIP", "bold,underline", colors.normalColors.green)
  ucolors.highlight("QuickFixLine", "SKIP", selectionBG)
  ucolors.highlight("Cursor", "SKIP", colors.foreground[1], "reverse")
  ucolors.highlight("CursorIM", "SKIP", colors.foreground[3], "reverse")
  ucolors.highlight("lCursor", "SKIP", colors.foreground[2], "reverse")
  ucolors.highlight("CursorColumn", "SKIP", colors.background[2])
  ucolors.highlight("CursorLine", "SKIP", colors.background[2])
  ucolors.highlight("ColorColumn", "NONE", ucolors.blendColors(selectionBG, colors.foreground[1], 0.8), "bold")
  ucolors.highlight("TermCursor", "SKIP", colors.foreground[1], "reverse")
  ucolors.highlight("TermCursorNC", "SKIP", colors.foreground[3], "reverse")
  ucolors.highlight("ErrorMsg", errorFG, errorBG, "bold")
  ucolors.highlight("WarningMsg", warningFG, warningBG)
  ucolors.highlight("VertSplit", shadowBG, shadowFG)
  ucolors.highlight("Folded", selectionFG, shadowBG, "bold")
  ucolors.highlight("FoldColumn", selectionBG, "NONE", "bold")
  ucolors.highlight("SignColumn", "SKIP", "SKIP", "bold")
  ucolors.highlight("IncSearch", infoFG, infoBG, "NONE")
  ucolors.highlight("Substitute", infoFG, ucolors.blendColors(infoBG, mainFG, 0.7))
  ucolors.highlight("Search", infoFG, ucolors.blendColors(infoBG, mainBG, 0.7))
  ucolors.highlight("LineNr", fillBG, "SKIP")
  ucolors.highlight("CursorLineNr", ucolors.blendColors(fillBG, mainFG, 0.6), "SKIP", "bold")
  ucolors.highlight("ModeMsg", mainFG, shadowBG, "bold")
  ucolors.highlight("MsgArea", mainFG, umbraBG)
  ucolors.highlight("MsgSeparator", mainFG, umbraBG)
  ucolors.highlight("MoreMsg", auxBG, "SKIP")
  ucolors.highlight("debugPC", "SKIP", ucolors.blendColors(selectionBG, mainFG, 0.6))
  ucolors.highlight("debugBreakpoint", "SKIP", ucolors.blendColors(errorBG, mainFG, 0.6))
  if (vim.fn.has("gui") == 1) then
    ucolors.highlight("Menu", mainFG, mainBG)
    ucolors.highlight("Tooltip", fillFG, fillBG)
    return ucolors.highlight("Scrollbar", highlightFG, highlightBG)
  else
    return nil
  end
end
_2amodule_2a["init"] = init