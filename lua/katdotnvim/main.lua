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
local color, json, message, options, override, read, run, _, _0 = autoload("katdotnvim.color"), autoload("katdotnvim.utils.json.init"), autoload("katdotnvim.utils.message.init"), autoload("katdotnvim.utils.options.init"), autoload("katdotnvim.utils.override.init"), autoload("katdotnvim.utils.json.read"), autoload("katdotnvim.utils.highlight.run"), nil, nil
_2amodule_locals_2a["color"] = color
_2amodule_locals_2a["json"] = json
_2amodule_locals_2a["message"] = message
_2amodule_locals_2a["options"] = options
_2amodule_locals_2a["override"] = override
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
    vim.api.nvim_exec("highlight  clear", true)
  else
  end
  local _6_
  do
    local result_2_auto = vim.fn.exists("syntax_on")
    if (result_2_auto == 0) then
      _6_ = false
    else
      _6_ = true
    end
  end
  if _6_ then
    vim.api.nvim_exec("syntax  reset", true)
  else
  end
  local contrast = in_contrast
  _2amodule_2a["contrast"] = contrast
  local background = vim.o.background
  _2amodule_2a["background"] = background
  local contrast_mut = {__fnl_global__in_2dconstrast}
  _2amodule_2a["contrast-mut"] = contrast_mut
  local background_mut = {vim.o.background}
  _2amodule_2a["background-mut"] = background_mut
  color.update()
  if (contrast == "hard") then
    vim.g["colors_name"] = "kat.nvim"
  else
    vim.g["colors_name"] = "kat.nwim"
  end
  local has_render = override["main-files"]()
  local matcher = string.format("%s-%s.json", vim.g.colors_name, background)
  local integrations
  do
    local output = {}
    for _1, v in pairs(vim.g.kat_nvim_integrations) do
      output[("integrations." .. v)] = true
    end
    for _1, v in pairs(vim.g.kat_nvim_filetype) do
      output[("filetype." .. v)] = true
    end
    integrations = output
  end
  if has_render then
    run["highlight$<-table"](read["file!"]("main"))
    run["highlight$<-table"](read["file!"]("syntax"))
    for file, _1 in pairs(has_render) do
      if string.find(file, matcher, 1, true) then
        for key, _2 in pairs(integrations) do
          if string.find(file, key, 1, true) then
            run["highlight$<-table"](read["full-file!"](file))
          else
          end
        end
      else
      end
    end
    do end (require("katdotnvim.highlights.terminal")).init()
    if (vim.g.kat_nvim_stupidFeatures == true) then
      do end (require("katdotnvim.stupid")).stupidFunction()
    else
    end
    require("katdotnvim.utils.export.init")
    local has_overrides = override.files()
    if has_overrides then
      for file, _1 in pairs(has_overrides) do
        if string.find(file, matcher, 1, true) then
          run["highlight$<-table"](read["full-file!"](file))
        else
        end
      end
      return nil
    else
      return nil
    end
  else
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
    local has_overrides = override.files()
    if has_overrides then
      for file, _1 in pairs(has_overrides) do
        if string.find(file, matcher, 1, true) then
          run["highlight$<-table"](read["full-file!"](file))
        else
        end
      end
      return nil
    else
      return nil
    end
  end
end
_2amodule_2a["init"] = init
return _2amodule_2a