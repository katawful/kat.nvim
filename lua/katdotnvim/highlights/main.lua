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
local colors, run, ucolors, _ = autoload("katdotnvim.color"), autoload("katdotnvim.utils.highlight.run"), autoload("katdotnvim.utils.highlight.utils"), nil
_2amodule_locals_2a["colors"] = colors
_2amodule_locals_2a["run"] = run
_2amodule_locals_2a["ucolors"] = ucolors
_2amodule_locals_2a["_"] = _
local function high_colors()
  local function _1_()
    local _2_
    do
      local result_2_auto = vim.fn.has("gui")
      if (result_2_auto == 0) then
        _2_ = false
      else
        _2_ = true
      end
    end
    if _2_ then
      return {group = "Menu", fg = colors.kat.fg.auto.color, bg = colors.kat.bg.base.color, ctermfg = 7, ctermbg = 0}, {group = "Tooltip", fg = colors.kat.fg.auto.color, bg = colors.kat.pink.base.color, ctermfg = 7, ctermbg = 5}, {group = "Scrollbar", fg = colors.kat.fg.auto.color, bg = colors.kat.purple.base.color, ctermfg = 7, ctermbg = 6}
    else
      return nil
    end
  end
  return {{group = "Normal", fg = colors.kat.fg.auto.color, bg = colors.kat.bg.base.color, ctermfg = 7, ctermbg = 0}, {group = "NormalNC", fg = colors.kat.fg.auto.color, bg = colors.kat.bg.base.color, ctermfg = 7, ctermbg = 0}, {group = "NormalFloat", fg = colors.kat.fg.auto.color, bg = colors.kat.bg.shadow.color, ctermfg = 7, ctermbg = 8}, {group = "NonText", fg = colors.kat.fg.shadow.color, bg = colors.kat.bg.base.color, ctermfg = 15, ctermbg = 0}, {group = "MatchParen", fg = "SKIP", bg = colors.kat.bg.shadow.color, ctermfg = "SKIP", ctermbg = 8, bold = true}, {group = "SpecialKey", fg = colors.kat.red.match_bg.color, bg = "NONE", ctermfg = 9, ctermbg = "NONE", italic = true}, {group = "Whitespace", fg = colors.kat.fg.fifth.color, bg = "SKIP", ctermfg = 15, ctermbg = "SKIP"}, {group = "EndOfBuffer", fg = colors.kat.fg.umbra.color, bg = "SKIP", ctermfg = 15, ctermbg = "SKIP", bold = true}, {group = "Directory", fg = colors.kat.blue.mix_orange_match_fg.color, bg = "SKIP", ctermfg = 4, ctermbg = "SKIP"}, {group = "Conceal", fg = colors.kat.bg.shadow.color, bg = "NONE", ctermfg = 8, ctermbg = "NONE"}, {group = "SpellBad", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = colors.kat.red.base.color}, {group = "SpellCap", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = colors.kat.blue.base.color}, {group = "SpellLocal", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = colors.kat.green.auto.color}, {group = "SpellRare", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", undercurl = true, sp = colors.kat.pink.base.color}, {group = "StatusLine", fg = colors.kat.bg.fifth.color, bg = colors.kat.purple.match_bg.color, ctermfg = 8, ctermbg = 14, bold = true}, {group = "StatusLineNC", fg = colors.kat.purple.match_bg.color, bg = colors.kat.bg.fifth.color, ctermfg = 8, ctermbg = 14, bold = true}, {group = "TabLine", fg = colors.kat.fg.auto.color, bg = colors.kat.purple.base.color, ctermfg = 7, ctermbg = 6}, {group = "TabLineFill", fg = colors.kat.pink.base.color, bg = colors.kat.pink.base.color, ctermfg = 5, ctermbg = 5}, {group = "TabLineSel", fg = colors.kat.fg.auto.color, bg = colors.kat.blue.base.color, ctermfg = 7, ctermbg = 4, bold = true}, {group = "Title", fg = colors.kat.green.auto.color, bg = "NONE", ctermfg = 2, ctermbg = "NONE", bold = true}, {group = "Visual", fg = "SKIP", bg = colors.kat.blue.darken.color, ctermfg = "SKIP", ctermbg = 9}, {group = "VisualNOS", fg = "SKIP", bg = colors.kat.blue.match_fg.color, ctermfg = "SKIP", ctermbg = 9}, {group = "Pmenu", fg = colors.kat.fg.auto.color, bg = colors.kat.pink.base.color, ctermfg = 7, ctermbg = 5}, {group = "PmenuSel", fg = colors.kat.fg.auto.color, bg = colors.kat.blue.base.color, ctermfg = 7, ctermbg = 4}, {group = "PmenuSbar", fg = colors.kat.fg.auto.color, bg = colors.kat.purple.base.color, ctermfg = 7, ctermbg = 6}, {group = "PmenuThumb", fg = colors.kat.fg.auto.color, bg = colors.kat.blue.base.color, ctermfg = 7, ctermbg = 4}, {group = "WildMenu", fg = colors.kat.fg.auto.color, bg = colors.kat.blue.base.color, ctermfg = 7, ctermbg = 4}, {group = "Question", fg = ucolors.blend(colors.kat.green.auto.color, colors.kat.fg.base.color, 0.7), bg = "SKIP", ctermfg = 10, ctermbg = "SKIP", bold = true, underline = true, sp = colors.kat.green.auto.color}, {group = "QuickFixLine", fg = "SKIP", bg = colors.kat.blue.base.color, ctermfg = "SKIP", ctermbg = 4}, {group = "Cursor", fg = "SKIP", bg = colors.kat.fg.auto.color, ctermfg = "SKIP", ctermbg = 7, reverse = true}, {group = "CursorIM", fg = "SKIP", bg = colors.kat.fg.umbra.color, ctermfg = "SKIP", ctermbg = 15, reverse = true}, {group = "lCursor", fg = "SKIP", bg = colors.kat.fg.shadow.color, ctermfg = "SKIP", ctermbg = 15, reverse = true}, {group = "CursorColumn", fg = "SKIP", bg = colors.kat.bg.shadow.color, ctermfg = "SKIP", ctermbg = 8}, {group = "CursorLine", fg = "SKIP", bg = colors.kat.bg.shadow.color, ctermfg = "SKIP", ctermbg = 8}, {group = "ColorColumn", fg = "NONE", bg = ucolors.blend(colors.kat.blue.base.color, colors.kat.fg.base.color, 0.8), ctermfg = "NONE", ctermbg = 12, bold = true}, {group = "TermCursor", fg = "SKIP", bg = colors.kat.fg.auto.color, ctermfg = "SKIP", ctermbg = 7, reverse = true}, {group = "TermCursorNC", fg = "SKIP", bg = colors.kat.fg.umbra.color, ctermfg = "SKIP", ctermbg = 15, reverse = true}, {group = "ErrorMsg", fg = colors.kat.fg.auto.color, bg = colors.kat.red.base.color, ctermfg = 7, ctermbg = 1, bold = true}, {group = "WarningMsg", fg = colors.kat.fg.auto.color, bg = colors.kat.red.match_bg.color, ctermfg = 7, ctermbg = 9}, {group = "VertSplit", fg = colors.kat.bg.shadow.color, bg = colors.kat.fg.shadow.color, ctermfg = 8, ctermbg = 15}, {group = "Folded", fg = colors.kat.fg.auto.color, bg = colors.kat.bg.shadow.color, ctermfg = 7, ctermbg = 8, bold = true}, {group = "FoldColumn", fg = colors.kat.blue.base.color, bg = "NONE", ctermfg = 4, ctermbg = "NONE", bold = true}, {group = "SignColumn", fg = "NONE", bg = "NONE", ctermfg = "NONE", ctermbg = "NONE", bold = true}, {group = "IncSearch", fg = colors.kat.fg.auto.color, bg = colors.kat.orange.base.color, ctermfg = 7, ctermbg = 3, reverse = false}, {group = "Substitute", fg = colors.kat.bg.base.color, bg = colors.kat.orange.match_fg.color, ctermfg = 7, ctermbg = 11}, {group = "Search", fg = colors.kat.bg.base.color, bg = colors.kat.orange.match_bg.color, ctermfg = 7, ctermbg = 3}, {group = "LineNr", fg = colors.kat.pink.base.color, bg = "SKIP", ctermfg = 5, ctermbg = "SKIP"}, {group = "CursorLineNr", fg = colors.kat.pink.match_fg.color, bg = "SKIP", ctermfg = 13, ctermbg = "SKIP", bold = true}, {group = "ModeMsg", fg = colors.kat.fg.auto.color, bg = colors.kat.bg.shadow.color, ctermfg = 7, ctermbg = 8, bold = true}, {group = "MsgArea", fg = colors.kat.fg.auto.color, bg = colors.kat.bg.umbra.color, ctermfg = 7, ctermbg = 8}, {group = "MsgSeparator", fg = colors.kat.fg.auto.color, bg = colors.kat.bg.umbra.color, ctermfg = 7, ctermbg = 8}, {group = "MoreMsg", fg = colors.kat.green.auto.color, bg = "SKIP", ctermfg = 2, ctermbg = "SKIP"}, {group = "debugPC", fg = "SKIP", bg = colors.kat.blue.match_fg.color, ctermfg = "SKIP", ctermbg = 12}, {group = "debugBreakpoint", fg = "SKIP", bg = colors.kat.red.match_fg.color, ctermfg = "SKIP", ctermbg = 9}, _1_}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a