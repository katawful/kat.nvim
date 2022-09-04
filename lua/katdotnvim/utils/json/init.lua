local _2afile_2a = "fnl/katdotnvim/utils/json/init.fnl"
local _2amodule_name_2a = "katdotnvim.utils.json.init"
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
local std_data
local function _1_(...)
  local path = vim.fn.stdpath("data")
  return (path .. "/kat")
end
std_data = ((_2amodule_2a)["std-data"] or _1_(...))
do end (_2amodule_2a)["std-data"] = std_data
local files = ((_2amodule_2a).files or {"main", "syntax", "integrations.cmp", "integrations.coc", "integrations.fugitive", "integrations.gitsigns", "integrations.indent_blankline", "integrations.lsp", "integrations.startify", "integrations.treesitter", "integrations.ts_rainbow", "filetype.markdown", "filetype.vim", "filetype.vimwiki"})
do end (_2amodule_2a)["files"] = files
local path = ((_2amodule_2a).path or (std_data .. "/kat.nvim/json/"))
do end (_2amodule_2a)["path"] = path
local function encode(tbl)
  local encodee = {}
  local source = tbl
  for _, value in pairs(source) do
    if ((type(value) == "function") and (value() ~= nil)) then
      for _0, nest in pairs({value()}) do
        table.insert(encodee, nest)
      end
    elseif ((type(value) == "table") or (value() ~= nil)) then
      local function _3_()
        local t_2_ = value
        if (nil ~= t_2_) then
          t_2_ = (t_2_)[1]
        else
        end
        return t_2_
      end
      if (type(_3_()) == "table") then
        for _0, nest in pairs(value) do
          table.insert(encodee, nest)
        end
      else
        table.insert(encodee, value)
      end
    else
    end
  end
  return vim.json.encode(encodee)
end
_2amodule_2a["encode"] = encode
local function decode(json)
  return vim.json.decode(json)
end
_2amodule_2a["decode"] = decode
local function __3efile_21(file, json)
  os.execute(("rm -f " .. file))
  local json_file = io.open(file, "w")
  local function close_handlers_8_auto(ok_9_auto, ...)
    json_file:close()
    if ok_9_auto then
      return ...
    else
      return error(..., 0)
    end
  end
  local function _8_()
    return json_file:write(json)
  end
  return close_handlers_8_auto(_G.xpcall(_8_, (package.loaded.fennel or debug).traceback))
end
_2amodule_2a["->file!"] = __3efile_21
local function _3c_file(file)
  local json_file = io.open(file, "r")
  if json_file then
    local out = json_file:read("*a")
    io.close(json_file)
    return out
  else
    return "{}"
  end
end
_2amodule_2a["<-file"] = _3c_file
local function file_parse(suffix)
  local file = string.format("katdotnvim.highlights.%s", suffix)
  return require(file)["high-colors"]()
end
_2amodule_2a["file-parse"] = file_parse
return _2amodule_2a