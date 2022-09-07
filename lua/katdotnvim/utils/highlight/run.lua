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
local autoload = (require("katdotnvim.aniseed.autoload")).autoload
local a, apply, ucolors = autoload("katdotnvim.aniseed.core"), autoload("katdotnvim.utils.highlight.init"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["apply"] = apply
_2amodule_locals_2a["ucolors"] = ucolors
local function highlight_24_3c_table(high_table)
  for _, value in pairs(high_table) do
    if ((type(value) == "function") and (value() ~= nil)) then
      local function _1_()
        local t_2_ = value()
        if (nil ~= t_2_) then
          t_2_ = (t_2_)[1]
        else
        end
        return t_2_
      end
      if ((type(value()) == "table") and _1_()) then
        for _0, nest in pairs(value()) do
          if (type(nest) == "function") then
            apply["highlight$"](nest())
          else
            apply["highlight$"](nest)
          end
        end
      else
        apply["highlight$"](value())
      end
    elseif ((type(value) == "table") or (value() ~= nil)) then
      local function _7_()
        local t_6_ = value
        if (nil ~= t_6_) then
          t_6_ = (t_6_)[1]
        else
        end
        return t_6_
      end
      if (type(_7_()) == "table") then
        for _0, nest in pairs(value) do
          apply["highlight$"](nest)
        end
      else
        apply["highlight$"](value)
      end
    else
    end
  end
  return nil
end
_2amodule_2a["highlight$<-table"] = highlight_24_3c_table
return _2amodule_2a