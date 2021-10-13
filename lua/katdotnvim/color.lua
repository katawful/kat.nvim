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
if (vim.g.kat_nvim_settings.style == "dark") then
  local background = {"#121c2d", "#1c2e4a", "#2c466e", "#46689c", "#6690d0", "#78adff"}
  _2amodule_2a["background"] = background
else
  local foreground = {"#daf6ff", "#b5d5df", "#8dbcca", "#699faf", "#4f7e8c", "#325049"}
  _2amodule_2a["foreground"] = foreground
end
if (vim.g.kat_nvim_settings.style == "light") then
  local background = {"#daf6ff", "#b5d5df", "#8dbcca", "#699faf", "#4f7e8c", "#325049"}
  _2amodule_2a["background"] = background
else
  local foreground = {"#121c2d", "#1c2e4a", "#2c466e", "#46689c", "#6690d0", "#78adff"}
  _2amodule_2a["foreground"] = foreground
end
local normalColors = {red = "#eb4949", green = "#9dffd2", orange = "#f2b15c", pink = "#f29cb1", purple = "#7a53a8", blue = "#8af9ff"}
_2amodule_2a["normalColors"] = normalColors