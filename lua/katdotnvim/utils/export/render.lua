local _2afile_2a = "fnl/katdotnvim/utils/export/render.fnl"
local _2amodule_name_2a = "katdotnvim.utils.export.render"
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
local color_table, json, main, message, read, write, _, _0 = autoload("katdotnvim.color"), autoload("katdotnvim.utils.json.init"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.message.init"), autoload("katdotnvim.utils.json.read"), autoload("katdotnvim.utils.json.write"), nil, nil
_2amodule_locals_2a["color-table"] = color_table
_2amodule_locals_2a["json"] = json
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["message"] = message
_2amodule_locals_2a["read"] = read
_2amodule_locals_2a["write"] = write
_2amodule_locals_2a["_"] = _0
_2amodule_locals_2a["_"] = _0
local function render_file()
  local colors = {{"light", "soft", "kat.nwim"}, {"light", "hard", "kat.nvim"}, {"dark", "soft", "kat.nwim"}, {"dark", "hard", "kat.nvim"}}
  local old_contrast = (main["contrast-mut"])[1]
  local old_background = (main["background-mut"])[1]
  for _1, v in ipairs(colors) do
    main["background-mut"][1] = v[1]
    main["contrast-mut"][1] = v[2]
    color_table.update()
    for _2, file in ipairs(json.files) do
      write["file!"](file, json.encode(json["file-parse"](file)), v[3])
    end
  end
  main["background-mut"][1] = old_background
  main["contrast-mut"][1] = old_contrast
  return nil
end
_2amodule_2a["render-file"] = render_file
local function render_color(args, mutations)
  main["background-mut"][1] = mutations[1]
  main["contrast-mut"][1] = mutations[2]
  color_table.update()
  return write["override-file!"](json.encode(args[2]), args[1], args[3])
end
_2amodule_locals_2a["render-color"] = render_color
local function render_color_2a(args)
  local colors = {{"light", "soft", "kat.nwim"}, {"light", "hard", "kat.nvim"}, {"dark", "soft", "kat.nwim"}, {"dark", "hard", "kat.nvim"}}
  for _1, mutator in pairs(colors) do
    main["background-mut"][1] = mutator[1]
    main["contrast-mut"][1] = mutator[2]
    color_table.update()
    write["override-file!"](json.encode(args[2]), args[1], mutator[3])
  end
  main["background-mut"][1] = __fnl_global__old_2dbackground
  main["contrast-mut"][1] = __fnl_global__old_2dcontrast
  return nil
end
_2amodule_locals_2a["render-color*"] = render_color_2a
local function override(args)
  local old_contrast = (main["contrast-mut"])[1]
  local old_background = (main["background-mut"])[1]
  local assertion = {}
  for k, _1 in pairs(args) do
    table.insert(assertion, true)
  end
  assert((#assertion == 2), "only 2 arguments allowed")
  local _2_
  do
    local t_1_ = args
    if (nil ~= t_1_) then
      t_1_ = (t_1_).light_hard
    else
    end
    _2_ = t_1_
  end
  if _2_ then
    render_color({args.source, args.light_hard, "kat.nvim"}, {"light", "hard"})
  else
  end
  local _6_
  do
    local t_5_ = args
    if (nil ~= t_5_) then
      t_5_ = (t_5_).light_soft
    else
    end
    _6_ = t_5_
  end
  if _6_ then
    render_color({args.source, args.light_soft, "kat.nwim"}, {"light", "soft"})
  else
  end
  local _10_
  do
    local t_9_ = args
    if (nil ~= t_9_) then
      t_9_ = (t_9_).dark_hard
    else
    end
    _10_ = t_9_
  end
  if _10_ then
    render_color({args.source, args.dark_hard, "kat.nvim"}, {"dark", "hard"})
  else
  end
  local _14_
  do
    local t_13_ = args
    if (nil ~= t_13_) then
      t_13_ = (t_13_).dark_soft
    else
    end
    _14_ = t_13_
  end
  if _14_ then
    render_color({args.source, args.dark_soft, "kat.nwim"}, {"dark", "soft"})
  else
  end
  main["background-mut"][1] = old_background
  main["contrast-mut"][1] = old_contrast
  return nil
end
_2amodule_2a["override"] = override
local function override_all(args)
  local old_contrast = (main["contrast-mut"])[1]
  local old_background = (main["background-mut"])[1]
  local assertion = {}
  for k, _1 in pairs(args) do
    table.insert(assertion, true)
  end
  assert((#assertion == 2), "only 2 arguments allowed")
  render_color_2a({args.source, args[1]})
  do end (main["background-mut"])[1] = old_background
  main["contrast-mut"][1] = old_contrast
  return nil
end
_2amodule_2a["override_all"] = override_all
local function init()
  local function _17_()
    return render_file()
  end
  return vim.api.nvim_create_user_command("KatNvimRender", _17_, {desc = "Render kat.nvim colorscheme to file"})
end
_2amodule_2a["init"] = init
return _2amodule_2a