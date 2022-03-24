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
local lightForeBack = "#121c2d"
_2amodule_locals_2a["lightForeBack"] = lightForeBack
local darkForeBack = "#daf6ff"
_2amodule_locals_2a["darkForeBack"] = darkForeBack
local redPrimary = "#eb4949"
_2amodule_locals_2a["redPrimary"] = redPrimary
local greenPrimary = "#2ce0aa"
_2amodule_locals_2a["greenPrimary"] = greenPrimary
local orangePrimary = "#f2b15c"
_2amodule_locals_2a["orangePrimary"] = orangePrimary
local pinkPrimary = "#f29cb1"
_2amodule_locals_2a["pinkPrimary"] = pinkPrimary
local purplePrimary = "#7a53a8"
_2amodule_locals_2a["purplePrimary"] = purplePrimary
local bluePrimary = "#2dacd2"
_2amodule_locals_2a["bluePrimary"] = bluePrimary
local function defineNormalColors()
  local output = {red = redPrimary, green = greenPrimary, orange = orangePrimary, pink = pinkPrimary, purple = purplePrimary, blue = bluePrimary}
  return output
end
_2amodule_locals_2a["defineNormalColors"] = defineNormalColors
local function defineBack()
  local back = {}
  if (vim.o.background == "dark") then
    if (main.katContrast == "soft") then
      back = {ucolors.brighten(lightForeBack, 0.1), lightForeBack, ucolors.brighten(lightForeBack, 0.3), ucolors.brighten(lightForeBack, 0.5), ucolors.brighten(lightForeBack, 0.7), ucolors.brighten(lightForeBack, 0.9)}
    else
    end
    if ((main.katContrast == "hard") or (main.katContrast == nil)) then
      back = {lightForeBack, ucolors.brighten(lightForeBack, 0.1), ucolors.brighten(lightForeBack, 0.3), ucolors.brighten(lightForeBack, 0.5), ucolors.brighten(lightForeBack, 0.7), ucolors.brighten(lightForeBack, 0.9)}
    else
    end
  else
  end
  if (vim.o.background == "light") then
    if (main.katContrast == "soft") then
      back = {ucolors.saturation(ucolors.darken(darkForeBack, 0.1), -0.5), darkForeBack, ucolors.saturation(ucolors.darken(darkForeBack, 0.3), -0.5), ucolors.saturation(ucolors.darken(darkForeBack, 0.5), -0.5), ucolors.saturation(ucolors.darken(darkForeBack, 0.7), -0.5), ucolors.saturation(ucolors.darken(darkForeBack, 0.9), -0.5)}
    else
    end
    if ((main.katContrast == "hard") or (main.katContrast == nil)) then
      back = {darkForeBack, ucolors.saturation(ucolors.darken(darkForeBack, 0.1), -0.5), ucolors.saturation(ucolors.darken(darkForeBack, 0.3), -0.5), ucolors.saturation(ucolors.darken(darkForeBack, 0.5), -0.5), ucolors.saturation(ucolors.darken(darkForeBack, 0.7), -0.5), ucolors.saturation(ucolors.darken(darkForeBack, 0.9), -0.5)}
    else
    end
  else
  end
  return back
end
_2amodule_locals_2a["defineBack"] = defineBack
local function defineFore()
  local fore = {}
  if (vim.o.background == "dark") then
    if (main.katContrast == "soft") then
      fore = {ucolors.saturation(ucolors.darken(darkForeBack, 0.1), -0.5), darkForeBack, ucolors.saturation(ucolors.darken(darkForeBack, 0.3), -0.5), ucolors.saturation(ucolors.darken(darkForeBack, 0.5), -0.5), ucolors.saturation(ucolors.darken(darkForeBack, 0.7), -0.5), ucolors.saturation(ucolors.darken(darkForeBack, 0.9), -0.5)}
    else
    end
    if ((main.katContrast == "hard") or (main.katContrast == nil)) then
      fore = {darkForeBack, ucolors.saturation(ucolors.darken(darkForeBack, 0.1), -0.5), ucolors.saturation(ucolors.darken(darkForeBack, 0.3), -0.5), ucolors.saturation(ucolors.darken(darkForeBack, 0.5), -0.5), ucolors.saturation(ucolors.darken(darkForeBack, 0.7), -0.5), ucolors.saturation(ucolors.darken(darkForeBack, 0.9), -0.5)}
    else
    end
  else
  end
  if (vim.o.background == "light") then
    if (main.katContrast == "soft") then
      fore = {ucolors.brighten(lightForeBack, 0.1), lightForeBack, ucolors.brighten(lightForeBack, 0.3), ucolors.brighten(lightForeBack, 0.5), ucolors.brighten(lightForeBack, 0.7), ucolors.brighten(lightForeBack, 0.9)}
    else
    end
    if ((main.katContrast == "hard") or (main.katContrast == nil)) then
      fore = {lightForeBack, ucolors.brighten(lightForeBack, 0.1), ucolors.brighten(lightForeBack, 0.3), ucolors.brighten(lightForeBack, 0.5), ucolors.brighten(lightForeBack, 0.7), ucolors.brighten(lightForeBack, 0.9)}
    else
    end
  else
  end
  return fore
end
_2amodule_locals_2a["defineFore"] = defineFore
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
local function normal_colors()
  return defineNormalColors()
end
_2amodule_2a["normal-colors"] = normal_colors
local function background()
  return defineBack()
end
_2amodule_2a["background"] = background
local function foreground()
  return defineFore()
end
_2amodule_2a["foreground"] = foreground
return _2amodule_2a