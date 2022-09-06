local _2afile_2a = "fnl/katdotnvim/utils/export/init.fnl"
local _2amodule_name_2a = "katdotnvim.utils.export.init"
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
local a, alacritty, hsl, kitty, konsole, main, message, rxvt, s, _ = autoload("katdotnvim.aniseed.core"), autoload("katdotnvim.utils.export.alacritty"), autoload("externals.hsluv"), autoload("katdotnvim.utils.export.kitty"), autoload("katdotnvim.utils.export.konsole"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.message.init"), autoload("katdotnvim.utils.export.rxvt"), autoload("katdotnvim.aniseed.string"), nil
_2amodule_locals_2a["a"] = a
_2amodule_locals_2a["alacritty"] = alacritty
_2amodule_locals_2a["hsl"] = hsl
_2amodule_locals_2a["kitty"] = kitty
_2amodule_locals_2a["konsole"] = konsole
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["message"] = message
_2amodule_locals_2a["rxvt"] = rxvt
_2amodule_locals_2a["s"] = s
_2amodule_locals_2a["_"] = _
local comment_type = {}
_2amodule_locals_2a["comment-type"] = comment_type
local file_header = "%s %s terminal theme generated by kat.nvim\n%s Generated using %s colorscheme with background set to %s\n\n"
_2amodule_locals_2a["file-header"] = file_header
local function rgb__3estring(rgb)
  local string = string.format("%s,%s,%s", math.floor((rgb[1] * 255)), math.floor((rgb[2] * 255)), math.floor((rgb[3] * 255)))
  return string
end
_2amodule_2a["rgb->string"] = rgb__3estring
local function hex__3ergb_string(hex)
  local string = rgb__3estring(hsl.hex_to_rgb(hex))
  return string
end
_2amodule_2a["hex->rgb-string"] = hex__3ergb_string
local function color_nest__3eone_line_color_25(key, value, input_color)
  local color_string = input_color
  do
    local _1_ = type(value)
    if (_1_ == "table") then
      for sub_key, sub_val in pairs(value) do
        local _2_ = type(sub_val)
        if (_2_ == "table") then
          color_string = string.format("%s%s\n", color_string, sub_key)
          color_string = color_nest__3eone_line_color_25(sub_key, sub_val, color_string)
        elseif (_2_ == "string") then
          color_string = string.format("%s%s %s\n", color_string, sub_key, sub_val)
        else
        end
      end
    else
    end
  end
  return color_string
end
_2amodule_2a["color-nest->one-line-color%"] = color_nest__3eone_line_color_25
local function table__3eone_line_color(colors, terminal)
  local color_string = string.format(file_header, comment_type[1], terminal, comment_type[1], tostring(vim.g.colors_name), tostring((main["background-mut"])[1]))
  for key, value in pairs(colors) do
    color_string = string.format("%s%s\n", color_string, key)
    color_string = color_nest__3eone_line_color_25(key, value, color_string)
  end
  return color_string
end
_2amodule_2a["table->one-line-color"] = table__3eone_line_color
local function string__3etwo_line_color_2a(colors, terminal)
  local color_string
  local function _5_()
    local tbl = {}
    for key, val in pairs(colors) do
      table.insert(tbl, string.format("%s\n%s\n", key, val))
    end
    return tbl
  end
  color_string = s.join(_5_())
  return color_string
end
_2amodule_2a["string->two-line-color*"] = string__3etwo_line_color_2a
local function string__3eone_line_color(colors, terminal)
  local color_string
  local function _6_()
    local tbl = {}
    table.insert(tbl, string.format(file_header, comment_type[1], terminal, comment_type[1], tostring(vim.g.colors_name), tostring((main["background-mut"])[1])))
    for key, val in pairs(colors) do
      table.insert(tbl, string.format("%s %s\n", key, val))
    end
    return tbl
  end
  color_string = s.join(_6_())
  return color_string
end
_2amodule_2a["string->one-line-color"] = string__3eone_line_color
local function notify_24(terminal)
  return message["info$"](string.format(message["<-table"]("utils.export.init", "term-theme-generated"), terminal, vim.g.colors_name, (main["background-mut"])[1]))
end
_2amodule_2a["notify$"] = notify_24
local function is_colorscheme_3f()
  if ((vim.g.colors_name ~= "kat.nvim") and (vim.g.colors_name ~= "kat.nwim")) then
    message["error$"](message["<-table"]("utils.export.init", "not-colorscheme"))
    return false
  else
    return true
  end
end
_2amodule_2a["is-colorscheme?"] = is_colorscheme_3f
local function gen_term_colors(terminal)
  if (is_colorscheme_3f() == true) then
    local _8_ = tostring(terminal)
    if (_8_ == "kitty") then
      comment_type[1] = kitty["comment-type"]
      return kitty["output!"]()
    elseif (_8_ == "alacritty") then
      comment_type[1] = alacritty["comment-type"]
      return alacritty["output!"]()
    elseif (_8_ == "rxvt-unicode") then
      comment_type[1] = rxvt["comment-type"]
      return rxvt["output!"]()
    elseif (_8_ == "urxvt") then
      comment_type[1] = rxvt["comment-type"]
      return rxvt["output!"]()
    elseif (_8_ == "konsole") then
      return konsole["output!"]()
    elseif true then
      local _0 = _8_
      return message["error$"](string.format(message["<-table"]("utils.export.init", "invalid-arg"), terminal))
    else
      return nil
    end
  else
    return nil
  end
end
_2amodule_2a["gen_term_colors"] = gen_term_colors
local _11_
do
  local result_2_auto = vim.fn.has("nvim-0.7")
  if (result_2_auto == 0) then
    _11_ = false
  else
    _11_ = true
  end
end
if _11_ then
  local function _14_(args)
    return gen_term_colors(args.args)
  end
  vim.api.nvim_create_user_command("KatGenTermTheme", _14_, {nargs = 1})
else
  vim.api.nvim_command("command! -nargs=1 KatGenTermTheme lua require('katdotnvim.utils.export.init').gen_term_colors(<args>)")
end
return _2amodule_2a