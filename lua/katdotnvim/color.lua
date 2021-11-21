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
local main, ucolors = autoload("katdotnvim.main"), autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["main"] = main
_2amodule_locals_2a["ucolors"] = ucolors
local function defineNormalColors()
  local output = {red = "#eb4949", green = "#2ce0aa", orange = "#f2b15c", pink = "#f29cb1", purple = "#7a53a8", blue = "#2dacd2"}
  _2amodule_2a["output"] = output
  return output
end
_2amodule_2a["defineNormalColors"] = defineNormalColors
local function defineBack()
  local back = {}
  if (main.katStyle == "dark") then
    if (main.katContrast == "soft") then
      back = {ucolors.brighten("#121c2d", 0.1), "#121c2d", ucolors.brighten("#121c2d", 0.3), ucolors.brighten("#121c2d", 0.5), ucolors.brighten("#121c2d", 0.7), ucolors.brighten("#121c2d", 0.9)}
    else
    end
    if (main.katContrast == "hard") then
      back = {"#121c2d", ucolors.brighten("#121c2d", 0.1), ucolors.brighten("#121c2d", 0.3), ucolors.brighten("#121c2d", 0.5), ucolors.brighten("#121c2d", 0.7), ucolors.brighten("#121c2d", 0.9)}
    else
    end
  else
  end
  if (main.katStyle == "light") then
    if (main.katContrast == "soft") then
      back = {ucolors.saturation(ucolors.darken("#daf6ff", 0.1), -0.5), "#daf6ff", ucolors.saturation(ucolors.darken("#daf6ff", 0.3), -0.5), ucolors.saturation(ucolors.darken("#daf6ff", 0.5), -0.5), ucolors.saturation(ucolors.darken("#daf6ff", 0.7), -0.5), ucolors.saturation(ucolors.darken("#daf6ff", 0.9), -0.5)}
    else
    end
    if (main.katContrast == "hard") then
      back = {"#daf6ff", ucolors.saturation(ucolors.darken("#daf6ff", 0.1), -0.5), ucolors.saturation(ucolors.darken("#daf6ff", 0.3), -0.5), ucolors.saturation(ucolors.darken("#daf6ff", 0.5), -0.5), ucolors.saturation(ucolors.darken("#daf6ff", 0.7), -0.5), ucolors.saturation(ucolors.darken("#daf6ff", 0.9), -0.5)}
    else
    end
  else
  end
  return back
end
_2amodule_2a["defineBack"] = defineBack
local function defineFore()
  local fore = {}
  if (main.katStyle == "dark") then
    if (main.katContrast == "soft") then
      fore = {ucolors.saturation(ucolors.darken("#daf6ff", 0.1), -0.5), "#daf6ff", ucolors.saturation(ucolors.darken("#daf6ff", 0.3), -0.5), ucolors.saturation(ucolors.darken("#daf6ff", 0.5), -0.5), ucolors.saturation(ucolors.darken("#daf6ff", 0.7), -0.5), ucolors.saturation(ucolors.darken("#daf6ff", 0.9), -0.5)}
    else
    end
    if (main.katContrast == "hard") then
      fore = {"#daf6ff", ucolors.saturation(ucolors.darken("#daf6ff", 0.1), -0.5), ucolors.saturation(ucolors.darken("#daf6ff", 0.3), -0.5), ucolors.saturation(ucolors.darken("#daf6ff", 0.5), -0.5), ucolors.saturation(ucolors.darken("#daf6ff", 0.7), -0.5), ucolors.saturation(ucolors.darken("#daf6ff", 0.9), -0.5)}
    else
    end
  else
  end
  if (main.katStyle == "light") then
    if (main.katContrast == "soft") then
      fore = {ucolors.brighten("#121c2d", 0.1), "#121c2d", ucolors.brighten("#121c2d", 0.3), ucolors.brighten("#121c2d", 0.5), ucolors.brighten("#121c2d", 0.7), ucolors.brighten("#121c2d", 0.9)}
    else
    end
    if (main.katContrast == "hard") then
      fore = {"#121c2d", ucolors.brighten("#121c2d", 0.1), ucolors.brighten("#121c2d", 0.3), ucolors.brighten("#121c2d", 0.5), ucolors.brighten("#121c2d", 0.7), ucolors.brighten("#121c2d", 0.9)}
    else
    end
  else
  end
  return fore
end
_2amodule_2a["defineFore"] = defineFore
local function init(table)
  local _13_ = table
  if (_13_ == "normalColors") then
    return defineNormalColors()
  elseif (_13_ == "background") then
    return defineBack()
  elseif (_13_ == "foreground") then
    return defineFore()
  else
    return nil
  end
end
_2amodule_2a["init"] = init
local normalColors = defineNormalColors()
do end (_2amodule_2a)["normalColors"] = normalColors
local background = defineBack()
do end (_2amodule_2a)["background"] = background
local foreground = defineFore()
do end (_2amodule_2a)["foreground"] = foreground