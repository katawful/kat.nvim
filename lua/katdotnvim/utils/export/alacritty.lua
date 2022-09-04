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
local a, colors, errors, export, groups, hsl, main, ucolors = autoload("katdotnvim.aniseed.core"), autoload("katdotnvim.color"), autoload("katdotnvim.utils.errors"), autoload("katdotnvim.utils.export.init"), autoload("katdotnvim.highlights.main"), autoload("externals.hsluv"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["colors"] = colors
_2amodule_locals_2a["errors"] = errors
_2amodule_locals_2a["export"] = export
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["hsl"] = hsl
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
  local output
  local _3_
  if ((main["background-mut"])[1] == "light") then
    _3_ = {["  black:"] = ("'" .. groups.umbraFG()[1] .. "'"), ["  red:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).red, 0.2) .. "'"), ["  green:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).green, 0.2) .. "'"), ["  yellow:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).orange, 0.2) .. "'"), ["  blue:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).blue, 0.2) .. "'"), ["  magenta:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).pink, 0.2) .. "'"), ["  cyan:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).purple, 0.2) .. "'"), ["  white:"] = ("'" .. groups.umbraBG()[1] .. "'")}
  else
    _3_ = {["  black:"] = ("'" .. groups.umbraBG()[1] .. "'"), ["  red:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).red, 0.2) .. "'"), ["  green:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).green, 0.2) .. "'"), ["  yellow:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).orange, 0.2) .. "'"), ["  blue:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).blue, 0.2) .. "'"), ["  magenta:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).pink, 0.2) .. "'"), ["  cyan:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).purple, 0.2) .. "'"), ["  white:"] = ("'" .. groups.umbraFG()[1] .. "'")}
  end
  local _5_
  if ((main["background-mut"])[1] == "dark") then
    _5_ = {["  black:"] = ("'" .. groups.meldFG()[1] .. "'"), ["  red:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).red, 0.2) .. "'"), ["  green:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).green, 0.2) .. "'"), ["  yellow:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).orange, 0.2) .. "'"), ["  blue:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).blue, 0.2) .. "'"), ["  magenta:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).pink, 0.2) .. "'"), ["  cyan:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).purple, 0.2) .. "'"), ["  white:"] = ("'" .. groups.meldBG()[1] .. "'")}
  else
    _5_ = {["  black:"] = ("'" .. groups.meldBG()[1] .. "'"), ["  red:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).red, 0.2) .. "'"), ["  green:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).green, 0.2) .. "'"), ["  yellow:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).orange, 0.2) .. "'"), ["  blue:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).blue, 0.2) .. "'"), ["  magenta:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).pink, 0.2) .. "'"), ["  cyan:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).purple, 0.2) .. "'"), ["  white:"] = ("'" .. ("'" .. groups.meldFG()[1] .. "'"))}
  end
  output = {["colors:"] = {[" primary:"] = {["  background:"] = ("'" .. groups.mainBG()[1] .. "'"), ["  foreground:"] = ("'" .. groups.mainFG()[1] .. "'"), ["  dim_foreground:"] = ("'" .. groups.umbraFG()[1] .. "'"), ["  bright_foreground:"] = ("'" .. groups.meldFG()[1] .. "'"), ["  dim_background:"] = ("'" .. groups.umbraBG()[1] .. "'"), ["  bright_background:"] = ("'" .. groups.meldBG()[1] .. "'")}, [" cursor:"] = {["  text:"] = ("'" .. groups.mainBG()[1] .. "'"), ["  cursor:"] = ("'" .. groups.mainFG()[1] .. "'")}, [" normal:"] = {["  black:"] = black, ["  red:"] = ("'" .. (colors["normal-colors"]()).red .. "'"), ["  blue:"] = ("'" .. (colors["normal-colors"]()).blue .. "'"), ["  green:"] = ("'" .. (colors["normal-colors"]()).green .. "'"), ["  yellow:"] = ("'" .. (colors["normal-colors"]()).orange .. "'"), ["  cyan:"] = ("'" .. (colors["normal-colors"]()).purple .. "'"), ["  magenta:"] = ("'" .. (colors["normal-colors"]()).pink .. "'"), ["  white:"] = white}, [" bright:"] = _3_, [" dim:"] = _5_, [" selection:"] = {["  text:"] = "CellBackground", ["  background:"] = ("'" .. groups.selectionBG()[1] .. "'")}}}
  return output
end
_2amodule_2a["gen-colors"] = gen_colors
local function output_21()
  local file_name = string.format("alacritty-%s-%s.yml", tostring(vim.g.colors_name), tostring((main["background-mut"])[1]))
  local fd = assert(loop.fs_open(file_name, "w", 0))
  assert(loop.fs_chmod(file_name, 420))
  assert(loop.fs_write(fd, export["table->one-line-color"](gen_colors(), alacritty), 0))
  export["notify$"]("alacritty")
  return assert(loop.fs_close(fd))
end
_2amodule_2a["output!"] = output_21
return _2amodule_2a