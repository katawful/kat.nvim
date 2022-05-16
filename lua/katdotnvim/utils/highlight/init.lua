local _2afile_2a = "fnl/katdotnvim/utils/highlight/init.fnl"
local _2amodule_name_2a = "katdotnvim.utils.highlight.init"
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
local a, s = autoload("aniseed.core"), autoload("aniseed.string")
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
local function attr__3etable(table_23)
  local output = {}
  for k, v in pairs(table_23) do
    if (v == true) then
      table.insert(output, k)
    else
    end
  end
  return output
end
_2amodule_2a["attr->table"] = attr__3etable
local function all_attr__3etable(table_23)
  local output = {}
  for k, v in pairs(table_23) do
    if ((v == true) or (v == false)) then
      output[k] = v
    else
    end
  end
  return output
end
_2amodule_2a["all-attr->table"] = all_attr__3etable
local function attr__3estring(table)
  local attr_table = attr__3etable(table)
  if a["empty?"](attr_table) then
    return nil
  else
    return s.join(",", attr__3etable(table))
  end
end
_2amodule_2a["attr->string"] = attr__3estring
return _2amodule_2a