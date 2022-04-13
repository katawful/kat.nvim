local _2afile_2a = "fnl/katdotnvim/utils/export/rxvt.fnl"
local _2amodule_name_2a = "katdotnvim.utils.export.rxvt"
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
local a, colors, errors, export, groups, hsl, main, ucolors = autoload("katdotnvim.aniseed.core"), autoload("katdotnvim.color"), autoload("katdotnvim.utils.errors"), autoload("katdotnvim.utils.export.init"), autoload("katdotnvim.highlights.main"), autoload("externals.hsluv"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.color")
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
local comment_type = "!"
_2amodule_2a["comment-type"] = comment_type
local function gen_colors()
  local output = {["URxvt*foreground:"] = groups.mainFG()[1], ["URxvt*background:"] = groups.mainBG()[1], ["URxvt*color0:"] = groups.mainBG()[1], ["URxvt*color1:"] = (colors["normal-colors"]()).red, ["URxvt*color2:"] = (colors["normal-colors"]()).green, ["URxvt*color3:"] = (colors["normal-colors"]()).orange, ["URxvt*color4:"] = (colors["normal-colors"]()).blue, ["URxvt*color5:"] = (colors["normal-colors"]()).pink, ["URxvt*color6:"] = (colors["normal-colors"]()).purple, ["URxvt*color7:"] = groups.mainFG()[1], ["URxvt*color8:"] = groups.umbraBG()[1], ["URxvt*color15:"] = groups.umbraFG()[1]}
  if (vim.o.background == "light") then
    output["URxvt*color9:"] = ucolors.darken((colors["normal-colors"]()).red, 0.2)
    do end (output)["URxvt*color10:"] = ucolors.darken((colors["normal-colors"]()).green, 0.2)
    do end (output)["URxvt*color11:"] = ucolors.darken((colors["normal-colors"]()).orange, 0.2)
    do end (output)["URxvt*color12:"] = ucolors.darken((colors["normal-colors"]()).blue, 0.2)
    do end (output)["URxvt*color13:"] = ucolors.darken((colors["normal-colors"]()).pink, 0.2)
    do end (output)["URxvt*color14:"] = ucolors.darken((colors["normal-colors"]()).purple, 0.2)
  else
    output["URxvt*color9:"] = ucolors.brighten((colors["normal-colors"]()).red, 0.2)
    do end (output)["URxvt*color10:"] = ucolors.brighten((colors["normal-colors"]()).green, 0.2)
    do end (output)["URxvt*color11:"] = ucolors.brighten((colors["normal-colors"]()).orange, 0.2)
    do end (output)["URxvt*color12:"] = ucolors.brighten((colors["normal-colors"]()).blue, 0.2)
    do end (output)["URxvt*color13:"] = ucolors.brighten((colors["normal-colors"]()).pink, 0.2)
    do end (output)["URxvt*color14:"] = ucolors.brighten((colors["normal-colors"]()).purple, 0.2)
  end
  return output
end
_2amodule_2a["gen-colors"] = gen_colors
local function output_21()
  local file_name = string.format("Urxvt-%s-%s.Xresources", tostring(vim.g.colors_name), tostring(vim.o.background))
  local fd = assert(loop.fs_open(file_name, "w", 0))
  assert(loop.fs_chmod(file_name, 420))
  assert(loop.fs_write(fd, export["string->one-line-color"](gen_colors(), "rxvt-unicode"), 0))
  export["notify$"]("rxvt-unicode")
  return assert(loop.fs_close(fd))
end
_2amodule_2a["output!"] = output_21
return _2amodule_2a