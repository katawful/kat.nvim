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
local message, options, read, run, _, _0 = autoload("katdotnvim.utils.message.init"), autoload("katdotnvim.utils.options.init"), autoload("katdotnvim.utils.json.read"), autoload("katdotnvim.utils.highlight.run"), nil, nil
_2amodule_locals_2a["message"] = message
_2amodule_locals_2a["options"] = options
_2amodule_locals_2a["read"] = read
_2amodule_locals_2a["run"] = run
_2amodule_locals_2a["_"] = _0
_2amodule_locals_2a["_"] = _0
local function init(in_contrast)
  options.default()
  local _1_
  do
    local result_2_auto = vim.fn.has("nvim-0.7")
    if (result_2_auto == 0) then
      _1_ = false
    else
      _1_ = true
    end
  end
  if not _1_ then
    local function mess()
      return message["warn$"](message["<-table"]("utils.highlight.init", "0.6-deprecation"))
    end
    vim.defer_fn(mess, 1000)
  else
  end
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
    for _1, v in ipairs(vim.g.kat_nvim_integrations) do
      local output = ("katdotnvim.highlights.integrations." .. v)
      require(output).init()
    end
    for _1, v in pairs(vim.g.kat_nvim_filetype) do
      local output = ("katdotnvim.highlights.filetype." .. v)
      require(output).init()
    end
    return nil
  else
    run["highlight$<-table"](read["file!"]("main"))
    run["highlight$<-table"](read["file!"]("syntax"))
    do end (require("katdotnvim.highlights.terminal")).init()
    if (vim.g.kat_nvim_stupidFeatures == true) then
      do end (require("katdotnvim.stupid")).stupidFunction()
    else
    end
    require("katdotnvim.utils.export.init")
    do end (require("katdotnvim.utils.export.render")).init()
    for _1, v in ipairs(vim.g.kat_nvim_integrations) do
      run["highlight$<-table"](read["file!"](("integrations." .. v)))
    end
    for _1, v in pairs(vim.g.kat_nvim_filetype) do
      run["highlight$<-table"](read["file!"](("filetype." .. v)))
    end
    return nil
  end
end
_2amodule_2a["init"] = init
return _2amodule_2a