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
local colors, export, groups, main, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.utils.export.init"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["export"] = export
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["ucolors"] = ucolors
local loop = vim.loop
_2amodule_locals_2a["loop"] = loop
local comment_type = "!"
_2amodule_2a["comment-type"] = comment_type
local function gen_colors()
  local output = {["*foreground:"] = colors.kat.fg.auto.color, ["*background:"] = colors.kat.bg.base.color, ["*cursorColor:"] = colors.kat.fg.auto.color, ["*fadeColor:"] = colors.kat.bg.meld.color, ["*pointerColorForeground:"] = colors.kat.fg.auto.color, ["*pointerColorBackground:"] = colors.kat.bg.base.color, ["Urxvt*foreground:"] = colors.kat.fg.auto.color, ["Urxvt*background:"] = colors.kat.bg.base.color, ["URxvt*color0:"] = colors.kat.bg.base.color, ["URxvt*color1:"] = colors.kat.red.base.color, ["URxvt*color2:"] = colors.kat.green.base.color, ["URxvt*color3:"] = colors.kat.orange.base.color, ["URxvt*color4:"] = colors.kat.blue.base.color, ["URxvt*color5:"] = colors.kat.pink.base.color, ["URxvt*color6:"] = colors.kat.purple.base.color, ["URxvt*color7:"] = colors.kat.fg.auto.color, ["URxvt*color8:"] = colors.kat.bg.umbra.color, ["URxvt*color15:"] = colors.kat.fg.umbra.color}
  if ((main["background-mut"])[1] == "light") then
    output["URxvt*color9:"] = ucolors.darken(colors.kat.red.base.color, 0.2)
    do end (output)["URxvt*color10:"] = ucolors.darken(colors.kat.green.base.color, 0.2)
    do end (output)["URxvt*color11:"] = ucolors.darken(colors.kat.orange.base.color, 0.2)
    do end (output)["URxvt*color12:"] = ucolors.darken(colors.kat.blue.base.color, 0.2)
    do end (output)["URxvt*color13:"] = ucolors.darken(colors.kat.pink.base.color, 0.2)
    do end (output)["URxvt*color14:"] = ucolors.darken(colors.kat.purple.base.color, 0.2)
  else
    output["URxvt*color9:"] = ucolors.brighten(colors.kat.red.base.color, 0.2)
    do end (output)["URxvt*color10:"] = ucolors.brighten(colors.kat.green.base.color, 0.2)
    do end (output)["URxvt*color11:"] = ucolors.brighten(colors.kat.orange.base.color, 0.2)
    do end (output)["URxvt*color12:"] = ucolors.brighten(colors.kat.blue.base.color, 0.2)
    do end (output)["URxvt*color13:"] = ucolors.brighten(colors.kat.pink.base.color, 0.2)
    do end (output)["URxvt*color14:"] = ucolors.brighten(colors.kat.purple.base.color, 0.2)
  end
  return output
end
_2amodule_2a["gen-colors"] = gen_colors
local function output_21()
  local file_name = string.format("Urxvt-%s-%s.Xresources", tostring((main["colors-name-mut"])[1]), tostring((main["background-mut"])[1]))
  local fd = assert(loop.fs_open(file_name, "w", 0))
  assert(loop.fs_chmod(file_name, 420))
  assert(loop.fs_write(fd, export["string->one-line-color"](gen_colors(), "rxvt-unicode"), 0))
  export["notify$"]("rxvt-unicode")
  return assert(loop.fs_close(fd))
end
_2amodule_2a["output!"] = output_21
return _2amodule_2a