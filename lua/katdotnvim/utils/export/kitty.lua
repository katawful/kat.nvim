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
  local output = {foreground = groups.mainFG()[1], background = groups.mainBG()[1], selection_foreground = groups.selectionFG()[1], selection_background = groups.selectionBG()[1], contrast = (main["contrast-mut"])[1], shade = (main["background-mut"])[1], cursor = (groups.mainFG()[1])[1], cursor_text_color = "background", color0 = groups.mainBG()[1], color1 = (colors["normal-colors"]()).red, color2 = (colors["normal-colors"]()).green, color3 = (colors["normal-colors"]()).orange, color4 = (colors["normal-colors"]()).blue, color5 = (colors["normal-colors"]()).pink, color6 = (colors["normal-colors"]()).purple, color7 = groups.mainFG()[1], color8 = groups.umbraBG()[1], color15 = groups.umbraFG()[1]}
  if ((main["background-mut"])[1] == "light") then
    output["color9"] = ucolors.darken((colors["normal-colors"]()).red, 0.2)
    do end (output)["color10"] = ucolors.darken((colors["normal-colors"]()).green, 0.2)
    do end (output)["color11"] = ucolors.darken((colors["normal-colors"]()).orange, 0.2)
    do end (output)["color12"] = ucolors.darken((colors["normal-colors"]()).blue, 0.2)
    do end (output)["color13"] = ucolors.darken((colors["normal-colors"]()).pink, 0.2)
    do end (output)["color14"] = ucolors.darken((colors["normal-colors"]()).purple, 0.2)
  else
    output["color9"] = ucolors.brighten((colors["normal-colors"]()).red, 0.2)
    do end (output)["color10"] = ucolors.brighten((colors["normal-colors"]()).green, 0.2)
    do end (output)["color11"] = ucolors.brighten((colors["normal-colors"]()).orange, 0.2)
    do end (output)["color12"] = ucolors.brighten((colors["normal-colors"]()).blue, 0.2)
    do end (output)["color13"] = ucolors.brighten((colors["normal-colors"]()).pink, 0.2)
    do end (output)["color14"] = ucolors.brighten((colors["normal-colors"]()).purple, 0.2)
  end
  return output
end
_2amodule_2a["gen-colors"] = gen_colors
local function output_21()
  local file_name = string.format("kitty-%s-%s.conf", tostring(vim.g.colors_name), tostring((main["background-mut"])[1]))
  local fd = assert(loop.fs_open(file_name, "w", 0))
  assert(loop.fs_chmod(file_name, 420))
  assert(loop.fs_write(fd, export["string->one-line-color"](gen_colors(), "kitty"), 0))
  export["notify$"]("kitty")
  return assert(loop.fs_close(fd))
end
_2amodule_2a["output!"] = output_21
return _2amodule_2a