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
local function errMessage(errType, message)
  local errType0 = tostring(errType)
  local message0 = tostring(message)
  local output = ("kat.nvim E" .. errType0 .. ": " .. message0)
  do end (_2amodule_locals_2a)["output"] = output
  print("out ", output)
  return vim.api.nvim_err_writeln(output)
end
_2amodule_2a["errMessage"] = errMessage
local function setDefaults()
  vim.g.kat_nvim_settings = {style = "dark", contrast = "hard", commentStyle = "italic", stupidFeatures = false}
  return nil
end
_2amodule_2a["setDefaults"] = setDefaults