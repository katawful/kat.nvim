local _2afile_2a = "fnl/katdotnvim/utils/json/write.fnl"
local _2amodule_name_2a = "katdotnvim.utils.json.write"
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
local json = autoload("katdotnvim.utils.json.init")
do end (_2amodule_locals_2a)["json"] = json
local header = ((_2amodule_2a).header or string.format("%s", json.path))
do end (_2amodule_2a)["header"] = header
local function file_21(file)
  vim.fn.system(string.format("mkdir -p %s", header))
  return json["->file!"](string.format("%s/%s-%s-%s.json", json.path, file, vim.g.colors_name, vim.o.background), json.encode(json["file-parse"](file)))
end
_2amodule_2a["file!"] = file_21
return _2amodule_2a