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
local autoload = (require("aniseed.autoload")).autoload
local options, _ = autoload("katdotnvim.utils.options.init"), nil
_2amodule_locals_2a["options"] = options
_2amodule_locals_2a["_"] = _
local function init(in_contrast)
  options.default()
  if vim.g.colors_name then
    vim.cmd("highlight clear")
  else
  end
  if (vim.fn.exists("syntax_on") == 1) then
    vim.cmd("syntax reset")
  else
  end
  local contrast = in_contrast
  _2amodule_2a["contrast"] = contrast
  local background = vim.o.background
  _2amodule_2a["background"] = background
  if (contrast == "hard") then
    vim.g["colors_name"] = "kat.nvim"
  else
    vim.g["colors_name"] = "kat.nwim"
  end
  if (vim.g.kat_nvim_dontRender == true) then
    do end (require("katdotnvim.highlights.main")).init()
    do end (require("katdotnvim.highlights.syntax")).init()
    do end (require("katdotnvim.highlights.terminal")).init()
    if (vim.g.kat_nvim_stupidFeatures == true) then
      do end (require("katdotnvim.stupid")).stupidFunction()
    else
    end
    require("katdotnvim.utils.export.init")
    do end (require("katdotnvim.utils.export.render")).init()
    for _0, v in ipairs(vim.g.kat_nvim_integrations) do
      local output = ("katdotnvim.highlights.integrations." .. v)
      require(output).init()
    end
    for _0, v in pairs(vim.g.kat_nvim_filetype) do
      local output = ("katdotnvim.highlights.filetype." .. v)
      require(output).init()
    end
    return nil
  else
    do end (require(("katdotnvim.exported.main-" .. background .. "-" .. contrast))).init()
    do end (require(("katdotnvim.exported.syntax-" .. background .. "-" .. contrast))).init()
    do end (require("katdotnvim.highlights.terminal")).init()
    if (vim.g.kat_nvim_stupidFeatures == true) then
      do end (require("katdotnvim.stupid")).stupidFunction()
    else
    end
    require("katdotnvim.utils.export.init")
    do end (require("katdotnvim.utils.export.render")).init()
    for _0, v in ipairs(vim.g.kat_nvim_integrations) do
      local output = ("katdotnvim.exported.integrations." .. v .. "-" .. background .. "-" .. contrast)
      require(output).init()
    end
    for _0, v in pairs(vim.g.kat_nvim_filetype) do
      local output = ("katdotnvim.exported.filetype." .. v .. "-" .. background .. "-" .. contrast)
      require(output).init()
    end
    return nil
  end
end
_2amodule_2a["init"] = init
return _2amodule_2a