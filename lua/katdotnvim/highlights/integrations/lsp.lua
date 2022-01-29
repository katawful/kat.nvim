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
local colors, groups, syntax, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local function init()
  ucolors.highlight("LspReferenceText", "SKIP", groups.fillBG()[1], "SKIP", groups.fillBG()[2])
  ucolors.highlight("LspReferenceRead", "SKIP", groups.fillBG()[1], "SKIP", groups.fillBG()[2])
  ucolors.highlight("LspReferenceWrite", "SKIP", groups.fillBG()[1], "SKIP", groups.fillBG()[2])
  ucolors.highlight("LspCodeLens", groups.meldBG()[1], "SKIP", groups.umbraBG()[2], "SKIP")
  ucolors.highlight("LspSignatureActiveParameter", groups.selectionBG()[1], "SKIP", groups.selectionBG()[2], "SKIP")
  if (vim.fn.has("nvim-0.6.0") == 0) then
    ucolors.highlight("LspDiagnosticsDefaultError", groups.errorBG()[1], "SKIP", groups.errorBG()[2], "SKIP")
    ucolors.highlight("LspDiagnosticsDefaultWarning", groups.warningBG()[1], "SKIP", groups.warningBG()[2], "SKIP")
    ucolors.highlight("LspDiagnosticsDefaultInformation", groups.infoBG()[1], "SKIP", groups.infoBG()[2], "SKIP")
    ucolors.highlight("LspDiagnosticsDefaultHint", groups.auxBG()[1], "SKIP", groups.auxBG()[2], "SKIP")
    ucolors.highlight("LspDiagnosticsError", groups.errorBG()[1], "SKIP", groups.errorBG()[2], "SKIP")
    ucolors.highlight("LspDiagnosticsWarn", groups.errorBG()[1], "SKIP", groups.errorBG()[2], "SKIP")
    ucolors.highlight("LspDiagnosticsInfo", groups.errorBG()[1], "SKIP", groups.errorBG()[2], "SKIP")
    ucolors.highlight("LspDiagnosticsHint", groups.auxBG()[1], "SKIP", groups.auxBG()[2], "SKIP")
    ucolors.highlight("LspDiagnosticsVirtualTextError", groups.errorBG()[1], groups.shadowBG()[1], groups.errorBG()[2], groups.umbraBG()[2])
    ucolors.highlight("LspDiagnosticsVirtualTextWarning", groups.warningBG()[1], groups.shadowBG()[1], groups.warningBG()[2], groups.umbraBG()[2])
    ucolors.highlight("LspDiagnosticsVirtualTextInformation", groups.infoBG()[1], groups.shadowBG()[1], groups.infoBG()[2], groups.umbraBG()[2])
    ucolors.highlight("LspDiagnosticsVirtualTextHint", groups.auxBG()[1], groups.shadowBG()[1], groups.auxBG()[2], groups.umbraBG()[2])
    ucolors.highlight("LspDiagnosticsFloatingError", groups.errorBG()[1], groups.umbraBG()[1], groups.errorBG()[2], groups.umbraBG()[2])
    ucolors.highlight("LspDiagnosticsFloatingWarning", groups.warningBG()[1], groups.umbraBG()[1], groups.warningBG()[2], groups.umbraBG()[2])
    ucolors.highlight("LspDiagnosticsFloatingInformation", groups.infoBG()[1], groups.umbraBG()[1], groups.infoBG()[2], groups.umbraBG()[2])
    ucolors.highlight("LspDiagnosticsFloatingHint", groups.auxBG()[1], groups.umbraBG()[1], groups.auxBG()[2], groups.umbraBG()[2])
    ucolors.highlight("LspDiagnosticsSignError", groups.errorBG()[1], "SKIP", groups.errorBG()[2], "SKIP", "bold")
    ucolors.highlight("LspDiagnosticsSignWarning", groups.warningBG()[1], "SKIP", groups.warningBG()[2], "SKIP", "bold")
    ucolors.highlight("LspDiagnosticsSignInformation", groups.infoBG()[1], "SKIP", groups.infoBG()[2], "SKIP", "bold")
    ucolors.highlight("LspDiagnosticsSignHint", groups.auxBG()[1], "SKIP", groups.auxBG()[2], "SKIP", "bold")
    ucolors.highlight("LspDiagnosticsUnderlineError", groups.errorBG()[1], "SKIP", groups.errorBG()[2], "SKIP", "underline", groups.errorBG()[1])
    ucolors.highlight("LspDiagnosticsUnderlineWarning", groups.warningBG()[1], "SKIP", groups.warningBG()[2], "SKIP", "underline", groups.warningBG()[1])
    ucolors.highlight("LspDiagnosticsUnderlineInformation", groups.infoBG()[1], "SKIP", groups.infoBG()[2], "SKIP", "underline", groups.infoBG()[1])
    return ucolors.highlight("LspDiagnosticsUnderlineHint", groups.auxBG()[1], "SKIP", groups.auxBG()[2], "SKIP", "underline", groups.auxBG()[1])
  else
    ucolors.highlight("DiagnosticError", groups.errorBG()[1], "SKIP", groups.errorBG()[2], "SKIP")
    ucolors.highlight("DiagnosticWarn", groups.warningBG()[1], "SKIP", groups.warningBG()[2], "SKIP")
    ucolors.highlight("DiagnosticInfo", groups.infoBG()[1], "SKIP", groups.infoBG()[2], "SKIP")
    ucolors.highlight("DiagnosticHint", groups.infoBG()[1], "SKIP", groups.infoBG()[2], "SKIP")
    ucolors.highlight("DiagnosticVirtualTextError", groups.errorBG()[1], groups.umbraBG()[1], groups.errorBG()[2], groups.umbraBG()[2])
    ucolors.highlight("DiagnosticVirtualTextWarn", groups.warningBG()[1], groups.umbraBG()[1], groups.warningBG()[2], groups.umbraBG()[2])
    ucolors.highlight("DiagnosticVirtualTextInfo", groups.infoBG()[1], groups.umbraBG()[1], groups.infoBG()[2], groups.umbraBG()[2])
    ucolors.highlight("DiagnosticVirtualTextHint", groups.auxBG()[1], groups.umbraBG()[1], groups.auxBG()[2], groups.umbraBG()[2])
    ucolors.highlight("DiagnosticFloatingError", groups.errorBG()[1], groups.shadowBG()[1], groups.errorBG()[2], groups.umbraBG()[2])
    ucolors.highlight("DiagnosticFloatingWarn", groups.warningBG()[1], groups.shadowBG()[1], groups.warningBG()[2], groups.umbraBG()[2])
    ucolors.highlight("DiagnosticFloatingInfo", groups.infoBG()[1], groups.shadowBG()[1], groups.infoBG()[2], groups.umbraBG()[2])
    ucolors.highlight("DiagnosticFloatingHint", groups.auxBG()[1], groups.shadowBG()[1], groups.auxBG()[2], groups.umbraBG()[2])
    ucolors.highlight("DiagnosticSignError", groups.errorBG()[1], "SKIP", groups.errorBG()[2], "SKIP", "bold")
    ucolors.highlight("DiagnosticSignWarn", groups.warningBG()[1], "SKIP", groups.warningBG()[2], "SKIP", "bold")
    ucolors.highlight("DiagnosticSignInfo", groups.infoBG()[1], "SKIP", groups.infoBG()[2], "SKIP", "bold")
    ucolors.highlight("DiagnosticSignHint", groups.auxBG()[1], "SKIP", groups.auxBG()[2], "SKIP", "bold")
    ucolors.highlight("DiagnosticUnderlineError", "SKIP", "SKIP", "SKIP", "NONE", "underline", groups.errorBG()[1])
    ucolors.highlight("DiagnosticUnderlineWarn", "SKIP", "SKIP", "SKIP", "NONE", "underline", groups.warningBG()[1])
    ucolors.highlight("DiagnosticUnderlineInfo", "SKIP", "SKIP", "SKIP", "NONE", "underline", groups.infoBG()[1])
    return ucolors.highlight("DiagnosticUnderlineHint", "SKIP", "SKIP", "SKIP", "NONE", "underline", groups.auxBG()[1])
  end
end
_2amodule_2a["init"] = init