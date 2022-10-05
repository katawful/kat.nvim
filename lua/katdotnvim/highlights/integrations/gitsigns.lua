local _2afile_2a = "fnl/katdotnvim/highlights/integrations/gitsigns.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.integrations.gitsigns"
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
  return {{group = "GitSignsAdd", fg = colors.kat.green.auto.color, bg = "SKIP", ctermfg = groups.auxBG()[3], ctermbg = "SKIP", bold = true}, {group = "GitSignsAddLn", fg = "SKIP", bg = ucolors.blend(colors.kat.green.auto.color, colors.kat.bg.base.color, 0.4), ctermfg = "SKIP", ctermbg = groups.auxBG()[3]}, {group = "GitSignsAddLnInline", fg = "SKIP", bg = ucolors.blend(colors.kat.green.auto.color, colors.kat.bg.base.color, 0.6), ctermfg = "SKIP", ctermbg = groups.auxBG()[3]}, {group = "GitSignsChange", fg = colors.kat.blue.base.color, bg = "SKIP", ctermfg = groups.selectionBG()[3], ctermbg = "SKIP", bold = true}, {group = "GitSignsChangeLn", fg = "SKIP", bg = ucolors.blend(colors.kat.blue.base.color, colors.kat.bg.base.color, 0.4), ctermfg = "SKIP", ctermbg = groups.selectionBG()[3]}, {group = "GitSignsChangeLnInline", fg = "SKIP", bg = ucolors.blend(colors.kat.blue.base.color, colors.kat.bg.base.color, 0.6), ctermfg = "SKIP", ctermbg = groups.selectionBG()[3]}, {group = "GitSignsDelete", fg = colors.kat.red.base.color, bg = "SKIP", ctermfg = groups.errorBG()[2], ctermbg = "SKIP", bold = true}, {group = "GitSignsDeleteLn", fg = "SKIP", bg = ucolors.blend(colors.kat.red.base.color, colors.kat.bg.base.color, 0.4), ctermfg = "SKIP", ctermbg = groups.errorBG()[3]}, {group = "GitSignsDeleteLnInline", fg = "SKIP", bg = ucolors.blend(colors.kat.red.base.color, colors.kat.bg.base.color, 0.6), ctermfg = "SKIP", ctermbg = groups.errorBG()[3]}}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a