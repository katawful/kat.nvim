local _2afile_2a = "fnl/katdotnvim/stupid.fnl"
local _2amodule_name_2a = "katdotnvim.stupid"
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
local a, apply, colors, syntax, ucolors = autoload("katdotnvim.aniseed.core"), autoload("katdotnvim.utils.highlight.init"), autoload("katdotnvim.color"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["apply"] = apply
_2amodule_locals_2a["colors"] = colors
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local function stupidFunction()
  local timer = vim.loop.new_timer()
  do end (_2amodule_2a)["timer"] = timer
  local i = 0
  local increase = true
  local function _1_()
    local opts = {group = "Function", bg = "SKIP", fg = ucolors.saturation(ucolors.brighten(ucolors.blend(colors.kat.teal.base.color, colors.kat.red.base.color, (i * 0.1)), 0.1), 0.5), bold = true}
    apply["highlight$"](opts)
    if (increase == true) then
      i = (i + 1)
    else
      i = (i - 1)
    end
    if (i == 9) then
      increase = false
    else
    end
    if (i == 0) then
      increase = true
      return nil
    else
      return nil
    end
  end
  return timer:start(1, 75, vim.schedule_wrap(_1_))
end
_2amodule_2a["stupidFunction"] = stupidFunction
return _2amodule_2a