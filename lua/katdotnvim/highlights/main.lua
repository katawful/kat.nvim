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
local colors, main, run, ucolors, _ = autoload("katdotnvim.color"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.highlight.run"), autoload("katdotnvim.utils.highlight.utils"), nil
_2amodule_locals_2a["colors"] = colors
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["run"] = run
_2amodule_locals_2a["ucolors"] = ucolors
_2amodule_locals_2a["_"] = _
local function mainFG()
  local output = {}
  if (((main["background-mut"])[1] == "dark") and ((main["contrast-mut"])[1] == "soft")) then
    output[1] = ucolors.brighten(colors.kat.fg.base.color, 0.8)
    do end (output)[2] = 7
  else
    output[1] = colors.kat.fg.base.color
    output[2] = 7
  end
  return output
end
_2amodule_2a["mainFG"] = mainFG
local function mainBG()
  return {colors.kat.bg.base.color, 0}
end
_2amodule_2a["mainBG"] = mainBG
local function umbraFG()
  return {colors.kat.fg.umbra.color, 15}
end
_2amodule_2a["umbraFG"] = umbraFG
local function umbraBG()
  return {colors.kat.bg.umbra.color, 8}
end
_2amodule_2a["umbraBG"] = umbraBG
local function shadowFG()
  return {colors.kat.fg.shadow.color, 16}
end
_2amodule_2a["shadowFG"] = shadowFG
local function shadowBG()
  return {colors.kat.bg.shadow.color, 16}
end
_2amodule_2a["shadowBG"] = shadowBG
local function meldFG()
  return {colors.kat.fg.meld.color, 16}
end
_2amodule_2a["meldFG"] = meldFG
local function meldBG()
  return {colors.kat.bg.meld.color, 16}
end
_2amodule_2a["meldBG"] = meldBG
local function selectionFG()
  local output = {colors.kat.fg.auto.color, 7}
  return output
end
_2amodule_2a["selectionFG"] = selectionFG
local function selectionBG()
  return {colors.kat.blue.base.color, 4, 12}
end
_2amodule_2a["selectionBG"] = selectionBG
local function fillFG()
  local output = {colors.kat.fg.auto.color, 7}
  return output
end
_2amodule_2a["fillFG"] = fillFG
local function fillBG()
  return {colors.kat.pink.base.color, 5, 13}
end
_2amodule_2a["fillBG"] = fillBG
local function highlightFG()
  local output = {colors.kat.fg.auto.color, 7}
  return output
end
_2amodule_2a["highlightFG"] = highlightFG
local function highlightBG()
  return {colors.kat.purple.base.color, 6, 14}
end
_2amodule_2a["highlightBG"] = highlightBG
local function errorFG()
  local output = {colors.kat.fg.auto.color, 7}
  return output
end
_2amodule_2a["errorFG"] = errorFG
local function errorBG()
  return {colors.kat.red.base.color, 1}
end
_2amodule_2a["errorBG"] = errorBG
local function warningFG()
  local output = {colors.kat.fg.auto.color, 7}
  return output
end
_2amodule_2a["warningFG"] = warningFG
local function warningBG()
  local output = {ucolors.blend(colors.kat.red.base.color, colors.kat.bg.base.color, 0.7), 9}
  return output
end
_2amodule_2a["warningBG"] = warningBG
local function infoFG()
  local output = {colors.kat.bg.base.color, 0}
  return output
end
_2amodule_2a["infoFG"] = infoFG
local function infoBG()
  return {colors.kat.orange.base.color, 3, 11}
end
_2amodule_2a["infoBG"] = infoBG
local function auxFG()
  local output = colors.kat.fg.auto.color
  return output
end
_2amodule_2a["auxFG"] = auxFG
local function groupFunction()
  local output = ""
  if ((main["background-mut"])[1] == "light") then
    output = ucolors.saturation(ucolors.darken(colors.kat.green.base.color, 0.5), 0.4)
  else
    output = ucolors.saturation(ucolors.brighten(colors.kat.green.base.color, 0.5), -0.2)
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
  local function _3_()
    local _4_
    do
      local result_2_auto = vim.fn.has("gui")
      if (result_2_auto == 0) then
        _4_ = false
      else
        _4_ = true
      end
    end
    if _4_ then
      do local _ = {group = "Menu", fg = colors.kat.fg.auto.color, bg = colors.kat.bg.base.color, ctermfg = mainFG()[2], ctermbg = mainBG()[2]} end
      do local _ = {group = "Tooltip", fg = colors.kat.fg.auto.color, bg = colors.kat.pink.base.color, ctermfg = fillFG()[2], ctermbg = fillBG()[2]} end
      return {group = "Scrollbar", fg = colors.kat.fg.auto.color, bg = colors.kat.purple.base.color, ctermfg = highlightFG()[2], ctermbg = highlightBG()[2]}
    else
      return nil
    end
  end
  return {{group = "Normal", fg = colors.kat.fg.auto.color, bg = colors.kat.bg.base.color, ctermfg = mainFG()[2], ctermbg = mainBG()[2]}, {group = "NormalNC", fg = colors.kat.fg.auto.color, bg = colors.kat.bg.base.color, ctermfg = mainFG()[2], ctermbg = mainBG()[2]}, {group = "NormalFloat", fg = colors.kat.fg.auto.color, bg = colors.kat.bg.shadow.color, ctermfg = mainFG()[2], ctermbg = umbraBG()[2]}, {group = "NonText", fg = colors.kat.fg.shadow.color, bg = colors.kat.bg.base.color, ctermfg = umbraFG()[2], ctermbg = mainBG()[2]}, {group = "MatchParen", fg = "SKIP", bg = colors.kat.bg.shadow.color, ctermfg = "SKIP", ctermbg = umbraBG()[2], bold = true}, {group = "SpecialKey", fg = colors.kat.red.match_bg.color, bg = "NONE", ctermfg = warningBG()[2], ctermbg = "NONE", italic = true}, {group = "Whitespace", fg = colors.kat.fg.fifth.color, bg = "SKIP", ctermfg = umbraFG()[2], ctermbg = "SKIP"}, {group = "EndOfBuffer", fg = colors.kat.fg.umbra.color, bg = "SKIP", ctermfg = umbraFG()[2], ctermbg = "SKIP", bold = true}, {group = "Directory", fg = colors.kat.blue.mix_orange_match_fg.color, bg = "SKIP", ctermfg = selectionBG()[2], ctermbg = "SKIP"}, {group = "Conceal", fg = colors.kat.bg.shadow.color, bg = "NONE", ctermfg = umbraBG()[2], ctermbg = "NONE"}, {group = "SpellBad", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = colors.kat.red.base.color}, {group = "SpellCap", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = colors.kat.blue.base.color}, {group = "SpellLocal", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = colors.kat.green.auto.color}, {group = "SpellRare", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = colors.kat.pink.base.color}, {group = "StatusLine", fg = colors.kat.bg.fifth.color, bg = colors.kat.purple.match_bg.color, ctermfg = umbraBG()[2], ctermbg = highlightBG()[3], bold = true}, {group = "StatusLineNC", fg = colors.kat.purple.match_bg.color, bg = colors.kat.bg.fifth.color, ctermfg = umbraBG()[2], ctermbg = highlightBG()[3], bold = true}, {group = "TabLine", fg = colors.kat.fg.auto.color, bg = colors.kat.purple.base.color, ctermfg = highlightFG()[2], ctermbg = highlightBG()[2]}, {group = "TabLineFill", fg = colors.kat.pink.base.color, bg = colors.kat.pink.base.color, ctermfg = fillBG()[2], ctermbg = fillBG()[2]}, {group = "TabLineSel", fg = colors.kat.fg.auto.color, bg = colors.kat.blue.base.color, ctermfg = selectionFG()[2], ctermbg = selectionBG()[2], bold = true}, {group = "Title", fg = colors.kat.green.auto.color, bg = "NONE", ctermfg = auxBG()[2], ctermbg = "NONE", bold = true}, {group = "Visual", fg = "SKIP", bg = colors.kat.blue.darken.color, ctermfg = "SKIP", ctermbg = warningBG()[2]}, {group = "VisualNOS", fg = "SKIP", bg = colors.kat.blue.match_fg.color, ctermfg = "SKIP", ctermbg = warningBG()[2]}, {group = "Pmenu", fg = colors.kat.fg.auto.color, bg = colors.kat.pink.base.color, ctermfg = fillFG()[2], ctermbg = fillBG()[2]}, {group = "PmenuSel", fg = colors.kat.fg.auto.color, bg = colors.kat.blue.base.color, ctermfg = selectionFG()[2], ctermbg = selectionBG()[2]}, {group = "PmenuSbar", fg = colors.kat.fg.auto.color, bg = colors.kat.purple.base.color, ctermfg = highlightFG()[2], ctermbg = highlightBG()[2]}, {group = "PmenuThumb", fg = colors.kat.fg.auto.color, bg = colors.kat.blue.base.color, ctermfg = selectionFG()[2], ctermbg = selectionBG()[2]}, {group = "WildMenu", fg = colors.kat.fg.auto.color, bg = colors.kat.blue.base.color, ctermfg = selectionFG()[2], ctermbg = selectionBG()[2]}, {group = "Question", fg = ucolors.blend(colors.kat.green.auto.color, colors.kat.fg.base.color, 0.7), bg = "SKIP", ctermfg = auxBG()[3], ctermbg = "SKIP", bold = true, underline = true, sp = colors.kat.green.auto.color}, {group = "QuickFixLine", fg = "SKIP", bg = colors.kat.blue.base.color, ctermfg = "SKIP", ctermbg = selectionBG()[2]}, {group = "Cursor", fg = "SKIP", bg = colors.kat.fg.auto.color, ctermfg = "SKIP", ctermbg = mainFG()[2], reverse = true}, {group = "CursorIM", fg = "SKIP", bg = colors.kat.fg.umbra.color, ctermfg = "SKIP", ctermbg = umbraFG()[2], reverse = true}, {group = "lCursor", fg = "SKIP", bg = colors.kat.fg.shadow.color, ctermfg = "SKIP", ctermbg = umbraFG()[2], reverse = true}, {group = "CursorColumn", fg = "SKIP", bg = colors.kat.bg.shadow.color, ctermfg = "SKIP", ctermbg = umbraBG()[2]}, {group = "CursorLine", fg = "SKIP", bg = colors.kat.bg.shadow.color, ctermfg = "SKIP", ctermbg = umbraBG()[2]}, {group = "ColorColumn", fg = "NONE", bg = ucolors.blend(colors.kat.blue.base.color, colors.kat.fg.base.color, 0.8), ctermfg = "NONE", ctermbg = selectionBG()[3], bold = true}, {group = "TermCursor", fg = "SKIP", bg = colors.kat.fg.auto.color, ctermfg = "SKIP", ctermbg = mainFG()[2], reverse = true}, {group = "TermCursorNC", fg = "SKIP", bg = colors.kat.fg.umbra.color, ctermfg = "SKIP", ctermbg = umbraFG()[2], reverse = true}, {group = "ErrorMsg", fg = colors.kat.fg.auto.color, bg = colors.kat.red.base.color, ctermfg = errorFG()[2], ctermbg = errorBG()[2], bold = true}, {group = "WarningMsg", fg = colors.kat.fg.auto.color, bg = colors.kat.red.match_bg.color, ctermfg = warningFG()[2], ctermbg = warningBG()[2]}, {group = "VertSplit", fg = colors.kat.bg.shadow.color, bg = colors.kat.fg.shadow.color, ctermfg = umbraBG()[2], ctermbg = umbraFG()[2]}, {group = "Folded", fg = colors.kat.fg.auto.color, bg = colors.kat.bg.shadow.color, ctermfg = selectionFG()[2], ctermbg = umbraBG()[2], bold = true}, {group = "FoldColumn", fg = colors.kat.blue.base.color, bg = "NONE", ctermfg = selectionBG()[2], ctermbg = "NONE", bold = true}, {group = "SignColumn", fg = "NONE", bg = "NONE", ctermfg = "NONE", ctermbg = "NONE", bold = true}, {group = "IncSearch", fg = colors.kat.fg.auto.color, bg = colors.kat.orange.base.color, ctermfg = mainFG()[2], ctermbg = infoBG()[2], reverse = false}, {group = "Substitute", fg = colors.kat.bg.base.color, bg = colors.kat.orange.match_fg.color, ctermfg = infoFG()[2], ctermbg = infoBG()[3]}, {group = "Search", fg = colors.kat.bg.base.color, bg = colors.kat.orange.match_bg.color, ctermfg = infoFG()[2], ctermbg = infoBG()[2]}, {group = "LineNr", fg = colors.kat.pink.base.color, bg = "SKIP", ctermfg = fillBG()[2], ctermbg = "SKIP"}, {group = "CursorLineNr", fg = colors.kat.pink.match_fg.color, bg = "SKIP", ctermfg = fillBG()[3], ctermbg = "SKIP", bold = true}, {group = "ModeMsg", fg = colors.kat.fg.auto.color, bg = colors.kat.bg.shadow.color, ctermfg = mainFG()[2], ctermbg = umbraBG()[2], bold = true}, {group = "MsgArea", fg = colors.kat.fg.auto.color, bg = colors.kat.bg.umbra.color, ctermfg = mainFG()[2], ctermbg = umbraBG()[2]}, {group = "MsgSeparator", fg = colors.kat.fg.auto.color, bg = colors.kat.bg.umbra.color, ctermfg = mainFG()[2], ctermbg = umbraBG()[2]}, {group = "MoreMsg", fg = colors.kat.green.auto.color, bg = "SKIP", ctermfg = auxBG()[2], ctermbg = "SKIP"}, {group = "debugPC", fg = "SKIP", bg = colors.kat.blue.match_fg.color, ctermfg = "SKIP", ctermbg = selectionBG()[3]}, {group = "debugBreakpoint", fg = "SKIP", bg = colors.kat.red.match_fg.color, ctermfg = "SKIP", ctermbg = warningBG()[2]}, _3_}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a