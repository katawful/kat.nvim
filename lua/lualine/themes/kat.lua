local _2afile_2a = "fnl/lualine/themes/kat.fnl"
local ucolors = require("katdotnvim.utils.highlight.utils")
local colors = require("katdotnvim.color")
local kat = {}
if (vim.o.termguicolors == true) then
  kat["normal"] = {a = {bg = colors.kat.purple.base.color, fg = colors.kat.fg.auto.color, gui = "bold"}, b = {bg = colors.kat.blue.mix_shadow_bg_more.color, fg = colors.kat.fg.auto.color}, c = {bg = colors.kat.pink.base.color, fg = colors.kat.fg.auto.color}}
  kat["insert"] = {a = {bg = colors.kat.blue.base.color, fg = colors.kat.fg.auto.color, gui = "bold"}, b = {bg = colors.kat.blue.mix_shadow_bg_more.color, fg = colors.kat.fg.auto.color}, c = {bg = colors.kat.blue.brighten.color, fg = colors.kat.fg.auto.color}}
  kat["visual"] = {a = {bg = colors.kat.red.base.color, fg = colors.kat.fg.auto.color, gui = "bold"}, b = {bg = colors.kat.blue.mix_shadow_bg_more.color, fg = colors.kat.fg.auto.color}, c = {bg = colors.kat.purple.base.color, fg = colors.kat.fg.auto.color}}
  kat["replace"] = {a = {bg = colors.kat.orange.base.color, fg = colors.kat.fg.auto.color, gui = "bold"}, b = {bg = colors.kat.blue.mix_shadow_bg_more.color, fg = colors.kat.fg.auto.color}, c = {bg = colors.kat.blue.brighten.color, fg = colors.kat.fg.auto.color}}
  kat["command"] = {a = {bg = colors.kat.green.match_bg.color, fg = colors.kat.fg.auto.color, gui = "bold"}, b = {bg = colors.kat.blue.mix_shadow_bg_more.color, fg = colors.kat.fg.auto.color}, c = {bg = colors.kat.green.match_bg_less.color, fg = colors.kat.fg.auto.color}}
  kat["terminal"] = {a = {bg = colors.kat.pink.match_bg_less.color, fg = colors.kat.fg.auto.color, gui = "bold"}, b = {bg = colors.kat.blue.mix_shadow_bg_more.color, fg = colors.kat.fg.auto.color}, c = {bg = colors.kat.red.match_bg.color, fg = colors.kat.fg.auto.color}}
  kat["inactive"] = {a = {bg = colors.kat.fg.sixth.color, fg = colors.kat.bg.base.color}, b = {bg = colors.kat.fg.sixth.color, fg = colors.kat.bg.base.color}, c = {bg = colors.kat.fg.shadow.color, fg = colors.kat.bg.base.color}}
else
  kat["normal"] = {a = {bg = 6, fg = 7, gui = "bold"}, b = {bg = 12, fg = 7}, c = {bg = 5, fg = 7}}
  kat["insert"] = {a = {bg = 4, fg = 7, gui = "bold"}, b = {bg = 12, fg = 7}, c = {bg = 4, fg = 7}}
  kat["visual"] = {a = {bg = 1, fg = 7, gui = "bold"}, b = {bg = 12, fg = 7}, c = {bg = 6, fg = 7}}
  kat["replace"] = {a = {bg = 3, fg = 7, gui = "bold"}, b = {bg = 4, fg = 7}, c = {bg = 4, fg = 7}}
  kat["command"] = {a = {bg = 2, fg = 7, gui = "bold"}, b = {bg = 12, fg = 7}, c = {bg = 10, fg = 7}}
  kat["terminal"] = {a = {bg = 13, fg = 7, gui = "bold"}, b = {bg = 12, fg = 7}, c = {bg = 9, fg = 7}}
  kat["inactive"] = {a = {bg = 15, fg = 0}, b = {bg = 15, fg = 0}, c = {bg = 15, fg = 0}}
end
return kat