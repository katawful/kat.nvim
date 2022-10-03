local _2afile_2a = "fnl/katdotnvim/utils/json/read.fnl"
local _2amodule_name_2a = "katdotnvim.utils.json.read"
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
local json, main = autoload("katdotnvim.utils.json.init"), autoload("katdotnvim.main")
do end (_2amodule_locals_2a)["json"] = json
_2amodule_locals_2a["main"] = main
local header = ((_2amodule_2a).header or string.format("%s", json.path))
do end (_2amodule_2a)["header"] = header
local function file_21(file)
  return json.decode(json["<-file"](string.format("%s%s-%s-%s.json", header, file, (main["colors-name-mut"])[1], (main["background-mut"])[1])))
end
_2amodule_2a["file!"] = file_21
local function full_file_21(full_file)
  return json.decode(json["<-file"](string.format("%s%s", header, full_file)))
end
_2amodule_2a["full-file!"] = full_file_21
return _2amodule_2a