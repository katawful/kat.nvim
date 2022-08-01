local _2afile_2a = "fnl/katdotnvim/utils/export/colors.fnl"
local _2amodule_name_2a = "katdotnvim.utils.export.colors"
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
local color_2a
do
  local normal_colors = colors["normal-colors"]()
  local foreground = colors.foreground()
  local background = colors.background()
  local output = {}
  for k, v in pairs(normal_colors) do
    output[k] = v
  end
  for i = 1, 6 do
    output[("f" .. (i - 1))] = foreground[i]
    output[("b" .. (i - 1))] = background[i]
  end
  color_2a = output
end
_2amodule_locals_2a["color*"] = color_2a
local kat = {pink = {}, red = {}, blue = {}, green = {}, purple = {}, orange = {}, fg = {}, bg = {}}
_2amodule_2a["kat"] = kat
kat.pink.base = {desc = "Base color, no changes applied", color = color_2a.pink}
kat.red.base = {desc = "Base color, no changes applied", color = color_2a.red}
kat.blue.base = {desc = "Base color, no changes applied", color = color_2a.blue}
kat.green.base = {desc = "Base color, no changes applied", color = color_2a.green}
kat.purple.base = {desc = "Base color, no changes applied", color = color_2a.purple}
kat.orange.base = {desc = "Base color, no changes applied", color = color_2a.orange}
kat.fg.base = {desc = "Base color, no changes applied", color = color_2a.f0}
kat.bg.base = {desc = "Base color, no changes applied", color = color_2a.b0}
kat.fg.umbra = {desc = "Umbra/second color, lighter shadow variation", color = color_2a.f1}
kat.fg.shadow = {desc = "Shadow/third color, used to contrast base fg", color = color_2a.f2}
kat.fg.meld = {desc = "Meld/fourth, used to blend in with the base fg", color = color_2a.f3}
kat.fg.fifth = {desc = "5th bg color, dark for dark background and bright for light background", color = color_2a.f4}
kat.fg.sixth = {desc = "6th bg color, dark for dark background and bright for light background", color = color_2a.f5}
local _1_
if ((vim.o.background == "dark") and (vim.o.background == "soft")) then
  _1_ = ucolors.brighten(color_2a.f0, 1)
else
  _1_ = color_2a.f0
end
kat.fg.auto = {desc = "Auto matching color, used to always maintain bright color regardless of contrast", color = _1_}
kat.bg.umbra = {desc = "Umbra/second color, lighter shadow variation", color = color_2a.b1}
kat.bg.shadow = {desc = "Shadow/third color, used to contrast base bg", color = color_2a.b2}
kat.bg.meld = {desc = "Meld/fourth color, used to blend in with the base fg", color = color_2a.b3}
kat.bg.fifth = {desc = "5th bg color, bright for dark background and dark for light background", color = color_2a.b4}
kat.bg.sixth = {desc = "6th bg color, bright for dark background and dark for light background", color = color_2a.b5}
local _3_
if (vim.o.background == "light") then
  _3_ = ucolors.saturation(ucolors.darken(color_2a.green, 0.5), 0.4)
else
  _3_ = ucolors.saturation(ucolors.brighten(color_2a.green, 0.5), -0.2)
end
kat.green.auto = {desc = "Auto matching color, used to increase contrast depending on background", color = _3_}
kat.green.match_fg = {desc = "Matches to base fg color", color = ucolors.blend(color_2a.green, color_2a.f0, 0.5)}
kat.green.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.green, color_2a.b0, 0.5)}
kat.blue.mix_orange_match_fg = {desc = "Mixes in orange, then matches to base fg color", color = ucolors.blend(ucolors.blend(color_2a.orange, color_2a.f0, 0.1), color_2a.blue, 0.2)}
kat.blue.darker = {desc = "Darkens color by 20%", color = ucolors.darken(color_2a.blue, 0.2)}
kat.blue.match_fg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.blue, color_2a.f0, 0.5)}
kat.blue.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.blue, color_2a.b0, 0.5)}
kat.blue.mix_bg6 = {desc = "Mixes in 6th bg color", color = ucolors.blend(color_2a.blue, color_2a.b5, 0.65)}
kat.red.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.red, color_2a.b0, 0.7)}
kat.red.match_fg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.red, color_2a.f0, 0.6)}
kat.purple.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.purple, color_2a.b0, 0.7)}
kat.purple.match_fg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.purple, color_2a.f0, 0.7)}
kat.purple.mix_pink = {desc = "Mixes in pink", color = ucolors.blend(color_2a.pink, color_2a.purple, 0.65)}
kat.orange.match_fg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.orange, color_2a.f0, 0.7)}
kat.orange.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.orange, color_2a.b0, 0.7)}
kat.pink.match_fg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.pink, color_2a.f0, 0.6)}
kat.pink.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.pink, color_2a.b0, 0.6)}
return _2amodule_2a