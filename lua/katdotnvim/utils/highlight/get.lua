local _2afile_2a = "fnl/katdotnvim/utils/highlight/get.fnl"
local _2amodule_name_2a = "katdotnvim.utils.highlight.get"
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
local a, s = autoload("katdotnvim.aniseed.core"), autoload("katdotnvim.aniseed.string")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["s"] = s
local function group(table)
  local t_1_ = table
  if (nil ~= t_1_) then
    t_1_ = (t_1_).group
  else
  end
  return t_1_
end
_2amodule_2a["group"] = group
local function gui_fg(table)
  local t_3_ = table
  if (nil ~= t_3_) then
    t_3_ = (t_3_).fg
  else
  end
  return t_3_
end
_2amodule_2a["gui-fg"] = gui_fg
local function gui_bg(table)
  local t_5_ = table
  if (nil ~= t_5_) then
    t_5_ = (t_5_).bg
  else
  end
  return t_5_
end
_2amodule_2a["gui-bg"] = gui_bg
local function term_fg(table)
  local t_7_ = table
  if (nil ~= t_7_) then
    t_7_ = (t_7_).ctermfg
  else
  end
  return t_7_
end
_2amodule_2a["term-fg"] = term_fg
local function term_bg(table)
  local t_9_ = table
  if (nil ~= t_9_) then
    t_9_ = (t_9_).ctermbg
  else
  end
  return t_9_
end
_2amodule_2a["term-bg"] = term_bg
local function special(table)
  local t_11_ = table
  if (nil ~= t_11_) then
    t_11_ = (t_11_).sp
  else
  end
  return t_11_
end
_2amodule_2a["special"] = special
local function blend(table)
  local t_13_ = table
  if (nil ~= t_13_) then
    t_13_ = (t_13_).blend
  else
  end
  return t_13_
end
_2amodule_2a["blend"] = blend
local function link(table)
  local t_15_ = table
  if (nil ~= t_15_) then
    t_15_ = (t_15_).link
  else
  end
  return t_15_
end
_2amodule_2a["link"] = link
local function default(table)
  local t_17_ = table
  if (nil ~= t_17_) then
    t_17_ = (t_17_).default
  else
  end
  return t_17_
end
_2amodule_2a["default"] = default
local function all_attr__3etable(table_23)
  local output = {}
  for k, v in pairs(table_23) do
    if ((v == true) or (v == false)) then
      if (vim.g.kat_nvim_max_version == "0.8") then
        local _19_ = k
        if (_19_ == "underlineline") then
          output["underdouble"] = v
        elseif (_19_ == "underdot") then
          output["underdotted"] = v
        elseif (_19_ == "underdash") then
          output["underdashed"] = v
        elseif true then
          local _ = _19_
          print(k)
          do end (output)[k] = v
        else
        end
      else
        output[k] = v
      end
    else
    end
  end
  return output
end
_2amodule_2a["all-attr->table"] = all_attr__3etable
return _2amodule_2a