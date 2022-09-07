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
local deprecation_check = {messaged = false}
_2amodule_2a["deprecation-check"] = deprecation_check
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
    print("NEIO")
    print(deprecation_check.messaged)
    if (deprecation_check.messaged == false) then
      local function mess()
        return message["warn$"](string.format(message["<-table"]("utils.options.init", "option-deprecation"), "vim.g.kat_nvim_commentStyle"))
      end
      vim.defer_fn(mess, 1000)
    else
    end
  else
    if (deprecation_check.messaged == false) then
      vim.g["kat_nvim_commentStyle"] = "italic"
    else
    end
  end
  local _7_
  do
    local result_2_auto = vim.fn.exists("kat_nvim_compile_enable")
    if (result_2_auto == 0) then
      _7_ = false
    else
      _7_ = true
    end
  end
  if _7_ then
    if (deprecation_check.messaged == false) then
      local function mess()
        return message["warn$"](string.format(message["<-table"]("utils.options.init", "option-deprecation"), "vim.g.kat_nvim_compile_enable"))
      end
      vim.defer_fn(mess, 1000)
    else
    end
  else
  end
  local _12_
  do
    local result_2_auto = vim.fn.exists("kat_nvim_integrations")
    if (result_2_auto == 0) then
      _12_ = false
    else
      _12_ = true
    end
  end
  if not _12_ then
    vim.g["kat_nvim_integrations"] = {"treesitter", "lsp", "gitsigns", "ts_rainbow", "indent_blankline", "startify", "coc", "cmp", "fugitive"}
  else
  end
  local _16_
  do
    local result_2_auto = vim.fn.exists("kat_nvim_max_version")
    if (result_2_auto == 0) then
      _16_ = false
    else
      _16_ = true
    end
  end
  if not _16_ then
    local _19_
    do
      local _20_
      do
        local result_2_auto = vim.fn.has("nvim-0.7")
        if (result_2_auto == 0) then
          _20_ = false
        else
          _20_ = true
        end
      end
      if _20_ then
      else
      end
      local function _24_()
        local result_2_auto = vim.fn.has("nvim-0.8")
        if (result_2_auto == 0) then
          return false
        else
          return true
        end
      end
      local function _26_()
        local result_2_auto = vim.fn.has("nvim-0.7")
        if (result_2_auto == 0) then
          return false
        else
          return true
        end
      end
      if (_24_() and _26_()) then
        _19_ = "0.8"
      else
        _19_ = "0.7"
      end
    end
    vim.g["kat_nvim_max_version"] = _19_
  else
  end
  local _30_
  do
    local result_2_auto = vim.fn.exists("kat_nvim_filetype")
    if (result_2_auto == 0) then
      _30_ = false
    else
      _30_ = true
    end
  end
  if not _30_ then
    vim.g["kat_nvim_filetype"] = {"vim", "vimwiki", "markdown"}
  else
  end
  local _34_
  do
    local result_2_auto = vim.fn.exists("kat_nvim_stupidFeatures")
    if (result_2_auto == 0) then
      _34_ = false
    else
      _34_ = true
    end
  end
  if not _34_ then
    vim.g["kat_nvim_stupidFeatures"] = false
  else
  end
  local _38_
  do
    local result_2_auto = vim.fn.exists("kat_nvim_dontRender")
    if (result_2_auto == 0) then
      _38_ = false
    else
      _38_ = true
    end
  end
  if _38_ then
    if (deprecation_check.messaged == false) then
      local function mess()
        return message["warn$"](string.format(message["<-table"]("utils.options.init", "option-deprecation"), "vim.g.kat_nvim_dontRender"))
      end
      vim.defer_fn(mess, 1000)
    else
    end
  else
  end
  deprecation_check["messaged"] = true
  return nil
end
_2amodule_2a["default"] = default
return _2amodule_2a