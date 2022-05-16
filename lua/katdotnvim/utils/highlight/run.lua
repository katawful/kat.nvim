local _2afile_2a = "fnl/katdotnvim/utils/highlight/run.fnl"
local _2amodule_name_2a = "katdotnvim.utils.highlight.run"
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
local a, ucolors = autoload("aniseed.core"), autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["ucolors"] = ucolors
local function highlight_24_3c_table(high_table)
  for _, value in pairs(high_table) do
    if ((type(value) == "function") and (value() ~= nil)) then
      for _0, nest in pairs({value()}) do
        ucolors["highlight$"](nest)
      end
    elseif ((type(value) == "table") or (value() ~= nil)) then
      ucolors["highlight$"](value)
    else
    end
  end
  return nil
end
_2amodule_2a["highlight$<-table"] = highlight_24_3c_table
return _2amodule_2a