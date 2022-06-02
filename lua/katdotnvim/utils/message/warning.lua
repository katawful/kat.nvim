local _2afile_2a = "fnl/katdotnvim/utils/message/warning.fnl"
local _2amodule_name_2a = "katdotnvim.utils.message.warning"
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
  local output = string.format("kat.nvim W%s: %s", error_type0, message0)
  if (test == nil) then
    vim.notify(output, vim.log.levels.WARN)
  else
  end
  return output
end
_2amodule_2a["message$"] = message_24
return _2amodule_2a