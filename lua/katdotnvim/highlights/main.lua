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
local colors, main, run, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.highlight.run"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["run"] = run
_2amodule_locals_2a["ucolors"] = ucolors
local function mainFG()
  local output = {}
  if ((main.background == "dark") and (main.contrast == "soft")) then
    output[1] = ucolors.brighten(colors.foreground()[1], 0.8)
    do end (output)[2] = 7
  else
    output[1] = colors.foreground()[1]
    output[2] = 7
  end
  return output
end
_2amodule_2a["mainFG"] = mainFG
local function mainBG()
  return {colors.background()[1], 0}
end
_2amodule_2a["mainBG"] = mainBG
local function umbraFG()
  return {colors.foreground()[2], 15}
end
_2amodule_2a["umbraFG"] = umbraFG
local function umbraBG()
  return {colors.background()[2], 8}
end
_2amodule_2a["umbraBG"] = umbraBG
local function shadowFG()
  return {colors.foreground()[3], 16}
end
_2amodule_2a["shadowFG"] = shadowFG
local function shadowBG()
  return {colors.background()[3], 16}
end
_2amodule_2a["shadowBG"] = shadowBG
local function meldFG()
  return {colors.foreground()[4], 16}
end
_2amodule_2a["meldFG"] = meldFG
local function meldBG()
  return {colors.background()[4], 16}
end
_2amodule_2a["meldBG"] = meldBG
local function selectionFG()
  local output = {mainFG()[1], 7}
  return output
end
_2amodule_2a["selectionFG"] = selectionFG
local function selectionBG()
  return {(colors["normal-colors"]()).blue, 4, 12}
end
_2amodule_2a["selectionBG"] = selectionBG
local function fillFG()
  local output = {mainFG()[1], 7}
  return output
end
_2amodule_2a["fillFG"] = fillFG
local function fillBG()
  return {(colors["normal-colors"]()).pink, 5, 13}
end
_2amodule_2a["fillBG"] = fillBG
local function highlightFG()
  local output = {mainFG()[1], 7}
  return output
end
_2amodule_2a["highlightFG"] = highlightFG
local function highlightBG()
  return {(colors["normal-colors"]()).purple, 6, 14}
end
_2amodule_2a["highlightBG"] = highlightBG
local function errorFG()
  local output = {mainFG()[1], 7}
  return output
end
_2amodule_2a["errorFG"] = errorFG
local function errorBG()
  return {(colors["normal-colors"]()).red, 1}
end
_2amodule_2a["errorBG"] = errorBG
local function warningFG()
  local output = {mainFG()[1], 7}
  return output
end
_2amodule_2a["warningFG"] = warningFG
local function warningBG()
  local output = {ucolors.blend((colors["normal-colors"]()).red, mainBG()[1], 0.7), 9}
  return output
end
_2amodule_2a["warningBG"] = warningBG
local function infoFG()
  local output = {mainBG()[1], 0}
  return output
end
_2amodule_2a["infoFG"] = infoFG
local function infoBG()
  return {(colors["normal-colors"]()).orange, 3, 11}
end
_2amodule_2a["infoBG"] = infoBG
local function auxFG()
  local output = mainFG()[1]
  return output
end
_2amodule_2a["auxFG"] = auxFG
local function groupFunction()
  local output = ""
  if (main.background == "light") then
    output = ucolors.saturation(ucolors.darken((colors["normal-colors"]()).green, 0.5), 0.4)
  else
    output = ucolors.saturation(ucolors.brighten((colors["normal-colors"]()).green, 0.5), -0.2)
  end
  return output
end
_2amodule_2a["groupFunction"] = groupFunction
local function auxBG()
  local output = {groupFunction(), 2, 10}
  return output
end
_2amodule_2a["auxBG"] = auxBG
local function high_colors()
  local _3_
  if ((main.background == "dark") and (main.contrast == "soft")) then
    local color = ucolors.brighten(highlightFG()[1], 0)
    do local _ = {group = "TabLine", fg = color, bg = highlightBG()[1], ctermfg = highlightFG()[2], ctermbg = highlightBG()[2]} end
    do local _ = {group = "TabLineFill", fg = fillBG()[1], bg = fillBG()[1], ctermfg = fillBG()[2], ctermbg = fillBG()[2]} end
    _3_ = {group = "TabLineSel", fg = color, bg = selectionBG()[1], ctermfg = selectionFG()[2], ctermbg = selectionBG()[2], bold = true}
  else
    do local _ = {group = "TabLine", fg = highlightFG()[1], bg = highlightBG()[1], ctermfg = highlightFG()[2], ctermbg = highlightBG()[2]} end
    do local _ = {group = "TabLineFill", fg = fillBG()[1], bg = fillBG()[1], ctermfg = fillBG()[2], ctermbg = fillBG()[2]} end
    _3_ = {group = "TabLineSel", fg = selectionFG()[1], bg = selectionBG()[1], ctermfg = selectionFG()[2], ctermbg = selectionBG()[2], bold = true}
  end
  local function _5_()
    if (vim.fn.has("gui") == 1) then
      do local _ = {group = "Menu", fg = mainFG()[1], bg = mainBG()[1], ctermfg = mainFG()[2], ctermbg = mainBG()[2]} end
      do local _ = {group = "Tooltip", fg = fillFG()[1], bg = fillBG()[1], ctermfg = fillFG()[2], ctermbg = fillBG()[2]} end
      return {group = "Scrollbar", fg = highlightFG()[1], bg = highlightBG()[1], ctermfg = highlightFG()[2], ctermbg = highlightBG()[2]}
    else
      return nil
    end
  end
  return {{group = "Normal", fg = mainFG()[1], bg = mainBG()[1], ctermfg = mainFG()[2], ctermbg = mainBG()[2]}, {group = "NormalNC", fg = mainFG()[1], bg = mainBG()[1], ctermfg = mainFG()[2], ctermbg = mainBG()[2]}, {group = "NormalFloat", fg = mainFG()[1], bg = shadowBG()[1], ctermfg = mainFG()[2], ctermbg = umbraBG()[2]}, {group = "NonText", fg = shadowFG()[1], bg = mainBG()[1], ctermfg = umbraFG()[2], ctermbg = mainBG()[2]}, {group = "MatchParen", fg = "SKIP", bg = shadowBG()[1], ctermfg = "SKIP", ctermbg = umbraBG()[2], bold = true}, {group = "SpecialKey", fg = ucolors.blend(errorBG()[1], mainBG()[1], 0.6), bg = "NONE", ctermfg = warningBG()[2], ctermbg = "NONE", italic = true}, {group = "Whitespace", fg = colors.foreground()[5], bg = "SKIP", ctermfg = umbraFG()[2], ctermbg = "SKIP"}, {group = "EndOfBuffer", fg = umbraFG()[1], bg = "SKIP", ctermfg = umbraFG()[2], ctermbg = "SKIP", bold = true}, {group = "Directory", fg = ucolors.blend(ucolors.blend(infoBG()[1], mainFG()[1], 0.1), selectionBG()[1], 0.2), bg = "SKIP", ctermfg = selectionBG()[2], ctermbg = "SKIP"}, {group = "Conceal", fg = shadowBG()[1], bg = "NONE", ctermfg = umbraBG()[2], ctermbg = "NONE"}, {group = "SpellBad", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = errorBG()[1]}, {group = "SpellCap", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = selectionBG()[1]}, {group = "SpellLocal", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = auxBG()[1]}, {group = "SpellRare", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = fillBG()[1]}, {group = "StatusLine", fg = colors.background()[5], bg = ucolors.blend(highlightBG()[1], mainBG()[1], 0.7), ctermfg = umbraBG()[2], ctermbg = highlightBG()[3], bold = true}, {group = "StatusLineNC", fg = ucolors.blend(highlightBG()[1], mainBG()[1], 0.7), bg = colors.background()[5], ctermfg = umbraBG()[2], ctermbg = highlightBG()[3], bold = true}, _3_, {group = "Title", fg = auxBG()[1], bg = "NONE", ctermfg = auxBG()[2], ctermbg = "NONE", bold = true}, {group = "Visual", fg = "SKIP", bg = ucolors.darken(selectionBG()[1], 0.2), ctermfg = "SKIP", ctermbg = warningBG()[2]}, {group = "VisualNOS", fg = "SKIP", bg = ucolors.blend(selectionBG()[1], mainFG()[1], 0.5), ctermfg = "SKIP", ctermbg = warningBG()[2]}, {group = "Pmenu", fg = fillFG()[1], bg = fillBG()[1], ctermfg = fillFG()[2], ctermbg = fillBG()[2]}, {group = "PmenuSel", fg = selectionFG()[1], bg = selectionBG()[1], ctermfg = selectionFG()[2], ctermbg = selectionBG()[2]}, {group = "PmenuSbar", fg = highlightFG()[1], bg = highlightBG()[1], ctermfg = highlightFG()[2], ctermbg = highlightBG()[2]}, {group = "PmenuThumb", fg = selectionFG()[1], bg = selectionBG()[1], ctermfg = selectionFG()[2], ctermbg = selectionBG()[2]}, {group = "WildMenu", fg = selectionFG()[1], bg = selectionBG()[1], ctermfg = selectionFG()[2], ctermbg = selectionBG()[2]}, {group = "Question", fg = ucolors.blend(auxBG()[1], mainFG()[1], 0.7), bg = "SKIP", ctermfg = auxBG()[3], ctermbg = "SKIP", bold = true, underline = true, sp = auxBG()[1]}, {group = "QuickFixLine", fg = "SKIP", bg = selectionBG()[1], ctermfg = "SKIP", ctermbg = selectionBG()[2]}, {group = "Cursor", fg = "SKIP", bg = mainFG()[1], ctermfg = "SKIP", ctermbg = mainFG()[2], reverse = true}, {group = "CursorIM", fg = "SKIP", bg = umbraFG()[1], ctermfg = "SKIP", ctermbg = umbraFG()[2], reverse = true}, {group = "lCursor", fg = "SKIP", bg = shadowFG()[1], ctermfg = "SKIP", ctermbg = umbraFG()[2], reverse = true}, {group = "CursorColumn", fg = "SKIP", bg = shadowBG()[1], ctermfg = "SKIP", ctermbg = umbraBG()[2]}, {group = "CursorLine", fg = "SKIP", bg = shadowBG()[1], ctermfg = "SKIP", ctermbg = umbraBG()[2]}, {group = "ColorColumn", fg = "NONE", bg = ucolors.blend(selectionBG()[1], mainFG()[1], 0.8), ctermfg = "NONE", ctermbg = selectionBG()[3], bold = true}, {group = "TermCursor", fg = "SKIP", bg = mainFG()[1], ctermfg = "SKIP", ctermbg = mainFG()[2], reverse = true}, {group = "TermCursorNC", fg = "SKIP", bg = umbraFG()[1], ctermfg = "SKIP", ctermbg = umbraFG()[2], reverse = true}, {group = "ErrorMsg", fg = errorFG()[1], bg = errorBG()[1], ctermfg = errorFG()[2], ctermbg = errorBG()[2], bold = true}, {group = "WarningMsg", fg = warningFG()[1], bg = warningBG()[1], ctermfg = warningFG()[2], ctermbg = warningBG()[2]}, {group = "VertSplit", fg = shadowBG()[1], bg = shadowFG()[1], ctermfg = umbraBG()[2], ctermbg = umbraFG()[2]}, {group = "Folded", fg = selectionFG()[1], bg = shadowBG()[1], ctermfg = selectionFG()[2], ctermbg = umbraBG()[2], bold = true}, {group = "FoldColumn", fg = selectionBG()[1], bg = "NONE", ctermfg = selectionBG()[2], ctermbg = "NONE", bold = true}, {group = "SignColumn", fg = "NONE", bg = "NONE", ctermfg = "NONE", ctermbg = "NONE", bold = true}, {group = "IncSearch", fg = mainFG()[1], bg = infoBG()[1], ctermfg = mainFG()[2], ctermbg = infoBG()[2], reverse = false}, {group = "Substitute", fg = infoFG()[1], bg = ucolors.blend(infoBG()[1], mainFG()[1], 0.7), ctermfg = infoFG()[2], ctermbg = infoBG()[3]}, {group = "Search", fg = infoFG()[1], bg = ucolors.blend(infoBG()[1], mainBG()[1], 0.7), ctermfg = infoFG()[2], ctermbg = infoBG()[2]}, {group = "LineNr", fg = fillBG()[1], bg = "SKIP", ctermfg = fillBG()[2], ctermbg = "SKIP"}, {group = "CursorLineNr", fg = ucolors.blend(fillBG()[1], mainFG()[1], 0.6), bg = "SKIP", ctermfg = fillBG()[3], ctermbg = "SKIP", bold = true}, {group = "ModeMsg", fg = mainFG()[1], bg = shadowBG()[1], ctermfg = mainFG()[2], ctermbg = umbraBG()[2], bold = true}, {group = "MsgArea", fg = mainFG()[1], bg = umbraBG()[1], ctermfg = mainFG()[2], ctermbg = umbraBG()[2]}, {group = "MsgSeparator", fg = mainFG()[1], bg = umbraBG()[1], ctermfg = mainFG()[2], ctermbg = umbraBG()[2]}, {group = "MoreMsg", fg = auxBG()[1], bg = "SKIP", ctermfg = auxBG()[2], ctermbg = "SKIP"}, {group = "debugPC", fg = "SKIP", bg = ucolors.blend(selectionBG()[1], mainFG()[1], 0.6), ctermfg = "SKIP", ctermbg = selectionBG()[3]}, {group = "debugBreakpoint", fg = "SKIP", bg = ucolors.blend(errorBG()[1], mainFG()[1], 0.6), ctermfg = "SKIP", ctermbg = warningBG()[2]}, _5_()}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a