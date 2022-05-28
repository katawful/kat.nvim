local _2afile_2a = "fnl/katdotnvim/utils/errors.fnl"
local _2amodule_name_2a = "katdotnvim.utils.errors"
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
local function message_24(error_type, message, test)
  local error_type0 = tostring(error_type)
  local message0 = tostring(message)
  local output = string.format("kat.nvim E%s: %s", error_type0, message0)
  if (test == nil) then
    vim.notify(output, vim.log.levels.ERROR)
  else
  end
  return output
end
_2amodule_2a["message$"] = message_24
local function options__3edefault(check)
  if (check == true) then
    if (vim.fn.exists("kat_nvim_commentStyle") == 0) then
      vim.g["kat_nvim_commentStyle"] = "italic"
    else
    end
    if (vim.fn.exists("kat_nvim_compile_enable") == 0) then
      vim.g["kat_nvim_compile_enable"] = 0
    else
    end
    if (vim.fn.exists("kat_nvim_integrations") == 0) then
      vim.g["kat_nvim_integrations"] = {"treesitter", "lsp", "ts_rainbow", "indent_blankline", "startify", "coc", "cmp", "fugitive"}
    else
    end
    if (vim.fn.exists("kat_nvim_max_version") == 0) then
      local _5_
      if (vim.fn.has("nvim-0.7") == 0) then
        _5_ = "0.6"
      else
        _5_ = "0.7"
      end
      vim.g["kat_nvim_max_version"] = _5_
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
      vim.g["kat_nvim_dontRender"] = 0
      return nil
    else
      return nil
    end
  else
    vim.g["kat_nvim_commentStyle"] = "italic"
    vim.g["kat_nvim_stupidFeatures"] = false
    vim.g["kat_nvim_integrations"] = {"vim", "vimwiki", "markdown"}
    vim.g["kat_nvim_integrations"] = {"treesitter", "lsp", "ts_rainbow", "indent_blankline", "startify", "coc", "cmp", "fugitive"}
    vim.g["kat_nvim_dontRender"] = 0
    vim.g["kat_nvim_compile_enable"] = 0
    return nil
  end
end
_2amodule_2a["options->default"] = options__3edefault
return _2amodule_2a