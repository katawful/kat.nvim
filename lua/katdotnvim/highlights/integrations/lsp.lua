local _2afile_2a = "fnl/katdotnvim/highlights/integrations/lsp.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.integrations.lsp"
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
local colors, groups, run, syntax, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.utils.highlight.run"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["run"] = run
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local function high_colors()
  return {{group = "LspReferenceText", fg = "SKIP", bg = colors.kat.pink.base.color, ctermfg = "SKIP", ctermbg = groups.fillBG()[2]}, {group = "LspReferenceRead", fg = "SKIP", bg = colors.kat.pink.base.color, ctermfg = "SKIP", ctermbg = groups.fillBG()[2]}, {group = "LspReferenceWrite", fg = "SKIP", bg = colors.kat.pink.base.color, ctermfg = "SKIP", ctermbg = groups.fillBG()[2]}, {group = "LspCodeLens", fg = colors.kat.bg.meld.color, bg = "SKIP", ctermfg = groups.umbraBG()[2], ctermbg = "SKIP"}, {group = "LspSignatureActiveParameter", fg = colors.kat.blue.base.color, bg = "SKIP", ctermfg = groups.selectionBG()[2], ctermbg = "SKIP"}, {group = "DiagnosticError", fg = colors.kat.red.base.color, bg = "SKIP", ctermfg = groups.errorBG()[2], ctermbg = "SKIP"}, {group = "DiagnosticWarn", fg = colors.kat.red.match_bg.color, bg = "SKIP", ctermfg = groups.warningBG()[2], ctermbg = "SKIP"}, {group = "DiagnosticInfo", fg = colors.kat.orange.base.color, bg = "SKIP", ctermfg = groups.infoBG()[2], ctermbg = "SKIP"}, {group = "DiagnosticHint", fg = colors.kat.orange.base.color, bg = "SKIP", ctermfg = groups.infoBG()[2], ctermbg = "SKIP"}, {group = "DiagnosticVirtualTextError", fg = colors.kat.red.base.color, bg = colors.kat.bg.umbra.color, ctermfg = groups.errorBG()[2], ctermbg = groups.umbraBG()[2]}, {group = "DiagnosticVirtualTextWarn", fg = colors.kat.red.match_bg.color, bg = colors.kat.bg.umbra.color, ctermfg = groups.warningBG()[2], ctermbg = groups.umbraBG()[2]}, {group = "DiagnosticVirtualTextInfo", fg = colors.kat.orange.base.color, bg = colors.kat.bg.umbra.color, ctermfg = groups.infoBG()[2], ctermbg = groups.umbraBG()[2]}, {group = "DiagnosticVirtualTextHint", fg = colors.kat.green.auto.color, bg = colors.kat.bg.umbra.color, ctermfg = groups.auxBG()[2], ctermbg = groups.umbraBG()[2]}, {group = "DiagnosticFloatingError", fg = colors.kat.red.base.color, bg = colors.kat.bg.shadow.color, ctermfg = groups.errorBG()[2], ctermbg = groups.umbraBG()[2]}, {group = "DiagnosticFloatingWarn", fg = colors.kat.red.match_bg.color, bg = colors.kat.bg.shadow.color, ctermfg = groups.warningBG()[2], ctermbg = groups.umbraBG()[2]}, {group = "DiagnosticFloatingInfo", fg = colors.kat.orange.base.color, bg = colors.kat.bg.shadow.color, ctermfg = groups.infoBG()[2], ctermbg = groups.umbraBG()[2]}, {group = "DiagnosticFloatingHint", fg = colors.kat.green.auto.color, bg = colors.kat.bg.shadow.color, ctermfg = groups.auxBG()[2], ctermbg = groups.umbraBG()[2]}, {group = "DiagnosticSignError", fg = colors.kat.red.base.color, bg = "SKIP", ctermfg = groups.errorBG()[2], ctermbg = "SKIP", bold = true}, {group = "DiagnosticSignWarn", fg = colors.kat.red.match_bg.color, bg = "SKIP", ctermfg = groups.warningBG()[2], ctermbg = "SKIP", bold = true}, {group = "DiagnosticSignInfo", fg = colors.kat.orange.base.color, bg = "SKIP", ctermfg = groups.infoBG()[2], ctermbg = "SKIP", bold = true}, {group = "DiagnosticSignHint", fg = colors.kat.green.auto.color, bg = "SKIP", ctermfg = groups.auxBG()[2], ctermbg = "SKIP", bold = true}, {group = "DiagnosticUnderlineError", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", underline = true, sp = colors.kat.red.base.color}, {group = "DiagnosticUnderlineWarn", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", underline = true, sp = colors.kat.red.match_bg.color}, {group = "DiagnosticUnderlineInfo", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", underline = true, sp = colors.kat.orange.base.color}, {group = "DiagnosticUnderlineHint", fg = "SKIP", bg = "SKIP", ctermfg = "SKIP", ctermbg = "NONE", underline = true, sp = colors.kat.green.auto.color}}
end
_2amodule_2a["high-colors"] = high_colors
local function init()
  return run["highlight$<-table"](high_colors())
end
_2amodule_2a["init"] = init
return _2amodule_2a