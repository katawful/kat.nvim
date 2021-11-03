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
  ucolors.highlight("LspReferenceText", "SKIP", groups.fillBG())
  ucolors.highlight("LspReferenceRead", "SKIP", groups.fillBG())
  ucolors.highlight("LspReferenceWrite", "SKIP", groups.fillBG())
  ucolors.highlight("DiagnosticError", groups.errorBG(), "SKIP")
  ucolors.highlight("DiagnosticWarn", groups.warningBG(), "SKIP")
  ucolors.highlight("DiagnosticInfo", groups.infoBG(), "SKIP")
  ucolors.highlight("DiagnosticHint", groups.auxBG(), "SKIP")
  ucolors.highlight("LspDiagnosticsDefaultError", groups.errorBG(), "SKIP")
  ucolors.highlight("LspDiagnosticsDefaultWarning", groups.warningBG(), "SKIP")
  ucolors.highlight("LspDiagnosticsDefaultInformation", groups.infoBG(), "SKIP")
  ucolors.highlight("LspDiagnosticsDefaultHint", groups.auxBG(), "SKIP")
  ucolors.highlight("LspSignatureActiveParameter", groups.selectionBG(), "SKIP")
  ucolors.highlight("LspDiagnosticsError", groups.errorBG(), "SKIP")
  ucolors.highlight("LspDiagnosticsWarn", groups.warningBG(), "SKIP")
  ucolors.highlight("LspDiagnosticsInfo", groups.infoBG(), "SKIP")
  ucolors.highlight("LspDiagnosticsHint", groups.auxBG(), "SKIP")
  ucolors.highlight("LspDiagnosticsVirtualTextError", groups.errorBG(), groups.shadowBG())
  ucolors.highlight("LspDiagnosticsVirtualTextWarning", groups.warningBG(), groups.shadowBG())
  ucolors.highlight("LspDiagnosticsVirtualTextInformation", groups.infoBG(), groups.shadowBG())
  ucolors.highlight("LspDiagnosticsVirtualTextHint", groups.auxBG(), groups.shadowBG())
  ucolors.highlight("LspDiagnosticsFloatingError", groups.errorBG(), groups.umbraBG())
  ucolors.highlight("LspDiagnosticsFloatingWarning", groups.warningBG(), groups.umbraBG())
  ucolors.highlight("LspDiagnosticsFloatingInformation", groups.infoBG(), groups.umbraBG())
  ucolors.highlight("LspDiagnosticsFloatingHint", groups.auxBG(), groups.umbraBG())
  ucolors.highlight("LspDiagnosticsSignError", groups.errorBG(), "SKIP")
  ucolors.highlight("LspDiagnosticsSignWarning", groups.warningBG(), "SKIP")
  ucolors.highlight("LspDiagnosticsSignInformation", groups.infoBG(), "SKIP")
  ucolors.highlight("LspDiagnosticsSignHint", groups.auxBG(), "SKIP")
  ucolors.highlight("LspDiagnosticsUnderlineError", groups.errorBG(), "SKIP", "underline", groups.errorBG())
  ucolors.highlight("LspDiagnosticsUnderlineWarning", groups.warningBG(), "SKIP", "underline", groups.warningBG())
  ucolors.highlight("LspDiagnosticsUnderlineInformation", groups.infoBG(), "SKIP", "underline", groups.infoBG())
  ucolors.highlight("LspDiagnosticsUnderlineHint", groups.auxBG(), "SKIP", "underline", groups.auxBG())
  return ucolors.highlight("LspCodeLens", groups.meldBG(), "SKIP")
end
_2amodule_2a["init"] = init