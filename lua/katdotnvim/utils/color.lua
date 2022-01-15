local _2afile_2a = "fnl/katdotnvim/utils/color.fnl"
local _2amodule_name_2a = "katdotnvim.utils.color"
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
local a, colors, hsl, _ = autoload("katdotnvim.aniseed.core"), autoload("katdotnvim.color"), autoload("externals.hsluv"), nil
_2amodule_locals_2a["a"] = a
_2amodule_locals_2a["colors"] = colors
_2amodule_locals_2a["hsl"] = hsl
_2amodule_locals_2a["_"] = _
local function blendColors(sourceColor, mixColor, alpha)
  local sourceColor0 = hsl.hex_to_rgb(sourceColor)
  local mixColor0 = hsl.hex_to_rgb(mixColor)
  local returnColor = {}
  for i = 1, 3 do
    local currentColor = ((alpha * (sourceColor0)[i]) + ((1 - alpha) * (mixColor0)[i]))
    do end (returnColor)[i] = currentColor
  end
  local output = tostring(hsl.rgb_to_hex(returnColor))
  return output
end
_2amodule_2a["blendColors"] = blendColors
local function highlight(gr, fg, bg, ...)
  local group = tostring(gr)
  local fore = " "
  local back = " "
  if (fg ~= "SKIP") then
    fore = (" guifg=" .. fg)
  else
  end
  if (bg ~= "SKIP") then
    back = (" guibg=" .. bg)
  else
  end
  local extra = ""
  local args = {...}
  if (#args > 0) then
    for k, v in pairs(args) do
      if (string.sub(v, 1, 1) == "#") then
        extra = (extra .. " guisp=" .. v)
      elseif (a["string?"](v) == true) then
        extra = (extra .. " gui=" .. tostring(v))
      else
        extra = (extra .. " blend" .. v)
      end
    end
  else
  end
  local output = ("highlight " .. group .. fore .. back .. extra)
  return vim.cmd(tostring(output))
end
_2amodule_2a["highlight"] = highlight
local function brighten(color, percent)
  local hslColor = hsl.hex_to_hsluv(color)
  local luminance = (100 - hslColor[3])
  local inputLuminance = (hslColor[3] + (luminance * percent))
  if (inputLuminance >= 100) then
    inputLuminance = 99.99
  else
  end
  hslColor[3] = inputLuminance
  local output = hsl.hsluv_to_hex(hslColor)
  return output
end
_2amodule_2a["brighten"] = brighten
local function hsluvBrighten(tuple, percent)
  local hslColor = tuple
  local luminance = (100 - hslColor[3])
  local inputLuminance = (hslColor[3] * (1 + percent))
  if (inputLuminance >= 100) then
    inputLuminance = 99.99
  else
  end
  hslColor[3] = inputLuminance
  local output = hsl.hsluv_to_hex(hslColor)
  return output
end
_2amodule_2a["hsluvBrighten"] = hsluvBrighten
local function darken(color, percent)
  local hslColor = hsl.hex_to_hsluv(color)
  local luminance = (100 - hslColor[3])
  local inputLuminance = (hslColor[3] * (1 - percent))
  if (inputLuminance >= 100) then
    inputLuminance = 99.99
  else
  end
  hslColor[3] = inputLuminance
  local output = hsl.hsluv_to_hex(hslColor)
  return output
end
_2amodule_2a["darken"] = darken
local function saturation(color, percent)
  local hslColor = hsl.hex_to_hsluv(color)
  local sat = hslColor[2]
  local inputSaturation = (hslColor[2] + (sat * percent))
  if (inputSaturation >= 100) then
    inputSaturation = 99.99
  elseif (inputSaturation <= 0) then
    inputSaturation = 0.01
  else
  end
  hslColor[2] = inputSaturation
  local output = hsl.hsluv_to_hex(hslColor)
  return output
end
_2amodule_2a["saturation"] = saturation