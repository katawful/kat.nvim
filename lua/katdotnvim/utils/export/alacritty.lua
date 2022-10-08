local _2afile_2a = "fnl/katdotnvim/utils/export/alacritty.fnl"
local _2amodule_name_2a = "katdotnvim.utils.export.alacritty"
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
  local white
  if ((main["background-mut"])[1] == "light") then
    white = ("'" .. colors.kat.bg.base.color .. "'")
  else
    white = ("'" .. colors.kat.fg.base.color .. "'")
  end
  local black
  if ((main["background-mut"])[1] == "light") then
    black = ("'" .. colors.kat.fg.base.color .. "'")
  else
    black = ("'" .. colors.kat.bg.base.color .. "'")
  end
  local cyan = ("'" .. ucolors.brighten(colors.kat.blue.base.color, 0.3) .. "'")
  local char = "'"
  local output
  local _3_
  if ((main["background-mut"])[1] == "light") then
    _3_ = {["  black:"] = (char .. colors.kat.fg.umbra.color .. char), ["  red:"] = (char .. ucolors.darken(colors.kat.red.base.color, 0.2) .. char), ["  green:"] = (char .. ucolors.darken(colors.kat.green.base.color, 0.2) .. char), ["  yellow:"] = (char .. ucolors.darken(colors.kat.orange.base.color, 0.2) .. char), ["  blue:"] = (char .. ucolors.darken(colors.kat.blue.base.color, 0.2) .. char), ["  magenta:"] = (char .. ucolors.darken(colors.kat.pink.base.color, 0.2) .. char), ["  cyan:"] = (char .. ucolors.darken(colors.kat.purple.base.color, 0.2) .. char), ["  white:"] = (char .. colors.kat.bg.umbra.color .. char)}
  else
    _3_ = {["  black:"] = (char .. colors.kat.bg.umbra.color .. char), ["  red:"] = (char .. ucolors.brighten(colors.kat.red.base.color, 0.2) .. char), ["  green:"] = (char .. ucolors.brighten(colors.kat.green.base.color, 0.2) .. char), ["  yellow:"] = (char .. ucolors.brighten(colors.kat.orange.base.color, 0.2) .. char), ["  blue:"] = (char .. ucolors.brighten(colors.kat.blue.base.color, 0.2) .. char), ["  magenta:"] = (char .. ucolors.brighten(colors.kat.pink.base.color, 0.2) .. char), ["  cyan:"] = (char .. ucolors.brighten(colors.kat.purple.base.color, 0.2) .. char), ["  white:"] = (char .. colors.kat.fg.umbra.color .. char)}
  end
  local _5_
  if ((main["background-mut"])[1] == "dark") then
    _5_ = {["  black:"] = (char .. colors.kat.fg.meld.color .. char), ["  red:"] = (char .. ucolors.darken(colors.kat.red.base.color, 0.2) .. char), ["  green:"] = (char .. ucolors.darken(colors.kat.green.base.color, 0.2) .. char), ["  yellow:"] = (char .. ucolors.darken(colors.kat.orange.base.color, 0.2) .. char), ["  blue:"] = (char .. ucolors.darken(colors.kat.blue.base.color, 0.2) .. char), ["  magenta:"] = (char .. ucolors.darken(colors.kat.pink.base.color, 0.2) .. char), ["  cyan:"] = (char .. ucolors.darken(colors.kat.purple.base.color, 0.2) .. char), ["  white:"] = (char .. colors.kat.bg.meld.color .. char)}
  else
    _5_ = {["  black:"] = (char .. colors.kat.bg.meld.color .. char), ["  red:"] = (char .. ucolors.brighten(colors.kat.red.base.color, 0.2) .. char), ["  green:"] = (char .. ucolors.brighten(colors.kat.green.base.color, 0.2) .. char), ["  yellow:"] = (char .. ucolors.brighten(colors.kat.orange.base.color, 0.2) .. char), ["  blue:"] = (char .. ucolors.brighten(colors.kat.blue.base.color, 0.2) .. char), ["  magenta:"] = (char .. ucolors.brighten(colors.kat.pink.base.color, 0.2) .. char), ["  cyan:"] = (char .. ucolors.brighten(colors.kat.purple.base.color, 0.2) .. char), ["  white:"] = (char .. (char .. colors.kat.fg.meld.color .. char))}
  end
  output = {["colors:"] = {[" primary:"] = {["  background:"] = (char .. colors.kat.bg.base.color .. char), ["  foreground:"] = (char .. colors.kat.fg.auto.color .. char), ["  dim_foreground:"] = (char .. colors.kat.fg.umbra.color .. char), ["  bright_foreground:"] = (char .. colors.kat.fg.meld.color .. char), ["  dim_background:"] = (char .. colors.kat.bg.umbra.color .. char), ["  bright_background:"] = (char .. colors.kat.bg.meld.color .. char)}, [" cursor:"] = {["  text:"] = (char .. colors.kat.bg.base.color .. char), ["  cursor:"] = (char .. colors.kat.fg.auto.color .. char)}, [" search:"] = {["  matches:"] = {["   foreground:"] = (char .. colors.kat.bg.base.color .. char), ["   background:"] = (char .. ucolors.blend(colors.kat.orange.base.color, colors.kat.bg.base.color, 0.7) .. char)}, ["  focused_match:"] = {["   foreground:"] = (char .. colors.kat.bg.base.color .. char), ["   background:"] = (char .. colors.kat.orange.base.color .. char)}}, [" hints:"] = {["  start:"] = {["   foreground:"] = (char .. colors.kat.fg.auto.color .. char), ["   background:"] = (char .. ucolors.blend(colors.kat.bg.meld.color, colors.kat.green.auto.color, 0.2) .. char)}, ["  end:"] = {["   foreground:"] = (char .. colors.kat.fg.auto.color .. char), ["   background:"] = (char .. colors.kat.green.auto.color .. char)}}, [" line_indicator:"] = {["   foreground:"] = "None", ["   background:"] = "None"}, [" footer_bar:"] = {["   foreground:"] = (char .. colors.kat.fg.auto.color .. char), ["   background:"] = (char .. colors.kat.pink.base.color .. char)}, [" normal:"] = {["  black:"] = black, ["  red:"] = (char .. colors.kat.red.base.color .. char), ["  blue:"] = (char .. colors.kat.blue.base.color .. char), ["  green:"] = (char .. colors.kat.green.base.color .. char), ["  yellow:"] = (char .. colors.kat.orange.base.color .. char), ["  cyan:"] = (char .. colors.kat.purple.base.color .. char), ["  magenta:"] = (char .. colors.kat.pink.base.color .. char), ["  white:"] = white}, [" bright:"] = _3_, [" dim:"] = _5_, [" selection:"] = {["  text:"] = "CellBackground", ["  background:"] = (char .. colors.kat.blue.base.color .. char)}}, ["bell:"] = {[" color:"] = (char .. colors.kat.blue.base.color .. char)}}
  return output
end
_2amodule_2a["gen-colors"] = gen_colors
local function output_21()
  local file_name = string.format("alacritty-%s-%s.yml", tostring((main["colors-name-mut"])[1]), tostring((main["background-mut"])[1]))
  local fd = assert(loop.fs_open(file_name, "w", 0))
  assert(loop.fs_chmod(file_name, 420))
  assert(loop.fs_write(fd, export["table->one-line-color"](gen_colors(), alacritty), 0))
  export["notify$"]("alacritty")
  return assert(loop.fs_close(fd))
end
_2amodule_2a["output!"] = output_21
return _2amodule_2a