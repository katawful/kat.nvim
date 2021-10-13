local _2afile_2a = "fnl/katdotnvim/main.fnl"
local _2amodule_name_2a = "katdotnvim.main"
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
local colors, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["ucolors"] = ucolors
if (vim.fn.exists("g:kat_nvim_settings") ~= 1) then
  vim.g.kat_nvim_settings = {style = "dark"}
else
end
local function init()
  vim.cmd("highlight clear")
  if (vim.fn.exists("syntax_on") == true) then
    vim.cmd("syntax reset")
  else
  end
  return ucolors.blendColors(colors.normalColors.red, colors.background[1], 0.5)
end
_2amodule_2a["init"] = init