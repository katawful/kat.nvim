local _2afile_2a = "fnl/katdotnvim/color.fnl"
local _2amodule_name_2a = "katdotnvim.color"
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
local ucolors = autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["ucolors"] = ucolors
local back = {}
local fore = {}
if (vim.g.kat_nvim_style == "dark") then
  if (vim.g.kat_nvim_contrast == "soft") then
    back = {"#1c2e4a", "#121c2d", "#2c466e", "#46689c", "#6690d0", "#78adff"}
  else
  end
  if (vim.g.kat_nvim_contrast == "hard") then
    back = {"#121c2d", "#1c2e4a", "#2c466e", "#46689c", "#6690d0", "#78adff"}
  else
  end
  if (vim.g.kat_nvim_contrast == "soft") then
    fore = {"#b5d5df", "#daf6ff", "#8dbcca", "#699faf", "#4f7e8c", "#325049"}
  else
  end
  if (vim.g.kat_nvim_contrast == "hard") then
    fore = {"#daf6ff", "#b5d5df", "#8dbcca", "#699faf", "#4f7e8c", "#325049"}
  else
  end
else
end
if (vim.g.kat_nvim_style == "light") then
  if (vim.g.kat_nvim_contrast == "soft") then
    back = {"#b5d5df", "#daf6ff", "#8dbcca", "#699faf", "#4f7e8c", "#325049"}
  else
  end
  if (vim.g.kat_nvim_contrast == "hard") then
    back = {"#daf6ff", "#b5d5df", "#8dbcca", "#699faf", "#4f7e8c", "#325049"}
  else
  end
  if (vim.g.kat_nvim_contrast == "soft") then
    fore = {"#1c2e4a", "#121c2d", "#2c466e", "#46689c", "#6690d0", "#78adff"}
  else
  end
  if (vim.g.kat_nvim_contrast == "hard") then
    fore = {"#121c2d", "#1c2e4a", "#2c466e", "#46689c", "#6690d0", "#78adff"}
  else
  end
else
end
local normalColors = {red = "#eb4949", green = "#2ce0aa", orange = "#f2b15c", pink = "#f29cb1", purple = "#7a53a8", blue = "#2dacd2"}
_2amodule_2a["normalColors"] = normalColors
local background = back
_2amodule_2a["background"] = background
local foreground = fore
_2amodule_2a["foreground"] = foreground