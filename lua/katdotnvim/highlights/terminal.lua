local _2afile_2a = "fnl/katdotnvim/highlights/terminal.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.terminal"
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
local autoload = (require("aniseed.autoload")).autoload
local colors, groups, main, syntax, ucolors, _ = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.main"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.highlight.utils"), nil
_2amodule_locals_2a["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
_2amodule_locals_2a["_"] = _
local function init()
  vim.g["terminal_color_0"] = (colors.init("background"))[1]
  vim.g["terminal_color_1"] = (colors.init("normalColors")).red
  vim.g["terminal_color_2"] = (colors.init("normalColors")).green
  vim.g["terminal_color_3"] = (colors.init("normalColors")).orange
  vim.g["terminal_color_4"] = (colors.init("normalColors")).blue
  vim.g["terminal_color_5"] = (colors.init("normalColors")).pink
  vim.g["terminal_color_6"] = (colors.init("normalColors")).purple
  vim.g["terminal_color_7"] = (colors.init("foreground"))[1]
  vim.g["terminal_color_8"] = (colors.init("background"))[2]
  if (vim.o.background == "light") then
    vim.g["terminal_color_9"] = ucolors.darken((colors.init("normalColors")).red, 0.2)
    do end (vim.g)["terminal_color_10"] = ucolors.darken((colors.init("normalColors")).green, 0.2)
    do end (vim.g)["terminal_color_11"] = ucolors.darken((colors.init("normalColors")).orange, 0.2)
    do end (vim.g)["terminal_color_12"] = ucolors.darken((colors.init("normalColors")).blue, 0.2)
    do end (vim.g)["terminal_color_13"] = ucolors.darken((colors.init("normalColors")).pink, 0.2)
    do end (vim.g)["terminal_color_14"] = ucolors.darken((colors.init("normalColors")).purple, 0.2)
  else
    vim.g["terminal_color_9"] = ucolors.brighten((colors.init("normalColors")).red, 0.2)
    do end (vim.g)["terminal_color_10"] = ucolors.brighten((colors.init("normalColors")).green, 0.2)
    do end (vim.g)["terminal_color_11"] = ucolors.brighten((colors.init("normalColors")).orange, 0.2)
    do end (vim.g)["terminal_color_12"] = ucolors.brighten((colors.init("normalColors")).blue, 0.2)
    do end (vim.g)["terminal_color_13"] = ucolors.brighten((colors.init("normalColors")).pink, 0.2)
    do end (vim.g)["terminal_color_14"] = ucolors.brighten((colors.init("normalColors")).purple, 0.2)
  end
  vim.g["terminal_color_15"] = (colors.init("foreground"))[2]
  return nil
end
_2amodule_2a["init"] = init
return _2amodule_2a