local _2afile_2a = "fnl/katdotnvim/utils/export/render.fnl"
local _2amodule_name_2a = "katdotnvim.utils.export.render"
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
local a, groups, json, message, read, write, _, _0 = autoload("katdotnvim.aniseed.core"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.utils.json.init"), autoload("katdotnvim.utils.message.init"), autoload("katdotnvim.utils.json.read"), autoload("katdotnvim.utils.json.write"), nil, nil
_2amodule_locals_2a["a"] = a
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["json"] = json
_2amodule_locals_2a["message"] = message
_2amodule_locals_2a["read"] = read
_2amodule_locals_2a["write"] = write
_2amodule_locals_2a["_"] = _0
_2amodule_locals_2a["_"] = _0
local function render()
  local colors = {{light = "kat.nwim"}, {light = "kat.nvim"}, {dark = "kat.nwim"}, {dark = "kat.nvim"}}
  local old_color = vim.g.colors_name
  local old_background = vim.o.background
  local old_dontRender = vim.g.kat_nvim_dontRender
  local old_version = vim.g.kat_nvim_max_version
  vim.g["kat_nvim_dontRender"] = true
  for _1, v in ipairs(colors) do
    for back, color in pairs(v) do
      vim.g["colors_name"] = color
      vim.opt["background"] = back
      for _2, file in ipairs(json.files) do
        write["file!"](file)
      end
    end
  end
  vim.g["kat_nvim_dontRender"] = old_dontRender
  vim.g["kat_nvim_max_version"] = old_version
  vim.g["colors_name"] = old_color
  do local _ = {nil, nil, nil} end
  vim.opt["background"] = old_background
  return nil
end
_2amodule_locals_2a["render"] = render
local function init()
  if (vim.g.kat_nvim_compile_enable == true) then
    message["warn$"](message["<-table"]("utils.export.render", "compilation-dev"))
    if (vim.g.kat_nvim_max_version == "0.6") then
      return vim.api.nvim_command("command! -nargs=0 KatNvimRenderFiles lua require('katdotnvim.utils.export.render').render()")
    else
      local function _1_()
        return render()
      end
      return vim.api.nvim_create_user_command("KatNvimRenderFiles", _1_, {desc = "render colorscheme file"})
    end
  else
    return nil
  end
end
_2amodule_2a["init"] = init
return _2amodule_2a