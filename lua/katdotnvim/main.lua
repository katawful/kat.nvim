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
local function init(style, contrast)
  errors.setDefaults(true)
  if vim.g.colors_name then
    vim.cmd("highlight clear")
  else
  end
  if (vim.fn.exists("syntax_on") == 1) then
    vim.cmd("syntax reset")
  else
  end
  vim.api.nvim_set_option("termguicolors", true)
  local katStyle = style
  _2amodule_2a["katStyle"] = katStyle
  local katContrast = contrast
  _2amodule_2a["katContrast"] = katContrast
  if (katStyle == "dark") then
    if (katContrast == "hard") then
      vim.g["colors_name"] = "kat.nvim"
    else
      vim.g["colors_name"] = "kat.nvim-owo"
    end
    vim.api.nvim_set_option("background", "dark")
  elseif (katStyle == "light") then
    if (katContrast == "hard") then
      vim.g["colors_name"] = "kat.lightenvim"
    else
      vim.g["colors_name"] = "kat.lightenvim-owo"
    end
    vim.api.nvim_set_option("background", "light")
  else
  end
  do local _ = require("katdotnvim.color") end
  do end (require("katdotnvim.highlights.main")).init()
  do end (require("katdotnvim.highlights.syntax")).init()
  do end (require("katdotnvim.highlights.terminal")).init()
  if (vim.g.kat_nvim_stupidFeatures == true) then
    do end (require("katdotnvim.stupid")).stupidFunction()
  else
  end
  for _0, v in ipairs(vim.g.kat_nvim_integrations) do
    local output = ("katdotnvim.highlights." .. v)
    do end (_2amodule_2a)["output"] = output
    require(output).init()
  end
  for _0, v in ipairs(vim.g.kat_nvim_filetype) do
    local output = ("katdotnvim.highlights.filetype." .. v)
    do end (_2amodule_2a)["output"] = output
    require(output).init()
  end
  return nil
end
_2amodule_2a["init"] = init