local _2afile_2a = "fnl/katdotnvim/utils/options/init.fnl"
local _2amodule_name_2a = "katdotnvim.utils.options.init"
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
local _ = nil
_2amodule_locals_2a["_"] = _
local function default_2a()
  vim.g["kat_nvim_commentStyle"] = "italic"
  vim.g["kat_nvim_stupidFeatures"] = false
  vim.g["kat_nvim_integrations"] = {"vim", "vimwiki", "markdown"}
  vim.g["kat_nvim_integrations"] = {"treesitter", "lsp", "gitsigns", "ts_rainbow", "indent_blankline", "startify", "coc", "cmp", "fugitive"}
  vim.g["kat_nvim_dontRender"] = false
  vim.g["kat_nvim_compile_enable"] = false
  return nil
end
_2amodule_2a["default*"] = default_2a
local function default()
  if (vim.fn.exists("kat_nvim_commentStyle") == 0) then
    vim.g["kat_nvim_commentStyle"] = "italic"
  else
  end
  if (vim.fn.exists("kat_nvim_compile_enable") == 0) then
    vim.g["kat_nvim_compile_enable"] = false
  else
  end
  if (vim.fn.exists("kat_nvim_integrations") == 0) then
    vim.g["kat_nvim_integrations"] = {"treesitter", "lsp", "gitsigns", "ts_rainbow", "indent_blankline", "startify", "coc", "cmp", "fugitive"}
  else
  end
  if (vim.fn.exists("kat_nvim_max_version") == 0) then
    local _4_
    if (vim.fn.has("nvim-0.7") == 0) then
      _4_ = "0.6"
    else
      _4_ = "0.7"
    end
    vim.g["kat_nvim_max_version"] = _4_
  else
  end
  if (vim.fn.exists("kat_nvim_filetype") == 0) then
    vim.g["kat_nvim_filetype"] = {"vim", "vimwiki", "markdown"}
  else
  end
  if (vim.fn.exists("kat_nvim_stupidFeatures") == 0) then
    vim.g["kat_nvim_stupidFeatures"] = false
  else
  end
  if (vim.fn.exists("kat_nvim_dontRender") == 0) then
    vim.g["kat_nvim_dontRender"] = false
    return nil
  else
    return nil
  end
end
_2amodule_2a["default"] = default
return _2amodule_2a