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
  return (colors.init("foreground"))[1]
end
_2amodule_2a["mainFG"] = mainFG
local function mainBG()
  return (colors.init("background"))[1]
end
_2amodule_2a["mainBG"] = mainBG
local function umbraFG()
  return (colors.init("foreground"))[2]
end
_2amodule_2a["umbraFG"] = umbraFG
local function umbraBG()
  return (colors.init("background"))[2]
end
_2amodule_2a["umbraBG"] = umbraBG
local function shadowFG()
  return (colors.init("foreground"))[3]
end
_2amodule_2a["shadowFG"] = shadowFG
local function shadowBG()
  return (colors.init("background"))[3]
end
_2amodule_2a["shadowBG"] = shadowBG
local function meldFG()
  return (colors.init("foreground"))[4]
end
_2amodule_2a["meldFG"] = meldFG
local function meldBG()
  return (colors.init("background"))[4]
end
_2amodule_2a["meldBG"] = meldBG
local function selectionFG()
  local output = mainFG()
  do end (_2amodule_2a)["output"] = output
  return output
end
_2amodule_2a["selectionFG"] = selectionFG
local function selectionBG()
  return (colors.init("normalColors")).blue
end
_2amodule_2a["selectionBG"] = selectionBG
local function fillFG()
  local output = mainFG()
  do end (_2amodule_2a)["output"] = output
  return output
end
_2amodule_2a["fillFG"] = fillFG
local function fillBG()
  return (colors.init("normalColors")).pink
end
_2amodule_2a["fillBG"] = fillBG
local function highlightFG()
  local output = mainFG()
  do end (_2amodule_2a)["output"] = output
  return output
end
_2amodule_2a["highlightFG"] = highlightFG
local function highlightBG()
  return (colors.init("normalColors")).purple
end
_2amodule_2a["highlightBG"] = highlightBG
local function errorFG()
  local output = mainFG()
  do end (_2amodule_2a)["output"] = output
  return output
end
_2amodule_2a["errorFG"] = errorFG
local function errorBG()
  return (colors.init("normalColors")).red
end
_2amodule_2a["errorBG"] = errorBG
local function warningFG()
  local output = mainFG()
  do end (_2amodule_2a)["output"] = output
  return output
end
_2amodule_2a["warningFG"] = warningFG
local function warningBG()
  local output = ucolors.blendColors((colors.init("normalColors")).red, mainBG(), 0.7)
  do end (_2amodule_2a)["output"] = output
  return output
end
_2amodule_2a["warningBG"] = warningBG
local function infoFG()
  local output = mainBG()
  do end (_2amodule_2a)["output"] = output
  return output
end
_2amodule_2a["infoFG"] = infoFG
local function infoBG()
  return (colors.init("normalColors")).orange
end
_2amodule_2a["infoBG"] = infoBG
local function auxFG()
  local output = mainFG()
  do end (_2amodule_2a)["output"] = output
  return output
end
_2amodule_2a["auxFG"] = auxFG
local function groupFunction()
  local output = ""
  if (main.katStyle == "light") then
    output = ucolors.saturation(ucolors.darken((colors.init("normalColors")).green, 0.5), 0.4)
  else
    output = ucolors.saturation(ucolors.brighten((colors.init("normalColors")).green, 0.5), -0.2)
  end
  return output
end
_2amodule_2a["groupFunction"] = groupFunction
local function auxBG()
  local output = groupFunction()
  do end (_2amodule_2a)["output"] = output
  return output
end
_2amodule_2a["auxBG"] = auxBG
local function init()
  ucolors.highlight("Normal", mainFG(), mainBG())
  ucolors.highlight("NormalNC", mainFG(), mainBG())
  ucolors.highlight("NormalFloat", mainFG(), shadowBG())
  ucolors.highlight("NonText", shadowFG(), mainBG())
  ucolors.highlight("MatchParen", "SKIP", shadowBG(), "bold")
  ucolors.highlight("SpecialKey", ucolors.blendColors((colors.init("normalColors")).red, (colors.init("background"))[1], 0.6), "NONE", "italic")
  ucolors.highlight("Whitespace", (colors.init("foreground"))[6], "SKIP")
  ucolors.highlight("EndOfBuffer", umbraFG(), "SKIP", "bold")
  ucolors.highlight("Directory", ucolors.blendColors(ucolors.blendColors(infoBG(), mainFG(), 0.1), selectionBG(), 0.2), "SKIP")
  ucolors.highlight("Conceal", shadowBG(), "NONE")
  ucolors.highlight("SpellBad", "SKIP", "SKIP", "undercurl", (colors.init("normalColors")).red)
  ucolors.highlight("SpellCap", "SKIP", "SKIP", "undercurl", (colors.init("normalColors")).blue)
  ucolors.highlight("SpellLocal", "SKIP", "SKIP", "undercurl", (colors.init("normalColors")).green)
  ucolors.highlight("SpellRare", "SKIP", "SKIP", "undercurl", (colors.init("normalColors")).pink)
  ucolors.highlight("StatusLine", (colors.init("background"))[5], ucolors.blendColors((colors.init("normalColors")).purple, (colors.init("background"))[1], 0.7), "bold")
  ucolors.highlight("StatusLineNC", ucolors.blendColors((colors.init("normalColors")).purple, (colors.init("background"))[1], 0.7), (colors.init("background"))[5], "bold")
  ucolors.highlight("TabLine", highlightFG(), highlightBG(), "NONE")
  ucolors.highlight("TabLineFill", fillBG(), fillBG())
  ucolors.highlight("TabLineSel", selectionFG(), selectionBG(), "bold")
  ucolors.highlight("Title", (colors.init("normalColors")).green, "NONE", "bold")
  ucolors.highlight("Visual", "SKIP", ucolors.darken((colors.init("normalColors")).red, 0.2))
  ucolors.highlight("VisualNOS", "SKIP", ucolors.blendColors((colors.init("normalColors")).red, (colors.init("foreground"))[1], 0.5))
  ucolors.highlight("Pmenu", fillFG(), fillBG())
  ucolors.highlight("PmenuSel", selectionFG(), selectionBG())
  ucolors.highlight("PmenuSbar", highlightFG(), highlightBG())
  ucolors.highlight("PmenuThumb", selectionFG(), selectionBG())
  ucolors.highlight("WildMenu", selectionFG(), selectionBG())
  ucolors.highlight("Question", ucolors.blendColors((colors.init("normalColors")).green, (colors.init("foreground"))[1], 0.7), "SKIP", "bold,underline", (colors.init("normalColors")).green)
  ucolors.highlight("QuickFixLine", "SKIP", selectionBG())
  ucolors.highlight("Cursor", "SKIP", (colors.init("foreground"))[1], "reverse")
  ucolors.highlight("CursorIM", "SKIP", (colors.init("foreground"))[3], "reverse")
  ucolors.highlight("lCursor", "SKIP", (colors.init("foreground"))[2], "reverse")
  ucolors.highlight("CursorColumn", "SKIP", (colors.init("background"))[2])
  ucolors.highlight("CursorLine", "SKIP", (colors.init("background"))[2])
  ucolors.highlight("ColorColumn", "NONE", ucolors.blendColors(selectionBG(), (colors.init("foreground"))[1], 0.8), "bold")
  ucolors.highlight("TermCursor", "SKIP", (colors.init("foreground"))[1], "reverse")
  ucolors.highlight("TermCursorNC", "SKIP", (colors.init("foreground"))[3], "reverse")
  ucolors.highlight("ErrorMsg", errorFG(), errorBG(), "bold")
  ucolors.highlight("WarningMsg", warningFG(), warningBG())
  ucolors.highlight("VertSplit", shadowBG(), shadowFG())
  ucolors.highlight("Folded", selectionFG(), shadowBG(), "bold")
  ucolors.highlight("FoldColumn", selectionBG(), "NONE", "bold")
  ucolors.highlight("SignColumn", "NONE", "NONE", "bold")
  ucolors.highlight("IncSearch", mainFG(), infoBG(), "NONE")
  ucolors.highlight("Substitute", infoFG(), ucolors.blendColors(infoBG(), mainFG(), 0.7))
  ucolors.highlight("Search", infoFG(), ucolors.blendColors(infoBG(), mainBG(), 0.7))
  ucolors.highlight("LineNr", fillBG(), "SKIP")
  ucolors.highlight("CursorLineNr", ucolors.blendColors(fillBG(), mainFG(), 0.6), "SKIP", "bold")
  ucolors.highlight("ModeMsg", mainFG(), shadowBG(), "bold")
  ucolors.highlight("MsgArea", mainFG(), umbraBG())
  ucolors.highlight("MsgSeparator", mainFG(), umbraBG())
  ucolors.highlight("MoreMsg", auxBG(), "SKIP")
  ucolors.highlight("debugPC", "SKIP", ucolors.blendColors(selectionBG(), mainFG(), 0.6))
  ucolors.highlight("debugBreakpoint", "SKIP", ucolors.blendColors(errorBG(), mainFG(), 0.6))
  if (vim.fn.has("gui") == 1) then
    ucolors.highlight("Menu", mainFG(), mainBG())
    ucolors.highlight("Tooltip", fillFG(), fillBG())
    return ucolors.highlight("Scrollbar", highlightFG(), highlightBG())
  else
    return nil
  end
end
_2amodule_2a["init"] = init