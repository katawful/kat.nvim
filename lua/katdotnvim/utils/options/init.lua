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
local message, _, _0 = autoload("katdotnvim.utils.message.init"), nil, nil
_2amodule_locals_2a["message"] = message
_2amodule_locals_2a["_"] = _0
_2amodule_locals_2a["_"] = _0
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
  local _1_
  do
    local result_2_auto = vim.fn.exists("kat_nvim_commentStyle")
    if (result_2_auto == 0) then
      _1_ = false
    else
      _1_ = true
    end
  end
  if _1_ then
    local function mess()
      return message["warn$"](string.format(message["<-table"]("utils.options.init", "option-deprecation"), "vim.g.kat_nvim_commentStyle"))
    end
    vim.defer_fn(mess, 1000)
  else
    vim.g["kat_nvim_commentStyle"] = "italic"
  end
  local _5_
  do
    local result_2_auto = vim.fn.exists("kat_nvim_compile_enable")
    if (result_2_auto == 0) then
      _5_ = false
    else
      _5_ = true
    end
  end
  if _5_ then
    local function mess()
      return message["warn$"](string.format(message["<-table"]("utils.options.init", "option-deprecation"), "vim.g.kat_nvim_compile_enable"))
    end
    vim.defer_fn(mess, 1000)
  else
    vim.g["kat_nvim_compile_enable"] = false
  end
  local _9_
  do
    local result_2_auto = vim.fn.exists("kat_nvim_integrations")
    if (result_2_auto == 0) then
      _9_ = false
    else
      _9_ = true
    end
  end
  if not _9_ then
    vim.g["kat_nvim_integrations"] = {"treesitter", "lsp", "gitsigns", "ts_rainbow", "indent_blankline", "startify", "coc", "cmp", "fugitive"}
  else
  end
  local _13_
  do
    local result_2_auto = vim.fn.exists("kat_nvim_max_version")
    if (result_2_auto == 0) then
      _13_ = false
    else
      _13_ = true
    end
  end
  if not _13_ then
    local _16_
    local _17_
    do
      local result_2_auto = vim.fn.has("nvim-0.7")
      if (result_2_auto == 0) then
        _17_ = false
      else
        _17_ = true
      end
    end
    if _17_ then
      _16_ = "0.6"
    else
      _16_ = "0.7"
    end
    vim.g["kat_nvim_max_version"] = _16_
  else
  end
  local _22_
  do
    local result_2_auto = vim.fn.exists("kat_nvim_filetype")
    if (result_2_auto == 0) then
      _22_ = false
    else
      _22_ = true
    end
  end
  if not _22_ then
    vim.g["kat_nvim_filetype"] = {"vim", "vimwiki", "markdown"}
  else
  end
  local _26_
  do
    local result_2_auto = vim.fn.exists("kat_nvim_stupidFeatures")
    if (result_2_auto == 0) then
      _26_ = false
    else
      _26_ = true
    end
  end
  if not _26_ then
    vim.g["kat_nvim_stupidFeatures"] = false
  else
  end
  local _30_
  do
    local result_2_auto = vim.fn.exists("kat_nvim_dontRender")
    if (result_2_auto == 0) then
      _30_ = false
    else
      _30_ = true
    end
  end
  if _30_ then
    local function mess()
      return message["warn$"](string.format(message["<-table"]("utils.options.init", "option-deprecation"), "vim.g.kat_nvim_dontRender"))
    end
    return vim.defer_fn(mess, 1000)
  else
    vim.g["kat_nvim_dontRender"] = false
    return nil
  end
end
_2amodule_2a["default"] = default
return _2amodule_2a