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
local colors, groups, syntax, ucolors, _ = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.color"), nil
_2amodule_locals_2a["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
_2amodule_locals_2a["_"] = _
local function init()
  vim.g["terminal_color_0"] = colors.background[1]
  vim.g["terminal_color_1"] = colors.normalColors.red
  vim.g["terminal_color_2"] = colors.normalColors.green
  vim.g["terminal_color_3"] = colors.normalColors.orange
  vim.g["terminal_color_4"] = colors.normalColors.blue
  vim.g["terminal_color_5"] = colors.normalColors.pink
  vim.g["terminal_color_6"] = colors.normalColors.purple
  vim.g["terminal_color_7"] = colors.foreground[1]
  vim.g["terminal_color_8"] = colors.background[2]
  if (vim.g.kat_nvim_settings.style == "light") then
    vim.g["terminal_color_9"] = ucolors.brighten(colors.normalColors.red, 0.2)
    do end (vim.g)["terminal_color_10"] = ucolors.brighten(colors.normalColors.green, 0.2)
    do end (vim.g)["terminal_color_11"] = ucolors.brighten(colors.normalColors.orange, 0.2)
    do end (vim.g)["terminal_color_12"] = ucolors.brighten(colors.normalColors.blue, 0.2)
    do end (vim.g)["terminal_color_13"] = ucolors.brighten(colors.normalColors.pink, 0.2)
    do end (vim.g)["terminal_color_14"] = ucolors.brighten(colors.normalColors.purple, 0.2)
  else
    vim.g["terminal_color_9"] = ucolors.brighten(colors.normalColors.red, 0.2)
    do end (vim.g)["terminal_color_10"] = ucolors.brighten(colors.normalColors.green, 0.2)
    do end (vim.g)["terminal_color_11"] = ucolors.brighten(colors.normalColors.orange, 0.2)
    do end (vim.g)["terminal_color_12"] = ucolors.brighten(colors.normalColors.blue, 0.2)
    do end (vim.g)["terminal_color_13"] = ucolors.brighten(colors.normalColors.pink, 0.2)
    do end (vim.g)["terminal_color_14"] = ucolors.brighten(colors.normalColors.purple, 0.2)
  end
  vim.g["terminal_color_15"] = colors.foreground[2]
  return nil
end
_2amodule_2a["init"] = init