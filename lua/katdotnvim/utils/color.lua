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
  do end (_2amodule_2a)["output"] = output
  return output
end
_2amodule_2a["blendColors"] = blendColors
local function highlight(gr, fg, bg, ...)
  local group = tostring(gr)
  do end (_2amodule_2a)["group"] = group
  local fore = (" guifg=" .. fg)
  do end (_2amodule_2a)["fore"] = fore
  local back = (" guibg=" .. bg)
  do end (_2amodule_2a)["back"] = back
  local extra = ""
  local args = {...}
  _2amodule_2a["args"] = args
  if (#args > 0) then
    for k, v in pairs(args) do
      if (string.sub(v, 1, 1) == "#") then
        extra = (extra .. " guisp=" .. v)
      elseif (a["string?"](v) == false) then
        extra = (extra .. " gui=" .. tostring(v))
      else
        extra = (extra .. " blend" .. v)
      end
    end
  else
  end
  local output = ("highlight " .. group .. fore .. back .. extra)
  do end (_2amodule_2a)["output"] = output
  return vim.cmd(tostring(output))
end
_2amodule_2a["highlight"] = highlight