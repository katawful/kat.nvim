local _2afile_2a = "fnl/katdotnvim/utils/message/init.fnl"
local _2amodule_name_2a = "katdotnvim.utils.message.init"
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
local notifications = ((_2amodule_2a).notifications or {["utils.options.init"] = {["option-deprecation"] = {number = 3, type = "warn", message = "Option '%s' is considered deprecated for removal by September 30th 2022. Please unbind."}}, ["utils.export.render"] = {["compilation-dev"] = {number = 1, type = "warn", message = "Compilation is a development feature, please consider setting \"vim.g.kat_nvim_compile_enable\" to false"}}, ["utils.export.init"] = {["not-colorscheme"] = {number = 1, type = "error", message = "Not a kat.nvim colorscheme, theme won't compile"}, ["invalid-arg"] = {number = 2, type = "error", message = "'%s' is not a valid argument for :KatGenTermTheme"}, ["term-theme-generated"] = {number = 1, type = "info", message = "%s color file generated at cwd using %s colorscheme with %s background"}}})
do end (_2amodule_locals_2a)["notifications"] = notifications
local function notify_24(log_level, message)
  local _1_ = log_level
  if (_1_ == "error") then
    return vim.notify(message, vim.log.levels.ERROR)
  elseif (_1_ == "warn") then
    return vim.notify(message, vim.log.levels.WARN)
  elseif (_1_ == "info") then
    return vim.notify(message, vim.log.levels.INFO)
  elseif (_1_ == "debug") then
    return vim.notify(message, vim.log.levels.DEBUG)
  elseif (_1_ == "trace") then
    return vim.notify(message, vim.log.levels.TRACE)
  else
    return nil
  end
end
_2amodule_locals_2a["notify$"] = notify_24
local function error_24(message)
  return notify_24("error", message)
end
_2amodule_2a["error$"] = error_24
local function warn_24(message)
  return notify_24("warn", message)
end
_2amodule_2a["warn$"] = warn_24
local function info_24(message)
  return notify_24("info", message)
end
_2amodule_2a["info$"] = info_24
local function debug_24(message)
  return notify_24("debug", message)
end
_2amodule_2a["debug$"] = debug_24
local function trace_24(message)
  return notify_24("trace", message)
end
_2amodule_2a["trace$"] = trace_24
local function _3c_table(from_module, message_type)
  local message_table = notifications[from_module][message_type]
  local notify_type
  do
    local _3_ = message_table.type
    if (_3_ == "error") then
      notify_type = "E"
    elseif (_3_ == "warn") then
      notify_type = "W"
    elseif (_3_ == "info") then
      notify_type = "I"
    elseif (_3_ == "debug") then
      notify_type = "D"
    elseif (_3_ == "trace") then
      notify_type = "T"
    else
      notify_type = nil
    end
  end
  local output = string.format("kat.nvim %s%s: %s", notify_type, message_table.number, message_table.message)
  return output
end
_2amodule_2a["<-table"] = _3c_table
return _2amodule_2a