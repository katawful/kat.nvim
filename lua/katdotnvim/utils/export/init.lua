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
local a, alacritty, colors, groups, hsl, kitty, main, rxvt, ucolors, _ = autoload("katdotnvim.aniseed.core"), autoload("katdotnvim.utils.export.alacritty"), autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("externals.hsluv"), autoload("katdotnvim.utils.export.kitty"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.export.rxvt"), autoload("katdotnvim.utils.color"), nil
_2amodule_locals_2a["a"] = a
_2amodule_locals_2a["alacritty"] = alacritty
_2amodule_locals_2a["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["hsl"] = hsl
_2amodule_locals_2a["kitty"] = kitty
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["rxvt"] = rxvt
_2amodule_locals_2a["ucolors"] = ucolors
_2amodule_locals_2a["_"] = _
local comment_type = {}
_2amodule_locals_2a["comment-type"] = comment_type
local color_string = ""
local function iterate_nested_colors(key, value)
  local _1_ = type(value)
  if (_1_ == "string") then
    color_string = string.format("%s%s %s\n", color_string, key, value)
    return nil
  elseif (_1_ == "table") then
    for sub_key, sub_val in pairs(value) do
      if (type(sub_val) == "table") then
        color_string = string.format("%s%s\n", color_string, sub_key)
        iterate_nested_colors(sub_key, sub_val)
      else
        color_string = string.format("%s%s %s\n", color_string, sub_key, sub_val)
      end
    end
    return nil
  else
    return nil
  end
end
_2amodule_locals_2a["iterate-nested-colors"] = iterate_nested_colors
local function generateString(colors0, terminal)
  color_string = ""
  color_string = string.format("%s %s terminal theme generated by kat.nvim\n%s Generated using %s colorscheme with background set to %s\n\n", comment_type[1], terminal, comment_type[1], tostring(vim.g.colors_name), tostring(vim.o.background))
  for key, value in pairs(colors0) do
    if (type(value) == "table") then
      color_string = string.format("%s%s\n", color_string, key)
      iterate_nested_colors(key, value)
    else
      color_string = string.format("%s%s %s\n", color_string, key, value)
    end
  end
  return color_string
end
_2amodule_2a["generateString"] = generateString
local function userExportNotify(terminal)
  return vim.notify(string.format("kat.nvim: %s color file generated at cwd using %s colorscheme with %s background", terminal, tostring(vim.g.colors_name), tostring(vim.o.background)), vim.log.levels.INFO)
end
_2amodule_2a["userExportNotify"] = userExportNotify
local function generateTerminalColors(terminal)
  local _5_ = tostring(terminal)
  if (_5_ == "kitty") then
    comment_type[1] = kitty["comment-type"]
    return kitty.generateKittyTheme()
  elseif (_5_ == "alacritty") then
    comment_type[1] = alacritty["comment-type"]
    return alacritty.output()
  elseif (_5_ == "rxvt-unicode") then
    comment_type[1] = rxvt["comment-type"]
    return rxvt.output()
  elseif (_5_ == "urxvt") then
    comment_type[1] = rxvt["comment-type"]
    return rxvt.output()
  else
    return nil
  end
end
_2amodule_2a["generateTerminalColors"] = generateTerminalColors
do
  vim.api.nvim_command("command! -nargs=1 KatGenTermTheme lua require('katdotnvim.utils.export.init').generateTerminalColors(<args>)")
end
return _2amodule_2a