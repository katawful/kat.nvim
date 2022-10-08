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
  if vim.g.colors_name then
    vim.api.nvim_exec("highlight  clear", true)
  else
  end
  local _2_
  do
    local result_2_auto = vim.fn.exists("syntax_on")
    if (result_2_auto == 0) then
      _2_ = false
    else
      _2_ = true
    end
  end
  if _2_ then
    vim.api.nvim_exec("syntax  reset", true)
  else
  end
  local contrast = in_contrast
  _2amodule_2a["contrast"] = contrast
  local background = vim.o.background
  _2amodule_2a["background"] = background
  local contrast_mut = {in_contrast}
  _2amodule_2a["contrast-mut"] = contrast_mut
  local background_mut = {vim.o.background}
  _2amodule_2a["background-mut"] = background_mut
  if (contrast_mut[1] == "hard") then
    vim.g["colors_name"] = "kat.nvim"
  else
    vim.g["colors_name"] = "kat.nwim"
  end
  local colors_name_mut = {vim.g.colors_name}
  _2amodule_2a["colors-name-mut"] = colors_name_mut
  color.update()
  local rendered_length
  do
    local i = 0
    for k, _1 in pairs(override["main-files"](), "until", (i > 0)) do
      i = (i + 1)
    end
    rendered_length = i
  end
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
  if json["exists?"]("main") then
    run["highlight$<-table"](read["file!"]("main"))
  else
    do end (require("katdotnvim.highlights.main")).init()
  end
  if json["exists?"]("syntax") then
    run["highlight$<-table"](read["file!"]("syntax"))
  else
    do end (require("katdotnvim.highlights.syntax")).init()
  end
  if (rendered_length > 0) then
    for key, _1 in pairs(integrations) do
      if json["exists?"](key) then
        run["highlight$<-table"](read["file!"](key))
      else
        do end (require(("katdotnvim.highlights." .. key))).init()
      end
    end
  else
    for key, _1 in pairs(integrations) do
      do end (require(("katdotnvim.highlights." .. key))).init()
    end
  end
  do end (require("katdotnvim.highlights.terminal")).init()
  if (vim.g.kat_nvim_stupidFeatures == true) then
    do end (require("katdotnvim.stupid")).stupidFunction()
  else
  end
  require("katdotnvim.utils.export.init")
  do end (require("katdotnvim.utils.export.render")).init()
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
_2amodule_2a["init"] = init
return _2amodule_2a