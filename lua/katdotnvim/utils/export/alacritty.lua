local _2afile_2a = "fnl/katdotnvim/utils/export/alacritty.fnl"
local _2amodule_name_2a = "katdotnvim.utils.export.alacritty"
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
local a, colors, errors, exports, groups, hsl, main, ucolors, _ = autoload("katdotnvim.aniseed.core"), autoload("katdotnvim.color"), autoload("katdotnvim.utils.errors"), autoload("katdotnvim.utils.export.init"), autoload("katdotnvim.highlights.main"), autoload("externals.hsluv"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.color"), nil
_2amodule_locals_2a["a"] = a
_2amodule_locals_2a["colors"] = colors
_2amodule_locals_2a["errors"] = errors
_2amodule_locals_2a["exports"] = exports
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["hsl"] = hsl
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["ucolors"] = ucolors
_2amodule_locals_2a["_"] = _
local loop = vim.loop
_2amodule_locals_2a["loop"] = loop
local comment_type = "#"
_2amodule_2a["comment-type"] = comment_type
local function gen_colors()
  if ((vim.g.colors_name ~= "kat.nvim") and (vim.g.colors_name ~= "kat.nwim")) then
    return errors.errMessage(1, "Not a kat.nvim colorscheme, theme won't compile")
  else
    local white
    if (vim.o.background == "light") then
      white = ("'" .. colors.background()[1] .. "'")
    else
      white = ("'" .. colors.foreground()[1] .. "'")
    end
    local black
    if (vim.o.background == "light") then
      black = ("'" .. colors.foreground()[1] .. "'")
    else
      black = ("'" .. colors.background()[1] .. "'")
    end
    local cyan = ("'" .. ucolors.brighten(groups.selectionBG()[1], 0.3) .. "'")
    if ((vim.g.colors_name ~= "kat.nvim") and (vim.g.colors_name ~= "kat.nwim")) then
      return errors.errMessage(1, "Not a kat.nvim colorscheme, theme won't compile")
    else
      local output
      local _3_
      if (vim.o.background == "light") then
        do local _ = {} end
        do local _ = ("'" .. groups.umbraFG()[1] .. "'") end
        do local _ = ("'" .. ucolors.darken((colors["normal-colors"]()).red, 0.2) .. "'") end
        do local _ = ("'" .. ucolors.darken((colors["normal-colors"]()).green, 0.2) .. "'") end
        do local _ = ("'" .. ucolors.darken((colors["normal-colors"]()).orange, 0.2) .. "'") end
        do local _ = ("'" .. ucolors.darken((colors["normal-colors"]()).blue, 0.2) .. "'") end
        do local _ = ("'" .. ucolors.darken((colors["normal-colors"]()).pink, 0.2) .. "'") end
        do local _ = ("'" .. ucolors.darken((colors["normal-colors"]()).purple, 0.2) .. "'") end
        _3_ = ("'" .. groups.umbraBG()[1] .. "'")
      else
        _3_ = {["  black:"] = ("'" .. groups.umbraBG()[1] .. "'"), ["  red:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).red, 0.2) .. "'"), ["  green:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).green, 0.2) .. "'"), ["  yellow:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).orange, 0.2) .. "'"), ["  blue:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).blue, 0.2) .. "'"), ["  magenta:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).pink, 0.2) .. "'"), ["  cyan:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).purple, 0.2) .. "'"), ["  white:"] = ("'" .. groups.umbraFG()[1] .. "'")}
      end
      local _5_
      if (vim.o.background == "dark") then
        _5_ = {["  black:"] = ("'" .. groups.meldFG()[1] .. "'"), ["  red:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).red, 0.2) .. "'"), ["  green:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).green, 0.2) .. "'"), ["  yellow:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).orange, 0.2) .. "'"), ["  blue:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).blue, 0.2) .. "'"), ["  magenta:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).pink, 0.2) .. "'"), ["  cyan:"] = ("'" .. ucolors.darken((colors["normal-colors"]()).purple, 0.2) .. "'"), ["  white:"] = ("'" .. groups.meldBG()[1] .. "'")}
      else
        _5_ = {["  black:"] = ("'" .. groups.meldBG()[1] .. "'"), ["  red:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).red, 0.2) .. "'"), ["  green:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).green, 0.2) .. "'"), ["  yellow:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).orange, 0.2) .. "'"), ["  blue:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).blue, 0.2) .. "'"), ["  magenta:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).pink, 0.2) .. "'"), ["  cyan:"] = ("'" .. ucolors.brighten((colors["normal-colors"]()).purple, 0.2) .. "'"), ["  white:"] = ("'" .. ("'" .. groups.meldFG()[1] .. "'"))}
      end
      output = {["colors:"] = {[" primary:"] = {["  background:"] = ("'" .. groups.mainBG()[1] .. "'"), ["  foreground:"] = ("'" .. groups.mainFG()[1] .. "'"), ["  dim_foreground:"] = ("'" .. groups.umbraFG()[1] .. "'"), ["  bright_foreground:"] = ("'" .. groups.meldFG()[1] .. "'"), ["  dim_background:"] = ("'" .. groups.umbraBG()[1] .. "'"), ["  bright_background:"] = ("'" .. groups.meldBG()[1] .. "'")}, [" cursor:"] = {["  text:"] = ("'" .. groups.mainBG()[1] .. "'"), ["  cursor:"] = ("'" .. groups.mainFG()[1] .. "'")}, [" normal:"] = {["  black:"] = black, ["  red:"] = ("'" .. (colors["normal-colors"]()).red .. "'"), ["  blue:"] = ("'" .. (colors["normal-colors"]()).blue .. "'"), ["  green:"] = ("'" .. (colors["normal-colors"]()).green .. "'"), ["  yellow:"] = ("'" .. (colors["normal-colors"]()).orange .. "'"), ["  cyan:"] = ("'" .. (colors["normal-colors"]()).purple .. "'"), ["  magenta:"] = ("'" .. (colors["normal-colors"]()).pink .. "'"), ["  white:"] = white}, [" bright:"] = _3_, [" dim:"] = _5_, [" selection:"] = {["  text:"] = "CellBackground", ["  background:"] = ("'" .. groups.selectionBG()[1] .. "'")}}}
      return output
    end
  end
end
_2amodule_2a["gen-colors"] = gen_colors
local function output()
  local openMode = (loop.constants.O_CREAT + loop.constants.O_WRONLY + loop.constants.O_TRUNC)
  local fileName = string.format("alacritty-%s-%s.yml", tostring(vim.g.colors_name), tostring(vim.o.background))
  local fd = assert(loop.fs_open(fileName, "w", 0))
  assert(loop.fs_chmod(fileName, 420))
  assert(loop.fs_write(fd, exports.generateString(gen_colors(), "alacritty"), 0))
  exports.userExportNotify("alacritty")
  return assert(loop.fs_close(fd))
end
_2amodule_2a["output"] = output
return _2amodule_2a