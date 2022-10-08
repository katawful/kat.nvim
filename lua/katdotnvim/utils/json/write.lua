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
local color_table, json, main, _ = autoload("katdotnvim.color"), autoload("katdotnvim.utils.json.init"), autoload("katdotnvim.main"), nil
_2amodule_locals_2a["color-table"] = color_table
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
local function colors(dir)
  local colors0 = {{"light", "soft", "kat.nwim"}, {"light", "hard", "kat.nvim"}, {"dark", "soft", "kat.nwim"}, {"dark", "hard", "kat.nvim"}}
  main["background-mut"] = {}
  main["contrast-mut"] = {}
  main["colors-name-mut"] = {}
  for _0, v in pairs(colors0) do
    main["background-mut"][1] = v[1]
    main["contrast-mut"][1] = v[2]
    main["colors-name-mut"][1] = v[3]
    json["->file!"](string.format("%s/colors-%s-%s.json", dir, v[3], v[1]), json["encode-simple"](color_table.output()))
  end
  main["background-mut"][1] = __fnl_global__old_2dbackground
  main["contrast-mut"][1] = __fnl_global__old_2dcontrast
  main["colors-name-mut"][1] = __fnl_global__old_2dcolors_2dname
  return nil
end
_2amodule_2a["colors"] = colors
return _2amodule_2a