local _2afile_2a = "fnl/katdotnvim/highlights/filetype/vimwiki.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.filetype.vimwiki"
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
local colors, groups, run, syntax, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.utils.highlight.run"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["run"] = run
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local function high_colors()
  return {{group = "VimwikiMarkers", fg = colors.kat.bg.fifth.color, bg = "SKIP", ctermfg = 7, ctermbg = "SKIP"}, {group = "VimwikiLink", fg = colors.kat.orange.base.color, bg = "SKIP", ctermfg = 3, ctermbg = "SKIP", bold = true, underline = true, sp = colors.kat.orange.base.color}, {group = "VimwikiList", fg = colors.kat.blue.base.color, bg = "SKIP", ctermfg = 4, ctermbg = "SKIP", bold = true}, {group = "VimwikiCheckBoxDone", fg = colors.kat.green.auto.color, bg = "SKIP", ctermfg = 2, ctermbg = "SKIP", bold = true}, {group = "VimwikiTag", fg = colors.kat.red.base.color, bg = "SKIP", ctermfg = 1, ctermbg = "SKIP", bold = true}, {group = "VimwikiDelText", fg = colors.kat.pink.base.color, bg = "SKIP", ctermfg = 5, ctermbg = "SKIP", strikethrough = true}, {group = "VimwikiCode", fg = colors.kat.fg.meld.color, bg = colors.kat.bg.shadow.color, ctermfg = 15, ctermbg = 8}, {group = "VimwikiHeader1", fg = ucolors.darken(colors.kat.blue.base.color, 0), bg = "SKIP", ctermfg = 4, ctermbg = "SKIP", bold = true}, {group = "VimwikiHeader2", fg = ucolors.darken(colors.kat.blue.base.color, 0.3), bg = "SKIP", ctermfg = 12, ctermbg = "SKIP", bold = true}, {group = "VimwikiHeader3", fg = ucolors.darken(colors.kat.orange.base.color, 0), bg = "SKIP", ctermfg = 3, ctermbg = "SKIP", bold = true}, {group = "VimwikiHeader4", fg = ucolors.darken(colors.kat.orange.base.color, 0.3), bg = "SKIP", ctermfg = 11, ctermbg = "SKIP", bold = true}, {group = "VimwikiHeader5", fg = ucolors.darken(colors.kat.pink.base.color, 0), bg = "SKIP", ctermfg = 5, ctermbg = "SKIP", bold = true}, {group = "VimwikiHeader6", fg = ucolors.darken(colors.kat.pink.base.color, 0.3), bg = "SKIP", ctermfg = 13, ctermbg = "SKIP", bold = true}}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a