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
local a, colors, hsl, _, _0 = autoload("katdotnvim.aniseed.core"), autoload("katdotnvim.color"), autoload("externals.hsluv"), nil, nil
_2amodule_locals_2a["a"] = a
_2amodule_locals_2a["colors"] = colors
_2amodule_locals_2a["hsl"] = hsl
_2amodule_locals_2a["_"] = _0
_2amodule_locals_2a["_"] = _0
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
local function highlight_24(gr, guifg, guibg, cfg, cbg, ...)
  local group = tostring(gr)
  local gui_fore
  if (guifg ~= "SKIP") then
    gui_fore = string.format(" guifg=%s", guifg)
  else
    gui_fore = " "
  end
  local gui_back
  if (guibg ~= "SKIP") then
    gui_back = string.format(" guibg=%s", guibg)
  else
    gui_back = " "
  end
  local c_fore
  if (cfg ~= "SKIP") then
    c_fore = string.format(" ctermfg=%s", cfg)
  else
    c_fore = " "
  end
  local c_back
  if (cbg ~= "SKIP") then
    c_back = string.format(" ctermbg=%s", cbg)
  else
    c_back = " "
  end
  local args = {...}
  local extra
  if (#args > 0) then
    local string = ""
    for _1, v in pairs(args) do
      if (string.sub(v, 1, 1) == "#") then
        string = string.format("% s guisp=%s", string, v)
      elseif (a["string?"](v) == true) then
        string = string.format("%s gui=%s cterm=%s", string, tostring(v), tostring(v))
      else
        string = string.format("%s blend=%s", string, v)
      end
    end
    extra = string
  else
    extra = ""
  end
  local output = ("highlight " .. group .. gui_fore .. gui_back .. c_fore .. c_back .. extra)
  vim.cmd(tostring(output))
  return output
end
_2amodule_2a["highlight$"] = highlight_24
local function highlight_gui_24(gr, guifg, guibg, ...)
  local group = tostring(gr)
  local gui_fore
  if (guifg ~= "SKIP") then
    gui_fore = string.format(" guifg=%s", guifg)
  else
    gui_fore = " "
  end
  local gui_back
  if (guibg ~= "SKIP") then
    gui_back = string.format(" guibg=%s", guibg)
  else
    gui_back = " "
  end
  local args = {...}
  local extra = ""
  if (#args > 0) then
    for k, v in pairs(args) do
      if (string.sub(v, 1, 1) == "#") then
        extra = string.format("%s guisp=%s", extra, v)
      elseif (a["string?"](v) == true) then
        extra = string.format("%s gui=%s", extra, tostring(v))
      else
        extra = string.format("%s blend=%s", extra, v)
      end
    end
  else
  end
  local output = ("highlight " .. group .. gui_fore .. gui_back .. __fnl_global__c_2dfore .. __fnl_global__c_2dback .. extra)
  vim.cmd(tostring(output))
  return output
end
_2amodule_2a["highlight-gui$"] = highlight_gui_24
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