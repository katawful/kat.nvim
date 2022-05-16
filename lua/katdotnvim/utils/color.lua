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
local autoload = (require("aniseed.autoload")).autoload
local a, colors, get, hsl, s, _ = autoload("aniseed.core"), autoload("katdotnvim.color"), autoload("katdotnvim.utils.highlight.init"), autoload("externals.hsluv"), autoload("aniseed.string"), nil
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
local function highlight_24_3c_vimscript(opts)
  local group = opts.group
  local gui_fore
  if ((get["gui-fg"](opts) ~= nil) and (opts.fg ~= "SKIP")) then
    gui_fore = string.format(" guifg=%s", opts.fg)
  else
    gui_fore = ""
  end
  local gui_back
  if ((get["gui-bg"](opts) ~= nil) and (opts.bg ~= "SKIP")) then
    gui_back = string.format(" guibg=%s", opts.bg)
  else
    gui_back = ""
  end
  local c_fore
  if ((get["term-fg"](opts) ~= nil) and (opts.ctermfg ~= "SKIP")) then
    c_fore = string.format(" ctermfg=%s", opts.ctermfg)
  else
    c_fore = ""
  end
  local c_back
  if ((get["term-bg"](opts) ~= nil) and (opts.ctermbg ~= "SKIP")) then
    c_back = string.format(" ctermbg=%s", opts.ctermbg)
  else
    c_back = ""
  end
  local special
  if (get.special(opts) ~= nil) then
    special = string.format(" guisp=%s", get.special(opts))
  else
    special = ""
  end
  local blend0
  if (get.blend(opts) ~= nil) then
    blend0 = string.format(" blend=%s", get.blend(opts))
  else
    blend0 = ""
  end
  local attr
  do
    local attr_string = get["attr->string"](opts)
    if (attr_string ~= nil) then
      attr = string.format(" gui=%s cterm=%s", attr_string, attr_string)
    else
      attr = ""
    end
  end
  local highlight = ("highlight " .. group .. gui_fore .. gui_back .. c_fore .. c_back .. attr .. special .. blend0)
  return vim.cmd(tostring(highlight))
end
_2amodule_2a["highlight$<-vimscript"] = highlight_24_3c_vimscript
local function highlight_24_3c_api(opts)
  local group = opts.group
  local gui_fore
  if ((get["gui-fg"](opts) ~= nil) and (opts.fg ~= "NONE") and (opts.fg ~= "SKIP")) then
    gui_fore = opts.fg
  else
    gui_fore = nil
  end
  local gui_back
  if ((get["gui-bg"](opts) ~= nil) and (opts.bg ~= "NONE") and (opts.bg ~= "SKIP")) then
    gui_back = opts.bg
  else
    gui_back = nil
  end
  local c_fore
  if ((get["term-fg"](opts) ~= nil) and (opts.ctermfg ~= "NONE") and (opts.ctermfg ~= "SKIP")) then
    c_fore = opts.ctermfg
  else
    c_fore = nil
  end
  local c_back
  if ((get["term-bg"](opts) ~= nil) and (opts.ctermbg ~= "NONE") and (opts.ctermbg ~= "SKIP")) then
    c_back = opts.ctermbg
  else
    c_back = nil
  end
  local args = {fg = gui_fore, bg = gui_back, ctermfg = c_fore, ctermbg = c_back, special = get.special(opts), blend = get.blend(opts)}
  for k, v in pairs(get["all-attr->table"](opts)) do
    args[k] = v
  end
  return vim.api.nvim_set_hl(0, group, args)
end
_2amodule_2a["highlight$<-api"] = highlight_24_3c_api
local function highlight_24(opts)
  if (vim.fn.has("nvim-0.7") == 0) then
    return highlight_24_3c_api(opts)
  else
    return highlight_24_3c_vimscript(opts)
  end
end
_2amodule_2a["highlight$"] = highlight_24
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