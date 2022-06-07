local _2afile_2a = "fnl/katdotnvim/utils/highlight/utils.fnl"
local _2amodule_name_2a = "katdotnvim.utils.highlight.utils"
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
local a, colors, get, hsl, s, _ = autoload("aniseed.core"), autoload("katdotnvim.color"), autoload("katdotnvim.utils.highlight.get"), autoload("externals.hsluv"), autoload("aniseed.string"), nil
_2amodule_locals_2a["a"] = a
_2amodule_locals_2a["colors"] = colors
_2amodule_locals_2a["get"] = get
_2amodule_locals_2a["hsl"] = hsl
_2amodule_locals_2a["s"] = s
_2amodule_locals_2a["_"] = _
local function blend(source_color, mix_color, alpha)
  local source_color0 = hsl.hex_to_rgb(source_color)
  local mix_color0 = hsl.hex_to_rgb(mix_color)
  local return_color
  do
    local in_table_1_auto = {}
    for i = 1, 3 do
      local value_from_in_2_auto
      do
        local current_color = ((alpha * (source_color0)[i]) + ((1 - alpha) * (mix_color0)[i]))
        value_from_in_2_auto = current_color
      end
      in_table_1_auto[i] = value_from_in_2_auto
    end
    return_color = in_table_1_auto
  end
  local output = tostring(hsl.rgb_to_hex(return_color))
  return output
end
_2amodule_2a["blend"] = blend
local function brighten(color, percent)
  local hsl_color = hsl.hex_to_hsluv(color)
  local luminance = (100 - hsl_color[3])
  local input_luminance
  do
    local mid_luminance = (hsl_color[3] + (luminance * percent))
    if (mid_luminance >= 100) then
      input_luminance = 99.99
    else
      input_luminance = mid_luminance
    end
  end
  hsl_color[3] = input_luminance
  local output = hsl.hsluv_to_hex(hsl_color)
  return output
end
_2amodule_2a["brighten"] = brighten
local function hsluv_brighten(tuple, percent)
  local hsl_color = tuple
  local luminance = (100 - hsl_color[3])
  local input_luminance
  do
    local mid_luminance = (hsl_color[3] * (1 + percent))
    if (mid_luminance >= 100) then
      input_luminance = 99.99
    else
      input_luminance = mid_luminance
    end
  end
  hsl_color[3] = input_luminance
  local output = hsl.hsluv_to_hex(hsl_color)
  return output
end
_2amodule_2a["hsluv-brighten"] = hsluv_brighten
local function darken(color, percent)
  local hsl_color = hsl.hex_to_hsluv(color)
  local luminance = (100 - hsl_color[3])
  local input_luminance
  do
    local mid_luminance = (hsl_color[3] * (1 - percent))
    if (mid_luminance >= 100) then
      input_luminance = 99.99
    else
      input_luminance = mid_luminance
    end
  end
  hsl_color[3] = input_luminance
  local output = hsl.hsluv_to_hex(hsl_color)
  return output
end
_2amodule_2a["darken"] = darken
local function saturation(color, percent)
  local hsl_color = hsl.hex_to_hsluv(color)
  local saturation0 = hsl_color[2]
  local input_saturation
  do
    local mid_saturation = (hsl_color[2] + (saturation0 * percent))
    if (mid_saturation >= 100) then
      input_saturation = 99.99
    elseif (mid_saturation <= 0) then
      input_saturation = 0.01
    else
      input_saturation = mid_saturation
    end
  end
  hsl_color[2] = input_saturation
  local output = hsl.hsluv_to_hex(hsl_color)
  return output
end
_2amodule_2a["saturation"] = saturation
return _2amodule_2a