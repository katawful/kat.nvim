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
local a, color_table, groups, json, main, message, read, view, write, _, _0 = autoload("katdotnvim.aniseed.core"), autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.utils.json.init"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.message.init"), autoload("katdotnvim.utils.json.read"), autoload("katdotnvim.aniseed.view"), autoload("katdotnvim.utils.json.write"), nil, nil
_2amodule_locals_2a["a"] = a
_2amodule_locals_2a["color-table"] = color_table
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["json"] = json
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["message"] = message
_2amodule_locals_2a["read"] = read
_2amodule_locals_2a["view"] = view
_2amodule_locals_2a["write"] = write
_2amodule_locals_2a["_"] = _0
_2amodule_locals_2a["_"] = _0
local function render_file()
  local colors = {{light = "soft"}, {light = "hard"}, {dark = "soft"}, {dark = "hard"}}
  local old_contrast = (main["contrast-mut"])[1]
  local old_background = (main["background-mut"])[1]
  local old_dontRender = vim.g.kat_nvim_dontRender
  local old_version = vim.g.kat_nvim_max_version
  vim.g["kat_nvim_dontRender"] = true
  for _1, v in ipairs(colors) do
    for back, contrast in pairs(v) do
      main["background-mut"][1] = back
      main["contrast-mut"][1] = contrast
      color_table.update()
      for _2, file in ipairs(json.files) do
        write["file!"](file)
      end
    end
  end
  vim.g["kat_nvim_dontRender"] = old_dontRender
  vim.g["kat_nvim_max_version"] = old_version
  do local _ = {nil, nil} end
  main["background-mut"][1] = old_background
  main["contrast-mut"][1] = old_contrast
  return nil
end
_2amodule_locals_2a["render-file"] = render_file
local function render_color(name, source_colors)
  return write["override-file!"](json.encode(source_colors), name)
end
_2amodule_locals_2a["render-color"] = render_color
local function override(source, source_colors)
  local colors = {{light = "soft"}, {light = "hard"}, {dark = "soft"}, {dark = "hard"}}
  local old_contrast = (main["contrast-mut"])[1]
  local old_background = (main["background-mut"])[1]
  local old_dontRender = vim.g.kat_nvim_dontRender
  local old_version = vim.g.kat_nvim_max_version
  vim.g["kat_nvim_dontRender"] = true
  for _1, v in ipairs(colors) do
    for back, contrast in pairs(v) do
      main["background-mut"][1] = back
      main["contrast-mut"][1] = contrast
      color_table.update()
      local _1_ = source
      if (_1_ == "plugin") then
        render_color("plugin", source_colors)
      elseif true then
        local _2 = _1_
        render_color(source, source_colors)
      elseif (_1_ == nil) then
        print("WHAT")
      else
      end
    end
  end
  vim.g["kat_nvim_dontRender"] = old_dontRender
  vim.g["kat_nvim_max_version"] = old_version
  do local _ = {nil, nil} end
  main["background-mut"][1] = old_background
  main["contrast-mut"][1] = old_contrast
  return nil
end
_2amodule_2a["override"] = override
local function init()
  if (vim.g.kat_nvim_max_version == "0.6") then
    return vim.api.nvim_command("command! -nargs=0 KatNvimRenderFiles lua require('katdotnvim.utils.export.render').render-file()")
  else
    local function _3_()
      return render_file()
    end
    return vim.api.nvim_create_user_command("KatNvimRenderFiles", _3_, {desc = "render colorscheme file"})
  end
end
_2amodule_2a["init"] = init
return _2amodule_2a