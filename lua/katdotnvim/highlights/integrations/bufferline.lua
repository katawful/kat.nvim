local _2afile_2a = "fnl/katdotnvim/highlights/integrations/bufferline.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.integrations.bufferline"
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
local colors, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["ucolors"] = ucolors
local function init()
  return (require("bufferline")).setup({highlights = {fill = {guifg = colors.kat.pink.base.color, guibg = colors.kat.pink.base.color}, tab = {guifg = colors.kat.fg.auto.color, guibg = colors.kat.purple.base.color}, tab_selected = {guifg = colors.kat.fg.auto.color, guibg = colors.kat.blue.base.color}, tab_close = {guifg = colors.kat.fg.auto.color, guibg = colors.kat.purple.base.color, gui = "bold,italic"}, info = {guifg = colors.kat.fg.auto.color, guibg = colors.kat.blue.base.color}, buffer_visible = {guifg = colors.kat.fg.auto.color, guibg = colors.kat.blue.match_bg.color}, buffer_selected = {guifg = colors.kat.fg.auto.color, guibg = colors.kat.blue.base.color, gui = "bold,italic"}, close_button = {guifg = colors.kat.fg.auto.color, guibg = colors.kat.purple.base.color, gui = "bold"}, close_button_visible = {guifg = colors.kat.fg.auto.color, guibg = colors.kat.blue.match_bg.color, gui = "bold"}, close_button_selected = {guifg = colors.kat.fg.auto.color, guibg = colors.kat.blue.base.color, gui = "bold"}, modified = {guifg = colors.kat.red.match_bg.color, guibg = colors.kat.purple.base.color}, modified_visible = {guifg = colors.kat.red.match_bg.color, guibg = colors.kat.blue.match_bg.color}, modified_selected = {guifg = colors.kat.red.match_bg.color, guibg = colors.kat.blue.base.color}, duplicate_selected = {guifg = colors.kat.fg.auto.color, guibg = colors.kat.blue.base.color}, duplicate_visible = {guifg = colors.kat.fg.auto.color, guibg = colors.kat.blue.match_bg.color}, duplicate = {guifg = colors.kat.fg.auto.color, guibg = colors.kat.purple.base.color}, separator_selected = {guifg = colors.kat.pink.base.color, guibg = colors.kat.blue.base.color}, separator_visible = {guifg = colors.kat.pink.base.color, guibg = colors.kat.blue.match_bg.color}, separator = {guifg = colors.kat.pink.base.color, guibg = colors.kat.purple.base.color}, indicator_selected = {guifg = colors.kat.fg.auto.color, guibg = colors.kat.blue.base.color}, pick_selected = {guifg = colors.kat.fg.auto.color, guibg = colors.kat.blue.base.color}, pick_visible = {guifg = colors.kat.fg.auto.color, guibg = colors.kat.blue.base.color}, pick = {guifg = colors.kat.fg.auto.color, guibg = colors.kat.blue.base.color}, background = {guifg = colors.kat.fg.auto.color, guibg = colors.kat.purple.base.color}}})
end
_2amodule_2a["init"] = init
return _2amodule_2a