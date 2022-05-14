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
local s = autoload("aniseed.string")
do end (_2amodule_locals_2a)["s"] = s
local function group(table)
  return table.group
end
_2amodule_2a["group"] = group
local function gui_fg(table)
  return table.fg
end
_2amodule_2a["gui-fg"] = gui_fg
local function gui_bg(table)
  return table.bg
end
_2amodule_2a["gui-bg"] = gui_bg
local function term_fg(table)
  return table.ctermfg
end
_2amodule_2a["term-fg"] = term_fg
local function term_bg(table)
  return table.ctermbg
end
_2amodule_2a["term-bg"] = term_bg
local function special(table)
  return table.sp
end
_2amodule_2a["special"] = special
local function blend(table)
  return table.blend
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
local function attr__3estring(table)
  return s.join(",", attr__3etable(table))
end
_2amodule_2a["attr->string"] = attr__3estring
return _2amodule_2a