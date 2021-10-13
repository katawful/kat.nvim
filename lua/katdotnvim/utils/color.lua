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
local hsl = autoload("externals.hsluv")
do end (_2amodule_locals_2a)["hsl"] = hsl
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
  return print(output)
end
_2amodule_2a["blendColors"] = blendColors