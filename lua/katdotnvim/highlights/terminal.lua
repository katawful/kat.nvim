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
local color_table, main, ucolors, _ = require("katdotnvim.color"), require("katdotnvim.main"), require("katdotnvim.utils.highlight.utils"), nil
_2amodule_locals_2a["color-table"] = color_table
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["ucolors"] = ucolors
_2amodule_locals_2a["_"] = _
local function init()
  vim.g["terminal_color_3"] = color_table.kat.orange.base.color
  vim.g["terminal_color_15"] = color_table.kat.fg.umbra.color
  vim.g["terminal_color_4"] = color_table.kat.blue.base.color
  vim.g["terminal_color_5"] = color_table.kat.pink.base.color
  vim.g["terminal_color_0"] = color_table.kat.bg.base.color
  vim.g["terminal_color_6"] = color_table.kat.purple.base.color
  vim.g["terminal_color_1"] = color_table.kat.red.base.color
  vim.g["terminal_color_7"] = color_table.kat.fg.base.color
  vim.g["terminal_color_2"] = color_table.kat.green.base.color
  vim.g["terminal_color_8"] = color_table.kat.bg.umbra.color
  do local _ = {nil, nil, nil, nil, nil, nil, nil, nil, nil, nil} end
  if ((main["background-mut"])[1] == "light") then
    vim.g["terminal_color_9"] = ucolors.darken(color_table.kat.red.base.color, 0.2)
    do end (vim.g)["terminal_color_13"] = ucolors.darken(color_table.kat.pink.base.color, 0.2)
    do end (vim.g)["terminal_color_10"] = ucolors.darken(color_table.kat.green.base.color, 0.2)
    do end (vim.g)["terminal_color_14"] = ucolors.darken(color_table.kat.purple.base.color, 0.2)
    do end (vim.g)["terminal_color_11"] = ucolors.darken(color_table.kat.orange.base.color, 0.2)
    do end (vim.g)["terminal_color_12"] = ucolors.darken(color_table.kat.blue.base.color, 0.2)
    return {nil, nil, nil, nil, nil, nil}
  else
    vim.g["terminal_color_9"] = ucolors.brighten(color_table.kat.red.base.color, 0.2)
    do end (vim.g)["terminal_color_13"] = ucolors.brighten(color_table.kat.pink.base.color, 0.2)
    do end (vim.g)["terminal_color_10"] = ucolors.brighten(color_table.kat.green.base.color, 0.2)
    do end (vim.g)["terminal_color_14"] = ucolors.brighten(color_table.kat.purple.base.color, 0.2)
    do end (vim.g)["terminal_color_11"] = ucolors.brighten(color_table.kat.orange.base.color, 0.2)
    do end (vim.g)["terminal_color_12"] = ucolors.brighten(color_table.kat.blue.base.color, 0.2)
    return {nil, nil, nil, nil, nil, nil}
  end
end
_2amodule_2a["init"] = init
return _2amodule_2a