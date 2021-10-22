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
local function errMessage(errType, message)
  local errType0 = tostring(errType)
  local message0 = tostring(message)
  local output = ("kat.nvim E" .. errType0 .. ": " .. message0)
  do end (_2amodule_locals_2a)["output"] = output
  print("out ", output)
  return vim.api.nvim_err_writeln(output)
end
_2amodule_2a["errMessage"] = errMessage
local function setDefaults(check)
  if (check == true) then
    if (vim.fn.exists("kat_nvim_style") == 0) then
      vim.g["kat_nvim_style"] = "dark"
    else
    end
    if (vim.fn.exists("kat_nvim_contrast") == 0) then
      vim.g["kat_nvim_contrast"] = "hard"
    else
    end
    if (vim.fn.exists("kat_nvim_commentStyle") == 0) then
      vim.g["kat_nvim_commentStyle"] = "italic"
    else
    end
    if (vim.fn.exists("kat_nvim_stupidFeatures") == 0) then
      vim.g["kat_nvim_stupidFeatures"] = false
      return nil
    else
      return nil
    end
  else
    vim.g["kat_nvim_style"] = "dark"
    vim.g["kat_nvim_contrast"] = "hard"
    vim.g["kat_nvim_commentStyle"] = "italic"
    vim.g["kat_nvim_stupidFeatures"] = false
    return nil
  end
end
_2amodule_2a["setDefaults"] = setDefaults