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
local autoload = (require("aniseed.autoload")).autoload
local a, groups, _, _0 = autoload("aniseed.core"), autoload("katdotnvim.highlights.main"), nil, nil
_2amodule_locals_2a["a"] = a
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["_"] = _0
_2amodule_locals_2a["_"] = _0
local function get_groups(source)
  local output_string = ""
  for _1, v in pairs(require(source.path)["high-colors"]()) do
    if (type(v) == "function") then
      output_string = string.format("%s\n  %s", output_string, a.str(v()))
    else
      output_string = string.format("%s\n  %s", output_string, a.str(v))
    end
  end
  return output_string
end
_2amodule_2a["get-groups"] = get_groups
local function build_string__3efile(source, color, back)
  local contrast
  if (color == "kat.nwim") then
    contrast = "soft"
  else
    contrast = "hard"
  end
  local shade = back
  local output_string
  if (source.types == "none") then
    output_string = string.format("(module katdotnvim.exported.%s-%s-%s\n  {autoload {run katdotnvim.utils.highlight.run}})\n(defn render []\n [%s])\n(defn init [] (run.highlight$<-table (render)))", source.name, shade, contrast, get_groups(source))
  else
    output_string = string.format("(module katdotnvim.exported.%s.%s-%s-%s\n  {autoload {run katdotnvim.utils.highlight.run}})\n(defn render []\n [%s])\n(defn init [] (run.highlight$<-table (render)))", source.types, source.name, shade, contrast, get_groups(source))
  end
  if (source.types == "none") then
    return a.spit(("fnl/katdotnvim/exported/" .. source.name .. "-" .. shade .. "-" .. contrast .. ".fnl"), output_string)
  else
    return a.spit(("fnl/katdotnvim/exported/" .. source.types .. "/" .. source.name .. "-" .. shade .. "-" .. contrast .. ".fnl"), output_string)
  end
end
_2amodule_2a["build-string->file"] = build_string__3efile
local function start_group()
  local files = {{name = "main", path = "katdotnvim.highlights.main", types = "none"}, {name = "syntax", path = "katdotnvim.highlights.syntax", types = "none"}, {name = "cmp", path = "katdotnvim.highlights.integrations.cmp", types = "integrations"}, {name = "coc", path = "katdotnvim.highlights.integrations.coc", types = "integrations"}, {name = "fugitive", path = "katdotnvim.highlights.integrations.fugitive", types = "integrations"}, {name = "indent_blankline", path = "katdotnvim.highlights.integrations.indent_blankline", types = "integrations"}, {name = "lsp", path = "katdotnvim.highlights.integrations.lsp", types = "integrations"}, {name = "startify", path = "katdotnvim.highlights.integrations.startify", types = "integrations"}, {name = "treesitter", path = "katdotnvim.highlights.integrations.treesitter", types = "integrations"}, {name = "ts_rainbow", path = "katdotnvim.highlights.integrations.ts_rainbow", types = "integrations"}, {name = "markdown", path = "katdotnvim.highlights.filetype.markdown", types = "filetype"}, {name = "vim", path = "katdotnvim.highlights.filetype.vim", types = "filetype"}, {name = "vimwiki", path = "katdotnvim.highlights.filetype.vimwiki", types = "filetype"}}
  local colors = {{light = "kat.nwim"}, {light = "kat.nvim"}, {dark = "kat.nwim"}, {dark = "kat.nvim"}}
  local old_color = vim.g.colors_name
  local old_background = vim.o.background
  local old_dontRender = vim.g.kat_nvim_dontRender
  vim.g["kat_nvim_dontRender"] = 1
  for _1, v in ipairs(colors) do
    for back, color in pairs(v) do
      vim.g["colors_name"] = color
      vim.api.nvim_set_option("background", back)
      print(back)
      for _2, v1 in ipairs(files) do
        __fnl_global__build_2dstring_2d_3e(v1, color, back)
      end
    end
  end
  vim.g["colors_name"] = old_color
  vim.api.nvim_set_option("background", old_background)
  do end (vim.g)["kat_nvim_dontRender"] = old_dontRender
  return nil
end
_2amodule_2a["start-group"] = start_group
local function init()
  local function _5_()
    return start_group()
  end
  return vim.api.nvim_create_user_command("KatRenderFile", _5_, {desc = "render colorscheme file"})
end
_2amodule_2a["init"] = init
return _2amodule_2a