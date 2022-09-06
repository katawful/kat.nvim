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
local autoload = (require("katdotnvim.aniseed.autoload")).autoload
local a, colors, get, hsl, s, _, _0 = autoload("katdotnvim.aniseed.core"), autoload("katdotnvim.color"), autoload("katdotnvim.utils.highlight.get"), autoload("externals.hsluv"), autoload("katdotnvim.aniseed.string"), nil, nil
_2amodule_locals_2a["a"] = a
_2amodule_locals_2a["colors"] = colors
_2amodule_locals_2a["get"] = get
_2amodule_locals_2a["hsl"] = hsl
_2amodule_locals_2a["s"] = s
_2amodule_locals_2a["_"] = _0
_2amodule_locals_2a["_"] = _0
local function get_existing(group)
  local gui = vim.api.nvim_get_hl_by_name(group, true)
  local fg = gui.foreground
  local bg = gui.background
  local cterm = vim.api.nvim_get_hl_by_name(group, false)
  local ctermfg = cterm.foreground
  local ctermbg = cterm.background
  local bold
  do
    local t_1_ = gui
    if (nil ~= t_1_) then
      t_1_ = (t_1_).bold
    else
    end
    bold = t_1_
  end
  local underline
  do
    local t_3_ = gui
    if (nil ~= t_3_) then
      t_3_ = (t_3_).undlerline
    else
    end
    underline = t_3_
  end
  local underlineline
  do
    local t_5_ = gui
    if (nil ~= t_5_) then
      t_5_ = (t_5_).underlineline
    else
    end
    underlineline = t_5_
  end
  local undercurl
  do
    local t_7_ = gui
    if (nil ~= t_7_) then
      t_7_ = (t_7_).undercurl
    else
    end
    undercurl = t_7_
  end
  local underdot
  do
    local t_9_ = gui
    if (nil ~= t_9_) then
      t_9_ = (t_9_).underdot
    else
    end
    underdot = t_9_
  end
  local underdash
  do
    local t_11_ = gui
    if (nil ~= t_11_) then
      t_11_ = (t_11_).underdash
    else
    end
    underdash = t_11_
  end
  local inverse
  do
    local t_13_ = gui
    if (nil ~= t_13_) then
      t_13_ = (t_13_).inverse
    else
    end
    inverse = t_13_
  end
  local italic
  do
    local t_15_ = gui
    if (nil ~= t_15_) then
      t_15_ = (t_15_).italic
    else
    end
    italic = t_15_
  end
  local standout
  do
    local t_17_ = gui
    if (nil ~= t_17_) then
      t_17_ = (t_17_).standout
    else
    end
    standout = t_17_
  end
  local nocombine
  do
    local t_19_ = gui
    if (nil ~= t_19_) then
      t_19_ = (t_19_).nocombine
    else
    end
    nocombine = t_19_
  end
  local strikethrough
  do
    local t_21_ = gui
    if (nil ~= t_21_) then
      t_21_ = (t_21_).strikethrough
    else
    end
    strikethrough = t_21_
  end
  return {fg = fg, bg = bg, ctermbg = ctermbg, ctermfg = ctermfg, bold = bold, underline = underline, underlineline = underlineline, undercurl = undercurl, underdot = underdot, underdash = underdash, inverse = inverse, italic = italic, nocombine = nocombine, standout = standout, strikethrough = strikethrough}
end
_2amodule_2a["get-existing"] = get_existing
local function overwrite(opts)
  local group = get.group(opts)
  local current_hl = get_existing(group)
  local output = vim.tbl_extend("force", current_hl, opts)
  do end (output)["group"] = nil
  output["default"] = nil
  return output
end
_2amodule_2a["overwrite"] = overwrite
local function highlight_24_3c_vimscript(opts)
  if get.link(opts) then
    local group = get.group(opts)
    local link = get.link(opts)
    return vim.cmd(string.format("hi def link %s %s", group, link))
  elseif get.default(opts) then
    local group = get.group(opts)
    local args = overwrite(opts)
    local gui_fore
    if ((get["gui-fg"](args) ~= nil) and (args.fg ~= "SKIP")) then
      gui_fore = string.format(" guifg=%s", args.fg)
    else
      gui_fore = ""
    end
    local gui_back
    if ((get["gui-bg"](args) ~= nil) and (args.bg ~= "SKIP")) then
      gui_back = string.format(" guibg=%s", args.bg)
    else
      gui_back = ""
    end
    local c_fore
    if ((get["term-fg"](args) ~= nil) and (args.ctermfg ~= "SKIP")) then
      c_fore = string.format(" ctermfg=%s", args.ctermfg)
    else
      c_fore = ""
    end
    local c_back
    if ((get["term-bg"](args) ~= nil) and (args.ctermbg ~= "SKIP")) then
      c_back = string.format(" ctermbg=%s", args.ctermbg)
    else
      c_back = ""
    end
    local special
    if (get.special(args) ~= nil) then
      special = string.format(" guisp=%s", get.special(args))
    else
      special = ""
    end
    local blend
    if (get.blend(args) ~= nil) then
      blend = string.format(" blend=%s", get.blend(args))
    else
      blend = ""
    end
    local attr
    do
      local attr_string = get["attr->string"](args)
      if (attr_string ~= nil) then
        attr = string.format(" gui=%s cterm=%s", attr_string, attr_string)
      else
        attr = ""
      end
    end
    local highlight = ("highlight " .. group .. gui_fore .. gui_back .. c_fore .. c_back .. attr .. special .. blend)
    return vim.cmd(tostring(highlight))
  else
    local group = get.group(opts)
    local gui_fore
    if ((get["gui-fg"](opts) ~= nil) and (opts.fg ~= "SKIP")) then
      gui_fore = string.format(" guifg=%s", opts.fg)
    else
      gui_fore = ""
    end
    local gui_back
    if ((get["gui-bg"](opts) ~= nil) and (opts.bg ~= "SKIP")) then
      gui_back = string.format(" guibg=%s", opts.bg)
    else
      gui_back = ""
    end
    local c_fore
    if ((get["term-fg"](opts) ~= nil) and (opts.ctermfg ~= "SKIP")) then
      c_fore = string.format(" ctermfg=%s", opts.ctermfg)
    else
      c_fore = ""
    end
    local c_back
    if ((get["term-bg"](opts) ~= nil) and (opts.ctermbg ~= "SKIP")) then
      c_back = string.format(" ctermbg=%s", opts.ctermbg)
    else
      c_back = ""
    end
    local special
    if (get.special(opts) ~= nil) then
      special = string.format(" guisp=%s", get.special(opts))
    else
      special = ""
    end
    local blend
    if (get.blend(opts) ~= nil) then
      blend = string.format(" blend=%s", get.blend(opts))
    else
      blend = ""
    end
    local attr
    do
      local attr_string = get["attr->string"](opts)
      if (attr_string ~= nil) then
        attr = string.format(" gui=%s cterm=%s", attr_string, attr_string)
      else
        attr = ""
      end
    end
    local highlight = ("highlight " .. group .. gui_fore .. gui_back .. c_fore .. c_back .. attr .. special .. blend)
    return vim.cmd(tostring(highlight))
  end
end
_2amodule_locals_2a["highlight$<-vimscript"] = highlight_24_3c_vimscript
local function highlight_24_3c_api(opts)
  if get.link(opts) then
    local group = get.group(opts)
    local link = get.link(opts)
    local args = {link = link}
    return vim.api.nvim_set_hl(0, group, args)
  elseif get.default(opts) then
    local group = get.group(opts)
    local args = overwrite(opts)
    return vim.api.nvim_set_hl(0, group, args)
  else
    local group = get.group(opts)
    local gui_fore
    if ((get["gui-fg"](opts) ~= nil) and (opts.fg ~= "NONE") and (opts.fg ~= "SKIP")) then
      gui_fore = opts.fg
    else
      gui_fore = nil
    end
    local gui_back
    if ((get["gui-bg"](opts) ~= nil) and (opts.bg ~= "NONE") and (opts.bg ~= "SKIP")) then
      gui_back = opts.bg
    else
      gui_back = nil
    end
    local c_fore
    if ((get["term-fg"](opts) ~= nil) and (opts.ctermfg ~= "NONE") and (opts.ctermfg ~= "SKIP")) then
      c_fore = opts.ctermfg
    else
      c_fore = nil
    end
    local c_back
    if ((get["term-bg"](opts) ~= nil) and (opts.ctermbg ~= "NONE") and (opts.ctermbg ~= "SKIP")) then
      c_back = opts.ctermbg
    else
      c_back = nil
    end
    local args = {fg = gui_fore, bg = gui_back, ctermfg = c_fore, ctermbg = c_back, special = get.special(opts), blend = get.blend(opts)}
    for k, v in pairs(get["all-attr->table"](opts)) do
      args[k] = v
    end
    return vim.api.nvim_set_hl(0, group, args)
  end
end
_2amodule_locals_2a["highlight$<-api"] = highlight_24_3c_api
local function highlight_24(opts)
  local _43_
  do
    local result_2_auto = vim.fn.has("nvim-0.7")
    if (result_2_auto == 0) then
      _43_ = false
    else
      _43_ = true
    end
  end
  if _43_ then
    return highlight_24_3c_vimscript(opts)
  else
    return highlight_24_3c_api(opts)
  end
end
_2amodule_2a["highlight$"] = highlight_24
return _2amodule_2a