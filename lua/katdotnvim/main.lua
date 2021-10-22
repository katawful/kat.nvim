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
local colors, errors, ucolors, _ = autoload("katdotnvim.color"), autoload("katdotnvim.utils.errors"), autoload("katdotnvim.utils.color"), nil
_2amodule_locals_2a["colors"] = colors
_2amodule_locals_2a["errors"] = errors
_2amodule_locals_2a["ucolors"] = ucolors
_2amodule_locals_2a["_"] = _
errors.setDefaults(true)
local function init()
  vim.cmd("highlight clear")
  if (vim.fn.exists("syntax_on") == true) then
    vim.cmd("syntax reset")
  else
  end
  vim.api.nvim_set_option("termguicolors", true)
  do end (vim.g)["colors_name"] = "kat.nvim"
  if (vim.g.kat_nvim_style == "dark") then
    vim.api.nvim_set_option("background", "dark")
  elseif (vim.g.kat_nvim_style == "light") then
    vim.api.nvim_set_option("background", "light")
  else
    errors.errMessage(1, (vim.g.kat_nvim_style .. " is not a valid setting, defaulting to 'dark'"))
    errors.setDefaults(false)
    vim.api.nvim_set_option("background", "dark")
  end
  do end (require("katdotnvim.highlights.main")).init()
  do end (require("katdotnvim.highlights.syntax")).init()
  do end (require("katdotnvim.highlights.treesitter")).init()
  do end (require("katdotnvim.highlights.terminal")).init()
  if (vim.g.kat_nvim_stupidFeatures == true) then
    do end (require("katdotnvim.stupid")).stupidFunction()
  else
  end
  return (require("katdotnvim.highlights.lsp")).init()
end
_2amodule_2a["init"] = init