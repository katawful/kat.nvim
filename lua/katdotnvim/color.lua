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
local autoload = (require("aniseed.autoload")).autoload
local main, ucolors = autoload("katdotnvim.main"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["main"] = main
_2amodule_locals_2a["ucolors"] = ucolors
local light_fore_back = "#121c2d"
_2amodule_locals_2a["light-fore-back"] = light_fore_back
local dark_fore_back = "#daf6ff"
_2amodule_locals_2a["dark-fore-back"] = dark_fore_back
local red_primary = "#eb4949"
_2amodule_locals_2a["red-primary"] = red_primary
local green_primary = "#2ce0aa"
_2amodule_locals_2a["green-primary"] = green_primary
local orange_primary = "#f2b15c"
_2amodule_locals_2a["orange-primary"] = orange_primary
local pink_primary = "#f29cb1"
_2amodule_locals_2a["pink-primary"] = pink_primary
local purple_primary = "#7a53a8"
_2amodule_locals_2a["purple-primary"] = purple_primary
local blue_primary = "#2dacd2"
_2amodule_locals_2a["blue-primary"] = blue_primary
local function def_normal_colors()
  local output = {red = red_primary, green = green_primary, orange = orange_primary, pink = pink_primary, purple = purple_primary, blue = blue_primary}
  return output
end
_2amodule_locals_2a["def-normal-colors"] = def_normal_colors
local function def_back_colors()
  local back
  if (vim.o.background == "dark") then
    if (main.contrast == "soft") then
      back = {ucolors.brighten(light_fore_back, 0.1), light_fore_back, ucolors.brighten(light_fore_back, 0.3), ucolors.brighten(light_fore_back, 0.5), ucolors.brighten(light_fore_back, 0.7), ucolors.brighten(light_fore_back, 0.9)}
    elseif ((main.contrast == "hard") or (main.contrast == nil)) then
      back = {light_fore_back, ucolors.brighten(light_fore_back, 0.1), ucolors.brighten(light_fore_back, 0.3), ucolors.brighten(light_fore_back, 0.5), ucolors.brighten(light_fore_back, 0.7), ucolors.brighten(light_fore_back, 0.9)}
    else
      back = nil
    end
  elseif (vim.o.background == "light") then
    if (main.contrast == "soft") then
      back = {ucolors.saturation(ucolors.darken(dark_fore_back, 0.1), -0.5), dark_fore_back, ucolors.saturation(ucolors.darken(dark_fore_back, 0.3), -0.5), ucolors.saturation(ucolors.darken(dark_fore_back, 0.5), -0.5), ucolors.saturation(ucolors.darken(dark_fore_back, 0.7), -0.5), ucolors.saturation(ucolors.darken(dark_fore_back, 0.9), -0.5)}
    elseif ((main.contrast == "hard") or (main.contrast == nil)) then
      back = {dark_fore_back, ucolors.saturation(ucolors.darken(dark_fore_back, 0.1), -0.5), ucolors.saturation(ucolors.darken(dark_fore_back, 0.3), -0.5), ucolors.saturation(ucolors.darken(dark_fore_back, 0.5), -0.5), ucolors.saturation(ucolors.darken(dark_fore_back, 0.7), -0.5), ucolors.saturation(ucolors.darken(dark_fore_back, 0.9), -0.5)}
    else
      back = nil
    end
  else
    back = nil
  end
  return back
end
_2amodule_locals_2a["def-back-colors"] = def_back_colors
local function def_fore_colors()
  local fore
  if (vim.o.background == "dark") then
    if (main.contrast == "soft") then
      fore = {ucolors.saturation(ucolors.darken(dark_fore_back, 0.1), -0.5), dark_fore_back, ucolors.saturation(ucolors.darken(dark_fore_back, 0.3), -0.5), ucolors.saturation(ucolors.darken(dark_fore_back, 0.5), -0.5), ucolors.saturation(ucolors.darken(dark_fore_back, 0.7), -0.5), ucolors.saturation(ucolors.darken(dark_fore_back, 0.9), -0.5)}
    elseif ((main.contrast == "hard") or (main.contrast == nil)) then
      fore = {dark_fore_back, ucolors.saturation(ucolors.darken(dark_fore_back, 0.1), -0.5), ucolors.saturation(ucolors.darken(dark_fore_back, 0.3), -0.5), ucolors.saturation(ucolors.darken(dark_fore_back, 0.5), -0.5), ucolors.saturation(ucolors.darken(dark_fore_back, 0.7), -0.5), ucolors.saturation(ucolors.darken(dark_fore_back, 0.9), -0.5)}
    else
      fore = nil
    end
  elseif (vim.o.background == "light") then
    if (main.contrast == "soft") then
      fore = {ucolors.brighten(light_fore_back, 0.1), light_fore_back, ucolors.brighten(light_fore_back, 0.3), ucolors.brighten(light_fore_back, 0.5), ucolors.brighten(light_fore_back, 0.7), ucolors.brighten(light_fore_back, 0.9)}
    elseif ((main.contrast == "hard") or (main.contrast == nil)) then
      fore = {light_fore_back, ucolors.brighten(light_fore_back, 0.1), ucolors.brighten(light_fore_back, 0.3), ucolors.brighten(light_fore_back, 0.5), ucolors.brighten(light_fore_back, 0.7), ucolors.brighten(light_fore_back, 0.9)}
    else
      fore = nil
    end
  else
    fore = nil
  end
  return fore
end
_2amodule_locals_2a["def-fore-colors"] = def_fore_colors
local function init(table)
  local _7_ = table
  if (_7_ == "normalColors") then
    return def_normal_colors()
  elseif (_7_ == "background") then
    return def_back_colors()
  elseif (_7_ == "foreground") then
    return def_fore_colors()
  else
    return nil
  end
end
_2amodule_2a["init"] = init
local function normal_colors()
  return def_normal_colors()
end
_2amodule_2a["normal-colors"] = normal_colors
local function background()
  return def_back_colors()
end
_2amodule_2a["background"] = background
local function foreground()
  return def_fore_colors()
end
_2amodule_2a["foreground"] = foreground
return _2amodule_2a