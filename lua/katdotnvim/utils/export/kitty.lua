local _2afile_2a = "fnl/katdotnvim/utils/export/kitty.fnl"
local _2amodule_name_2a = "katdotnvim.utils.export.kitty"
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
local colors, export, groups, main, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.utils.export.init"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["export"] = export
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["ucolors"] = ucolors
local loop = vim.loop
_2amodule_locals_2a["loop"] = loop
local comment_type = "#"
_2amodule_2a["comment-type"] = comment_type
local function gen_colors()
  local output = {foreground = colors.kat.fg.auto.color, background = colors.kat.bg.base.color, selection_foreground = colors.kat.fg.auto.color, selection_background = colors.kat.blue.base.color, cursor = colors.kat.fg.auto.color, cursor_text_color = colors.kat.bg.base.color, url_color = colors.kat.orange.base.color, active_border_color = colors.kat.blue.base.color, inactive_border_color = colors.kat.bg.meld.color, bell_border_color = colors.kat.green.auto.color, active_tab_foreground = colors.kat.fg.auto.color, active_tab_background = colors.kat.blue.base.color, inactive_tab_foreground = colors.kat.fg.auto.color, inactive_tab_background = ucolors.blend(colors.kat.purple.base.color, colors.kat.bg.meld.color, 0.5), tab_bar_background = colors.kat.pink.base.color, tab_bar_margin_color = colors.kat.orange.base.color, mark1_foreground = colors.kat.bg.base.color, mark1_background = colors.kat.red.base.color, mark2_foreground = colors.kat.bg.base.color, mark2_background = colors.kat.blue.base.color, mark3_foreground = colors.kat.bg.base.color, mark3_background = colors.kat.green.auto.color, color0 = colors.kat.bg.base.color, color1 = colors.kat.red.base.color, color2 = colors.kat.green.base.color, color3 = colors.kat.orange.base.color, color4 = colors.kat.blue.base.color, color5 = colors.kat.pink.base.color, color6 = colors.kat.purple.base.color, color7 = colors.kat.fg.auto.color, color8 = colors.kat.bg.umbra.color, color15 = colors.kat.fg.umbra.color}
  if ((main["background-mut"])[1] == "light") then
    output["color9"] = ucolors.darken(colors.kat.red.base.color, 0.2)
    do end (output)["color10"] = ucolors.darken(colors.kat.green.base.color, 0.2)
    do end (output)["color11"] = ucolors.darken(colors.kat.orange.base.color, 0.2)
    do end (output)["color12"] = ucolors.darken(colors.kat.blue.base.color, 0.2)
    do end (output)["color13"] = ucolors.darken(colors.kat.pink.base.color, 0.2)
    do end (output)["color14"] = ucolors.darken(colors.kat.purple.base.color, 0.2)
  else
    output["color9"] = ucolors.brighten(colors.kat.red.base.color, 0.2)
    do end (output)["color10"] = ucolors.brighten(colors.kat.green.base.color, 0.2)
    do end (output)["color11"] = ucolors.brighten(colors.kat.orange.base.color, 0.2)
    do end (output)["color12"] = ucolors.brighten(colors.kat.blue.base.color, 0.2)
    do end (output)["color13"] = ucolors.brighten(colors.kat.pink.base.color, 0.2)
    do end (output)["color14"] = ucolors.brighten(colors.kat.purple.base.color, 0.2)
  end
  return output
end
_2amodule_2a["gen-colors"] = gen_colors
local function output_21()
  local file_name = string.format("kitty-%s-%s.conf", tostring((main["colors-name-mut"])[1]), tostring((main["background-mut"])[1]))
  local fd = assert(loop.fs_open(file_name, "w", 0))
  assert(loop.fs_chmod(file_name, 420))
  assert(loop.fs_write(fd, export["string->one-line-color"](gen_colors(), "kitty"), 0))
  export["notify$"]("kitty")
  return assert(loop.fs_close(fd))
end
_2amodule_2a["output!"] = output_21
return _2amodule_2a