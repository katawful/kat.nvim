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
local a, colors, get, hsl, s, _ = autoload("katdotnvim.aniseed.core"), autoload("katdotnvim.color"), autoload("katdotnvim.utils.highlight.get"), autoload("externals.hsluv"), autoload("katdotnvim.aniseed.string"), nil
_2amodule_locals_2a["a"] = a
_2amodule_locals_2a["colors"] = colors
_2amodule_locals_2a["get"] = get
_2amodule_locals_2a["hsl"] = hsl
_2amodule_locals_2a["s"] = s
_2amodule_locals_2a["_"] = _
local function highlight_24_3c_vimscript(opts)
  if get.link(opts) then
    local group = get.group(opts)
    local link = get.link(opts)
    return vim.cmd(string.format("hi def link %s %s", group, link))
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
    local args = {fg = gui_fore, bg = gui_back, ctermfg = c_fore, ctermbg = c_back, special = get.special(opts), default = get.default(opts), blend = get.blend(opts)}
    for k, v in pairs(get["all-attr->table"](opts)) do
      args[k] = v
    end
    if args.default then
      print(vim.inspect(args))
    else
    end
    return vim.api.nvim_set_hl(0, group, args)
  end
end
_2amodule_locals_2a["highlight$<-api"] = highlight_24_3c_api
local function highlight_24(opts)
  if (vim.fn.has("nvim-0.7") == 0) then
    return highlight_24_3c_vimscript(opts)
  else
    return highlight_24_3c_api(opts)
  end
end
_2amodule_2a["highlight$"] = highlight_24
return _2amodule_2a