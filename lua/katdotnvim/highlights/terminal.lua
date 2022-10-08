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
local autoload = (require("katdotnvim.aniseed.autoload")).autoload
local colors, main, ucolors, _ = autoload("katdotnvim.color"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.highlight.utils"), nil
_2amodule_locals_2a["colors"] = colors
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["ucolors"] = ucolors
_2amodule_locals_2a["_"] = _
local function init()
  vim.g["terminal_color_7"] = colors.kat.fg.base.color
  vim.g["terminal_color_8"] = colors.kat.bg.umbra.color
  vim.g["terminal_color_0"] = colors.kat.bg.base.color
  vim.g["terminal_color_1"] = colors.kat.red.base.color
  vim.g["terminal_color_3"] = colors.kat.orange.base.color
  vim.g["terminal_color_4"] = colors.kat.blue.base.color
  vim.g["terminal_color_15"] = colors.kat.fg.umbra.color
  vim.g["terminal_color_5"] = colors.kat.pink.base.color
  vim.g["terminal_color_2"] = colors.kat.green.base.color
  vim.g["terminal_color_6"] = colors.kat.purple.base.color
  do local _ = {nil, nil, nil, nil, nil, nil, nil, nil, nil, nil} end
  if ((main["background-mut"])[1] == "light") then
    vim.g["terminal_color_9"] = ucolors.darken(colors.kat.red.base.color, 0.2)
    do end (vim.g)["terminal_color_13"] = ucolors.darken(colors.kat.pink.base.color, 0.2)
    do end (vim.g)["terminal_color_10"] = ucolors.darken(colors.kat.green.base.color, 0.2)
    do end (vim.g)["terminal_color_11"] = ucolors.darken(colors.kat.orange.base.color, 0.2)
    do end (vim.g)["terminal_color_14"] = ucolors.darken(colors.kat.purple.base.color, 0.2)
    do end (vim.g)["terminal_color_12"] = ucolors.darken(colors.kat.blue.base.color, 0.2)
    return {nil, nil, nil, nil, nil, nil}
  else
    vim.g["terminal_color_9"] = ucolors.brighten(colors.kat.red.base.color, 0.2)
    do end (vim.g)["terminal_color_13"] = ucolors.brighten(colors.kat.pink.base.color, 0.2)
    do end (vim.g)["terminal_color_10"] = ucolors.brighten(colors.kat.green.base.color, 0.2)
    do end (vim.g)["terminal_color_11"] = ucolors.brighten(colors.kat.orange.base.color, 0.2)
    do end (vim.g)["terminal_color_14"] = ucolors.brighten(colors.kat.purple.base.color, 0.2)
    do end (vim.g)["terminal_color_12"] = ucolors.brighten(colors.kat.blue.base.color, 0.2)
    return {nil, nil, nil, nil, nil, nil}
  end
end
_2amodule_2a["init"] = init
return _2amodule_2a