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
local json, main, _ = require("katdotnvim.utils.json.init"), require("katdotnvim.main"), nil
_2amodule_locals_2a["json"] = json
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["_"] = _
local header = ((_2amodule_2a).header or string.format("%s", json.path))
do end (_2amodule_2a)["header"] = header
local function file_21(file, source_json, colors_name)
  vim.fn.system(string.format("mkdir -p %s", header))
  return json["->file!"](string.format("%s/%s-%s-%s.json", json.path, file, colors_name, (main["background-mut"])[1]), source_json)
end
_2amodule_2a["file!"] = file_21
local function override_file_21(source_json, override, colors_name)
  vim.fn.system(string.format("mkdir -p %s", header))
  vim.fn.system(string.format("mkdir -p %s", (header .. override)))
  return json["->file!"](string.format("%s%s/%s-%s.json", header, override, colors_name, (main["background-mut"])[1]), source_json)
end
_2amodule_2a["override-file!"] = override_file_21
return _2amodule_2a