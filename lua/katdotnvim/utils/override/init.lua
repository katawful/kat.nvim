local _2afile_2a = "fnl/katdotnvim/utils/override/init.fnl"
local _2amodule_name_2a = "katdotnvim.utils.override.init"
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
local function main_files()
  local fd = vim.loop.fs_opendir(json.path, nil, (#json.files * 4))
  local output = {}
  if fd then
    for _, descriptor in pairs(vim.loop.fs_readdir(fd)) do
      if (descriptor.type == "file") then
        output[descriptor.name] = true
      else
      end
    end
    vim.loop.fs_closedir(fd)
    return output
  else
    return nil
  end
end
_2amodule_2a["main-files"] = main_files
return _2amodule_2a