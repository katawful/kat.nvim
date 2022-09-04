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
local function get_dir()
  local desc_num = (10 + (#json.files * 4))
  local fd = vim.loop.fs_opendir(json.path, nil, desc_num)
  local output = {}
  if fd then
    for _, descriptor in pairs(vim.loop.fs_readdir(fd)) do
      if (descriptor.type == "directory") then
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
_2amodule_2a["get-dir"] = get_dir
local function files()
  local desc_num = 20
  local dirs = get_dir()
  local output = {}
  if dirs then
    for dir, _ in pairs(dirs) do
      local fd = vim.loop.fs_opendir((json.path .. dir), nil, desc_num)
      if fd then
        for _0, descriptor in pairs(vim.loop.fs_readdir(fd)) do
          if (descriptor.type == "file") then
            output[(dir .. "/" .. descriptor.name)] = true
          else
          end
        end
      else
      end
      vim.loop.fs_closedir(fd)
    end
    return output
  else
    return nil
  end
end
_2amodule_2a["files"] = files
return _2amodule_2a