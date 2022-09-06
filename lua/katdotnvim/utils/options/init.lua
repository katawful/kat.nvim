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
local autoload = (require("katdotnvim.aniseed.autoload")).autoload
local message, _ = autoload("katdotnvim.utils.message.init"), nil
_2amodule_locals_2a["message"] = message
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
    local function mess()
      return message["warn$"](string.format(message["<-table"]("utils.options.init", "option-deprecation"), "vim.g.kat_nvim_commentStyle"))
    end
    vim.defer_fn(mess, 1000)
  end
  if (vim.fn.exists("kat_nvim_compile_enable") == 0) then
    vim.g["kat_nvim_compile_enable"] = false
  else
    local function mess()
      return message["warn$"](string.format(message["<-table"]("utils.options.init", "option-deprecation"), "vim.g.kat_nvim_compile_enable"))
    end
    vim.defer_fn(mess, 1000)
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
    local function mess()
      return message["warn$"](string.format(message["<-table"]("utils.options.init", "option-deprecation"), "vim.g.kat_nvim_dontRender"))
    end
    return vim.defer_fn(mess, 1000)
  end
end
_2amodule_2a["default"] = default
return _2amodule_2a