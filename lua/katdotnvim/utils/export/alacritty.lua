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
    white = ("'" .. colors.background()[1] .. "'")
  else
    white = ("'" .. colors.foreground()[1] .. "'")
  end
  local black
  if ((main["background-mut"])[1] == "light") then
    black = ("'" .. colors.foreground()[1] .. "'")
  else
    black = ("'" .. colors.background()[1] .. "'")
  end
  local cyan = ("'" .. ucolors.brighten(groups.selectionBG()[1], 0.3) .. "'")
  local char = "'"
  local output
  local _3_
  if ((main["background-mut"])[1] == "light") then
    _3_ = {["  black:"] = (char .. groups.umbraFG()[1] .. char), ["  red:"] = (char .. ucolors.darken((colors["normal-colors"]()).red, 0.2) .. char), ["  green:"] = (char .. ucolors.darken((colors["normal-colors"]()).green, 0.2) .. char), ["  yellow:"] = (char .. ucolors.darken((colors["normal-colors"]()).orange, 0.2) .. char), ["  blue:"] = (char .. ucolors.darken((colors["normal-colors"]()).blue, 0.2) .. char), ["  magenta:"] = (char .. ucolors.darken((colors["normal-colors"]()).pink, 0.2) .. char), ["  cyan:"] = (char .. ucolors.darken((colors["normal-colors"]()).purple, 0.2) .. char), ["  white:"] = (char .. groups.umbraBG()[1] .. char)}
  else
    _3_ = {["  black:"] = (char .. groups.umbraBG()[1] .. char), ["  red:"] = (char .. ucolors.brighten((colors["normal-colors"]()).red, 0.2) .. char), ["  green:"] = (char .. ucolors.brighten((colors["normal-colors"]()).green, 0.2) .. char), ["  yellow:"] = (char .. ucolors.brighten((colors["normal-colors"]()).orange, 0.2) .. char), ["  blue:"] = (char .. ucolors.brighten((colors["normal-colors"]()).blue, 0.2) .. char), ["  magenta:"] = (char .. ucolors.brighten((colors["normal-colors"]()).pink, 0.2) .. char), ["  cyan:"] = (char .. ucolors.brighten((colors["normal-colors"]()).purple, 0.2) .. char), ["  white:"] = (char .. groups.umbraFG()[1] .. char)}
  end
  local _5_
  if ((main["background-mut"])[1] == "dark") then
    _5_ = {["  black:"] = (char .. groups.meldFG()[1] .. char), ["  red:"] = (char .. ucolors.darken((colors["normal-colors"]()).red, 0.2) .. char), ["  green:"] = (char .. ucolors.darken((colors["normal-colors"]()).green, 0.2) .. char), ["  yellow:"] = (char .. ucolors.darken((colors["normal-colors"]()).orange, 0.2) .. char), ["  blue:"] = (char .. ucolors.darken((colors["normal-colors"]()).blue, 0.2) .. char), ["  magenta:"] = (char .. ucolors.darken((colors["normal-colors"]()).pink, 0.2) .. char), ["  cyan:"] = (char .. ucolors.darken((colors["normal-colors"]()).purple, 0.2) .. char), ["  white:"] = (char .. groups.meldBG()[1] .. char)}
  else
    _5_ = {["  black:"] = (char .. groups.meldBG()[1] .. char), ["  red:"] = (char .. ucolors.brighten((colors["normal-colors"]()).red, 0.2) .. char), ["  green:"] = (char .. ucolors.brighten((colors["normal-colors"]()).green, 0.2) .. char), ["  yellow:"] = (char .. ucolors.brighten((colors["normal-colors"]()).orange, 0.2) .. char), ["  blue:"] = (char .. ucolors.brighten((colors["normal-colors"]()).blue, 0.2) .. char), ["  magenta:"] = (char .. ucolors.brighten((colors["normal-colors"]()).pink, 0.2) .. char), ["  cyan:"] = (char .. ucolors.brighten((colors["normal-colors"]()).purple, 0.2) .. char), ["  white:"] = (char .. (char .. groups.meldFG()[1] .. char))}
  end
  output = {["colors:"] = {[" primary:"] = {["  background:"] = (char .. groups.mainBG()[1] .. char), ["  foreground:"] = (char .. groups.mainFG()[1] .. char), ["  dim_foreground:"] = (char .. groups.umbraFG()[1] .. char), ["  bright_foreground:"] = (char .. groups.meldFG()[1] .. char), ["  dim_background:"] = (char .. groups.umbraBG()[1] .. char), ["  bright_background:"] = (char .. groups.meldBG()[1] .. char)}, [" cursor:"] = {["  text:"] = (char .. groups.mainBG()[1] .. char), ["  cursor:"] = (char .. groups.mainFG()[1] .. char)}, [" search:"] = {["  matches:"] = {["   foreground:"] = (char .. groups.infoFG()[1] .. char), ["   background:"] = (char .. ucolors.blend(groups.infoBG()[1], (groups.mainBG(1))[1], 0.7) .. char)}, ["  focused_match:"] = {["   foreground:"] = (char .. groups.infoFG()[1] .. char), ["   background:"] = (char .. groups.infoBG()[1] .. char)}}, [" hints:"] = {["  start:"] = {["   foreground:"] = (char .. groups.mainFG()[1] .. char), ["   background:"] = (char .. ucolors.blend(groups.meldBG()[1], groups.auxBG()[1], 0.2) .. char)}, ["  end:"] = {["   foreground:"] = (char .. groups.mainFG()[1] .. char), ["   background:"] = (char .. groups.auxBG()[1] .. char)}}, [" line_indicator:"] = {["   foreground:"] = "None", ["   background:"] = "None"}, [" footer_bar:"] = {["   foreground:"] = (char .. groups.fillFG()[1] .. char), ["   background:"] = (char .. groups.fillBG()[1] .. char)}, [" normal:"] = {["  black:"] = black, ["  red:"] = (char .. (colors["normal-colors"]()).red .. char), ["  blue:"] = (char .. (colors["normal-colors"]()).blue .. char), ["  green:"] = (char .. (colors["normal-colors"]()).green .. char), ["  yellow:"] = (char .. (colors["normal-colors"]()).orange .. char), ["  cyan:"] = (char .. (colors["normal-colors"]()).purple .. char), ["  magenta:"] = (char .. (colors["normal-colors"]()).pink .. char), ["  white:"] = white}, [" bright:"] = _3_, [" dim:"] = _5_, [" selection:"] = {["  text:"] = "CellBackground", ["  background:"] = (char .. groups.selectionBG()[1] .. char)}}, ["bell:"] = {[" color:"] = (char .. groups.selectionBG()[1] .. char)}}
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