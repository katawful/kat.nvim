local _2afile_2a = "fnl/katdotnvim/exported/integrations/lsp-light-soft.fnl"
local _2amodule_name_2a = "katdotnvim.exported.integrations.lsp-light-soft"
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
local autoload = (require("aniseed.autoload")).autoload
local run = autoload("katdotnvim.utils.highlight.run")
do end (_2amodule_locals_2a)["run"] = run
local function render()
  local function _1_()
    if (vim.g.kat_nvim_max_version == "0.6") then
      return {bg = "#f29cb1", ctermbg = 5, ctermfg = "SKIP", fg = "SKIP", group = "LspReferenceText"}, {bg = "#f29cb1", ctermbg = 5, ctermfg = "SKIP", fg = "SKIP", group = "LspReferenceRead"}, {bg = "#f29cb1", ctermbg = 5, ctermfg = "SKIP", fg = "SKIP", group = "LspReferenceWrite"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 8, fg = "#537680", group = "LspCodeLens"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 4, fg = "#2dacd2", group = "LspSignatureActiveParameter"}, {{bg = "SKIP", ctermbg = "SKIP", ctermfg = 1, fg = "#eb4949", group = "LspDiagnosticsDefaultError"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 9, fg = "#d9757a", group = "LspDiagnosticsDefaultWarning"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 3, fg = "#f2b15c", group = "LspDiagnosticsDefaultInformation"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 2, fg = "#006c4f", group = "LspDiagnosticsDefaultHint"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 1, fg = "#eb4949", group = "LspDiagnosticsError"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 1, fg = "#eb4949", group = "LspDiagnosticsWarn"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 1, fg = "#eb4949", group = "LspDiagnosticsInfo"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 2, fg = "#006c4f", group = "LspDiagnosticsHint"}, {bg = "#78aab8", ctermbg = 8, ctermfg = 1, fg = "#eb4949", group = "LspDiagnosticsVirtualTextError"}, {bg = "#78aab8", ctermbg = 8, ctermfg = 9, fg = "#d9757a", group = "LspDiagnosticsVirtualTextWarning"}, {bg = "#78aab8", ctermbg = 8, ctermfg = 3, fg = "#f2b15c", group = "LspDiagnosticsVirtualTextInformation"}, {bg = "#78aab8", ctermbg = 8, ctermfg = 2, fg = "#006c4f", group = "LspDiagnosticsVirtualTextHint"}, {bg = "#daf6ff", ctermbg = 8, ctermfg = 1, fg = "#eb4949", group = "LspDiagnosticsFloatingError"}, {bg = "#daf6ff", ctermbg = 8, ctermfg = 9, fg = "#d9757a", group = "LspDiagnosticsFloatingWarning"}, {bg = "#daf6ff", ctermbg = 8, ctermfg = 3, fg = "#f2b15c", group = "LspDiagnosticsFloatingInformation"}, {bg = "#daf6ff", ctermbg = 8, ctermfg = 2, fg = "#006c4f", group = "LspDiagnosticsFloatingHint"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 1, fg = "#eb4949", group = "LspDiagnosticsSignError"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 9, fg = "#d9757a", group = "LspDiagnosticsSignWarning"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 3, fg = "#f2b15c", group = "LspDiagnosticsSignInformation"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 2, fg = "#006c4f", group = "LspDiagnosticsSignHint"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 1, fg = "#eb4949", group = "LspDiagnosticsUnderlineError", sp = "#eb4949", underline = true}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 9, fg = "#d9757a", group = "LspDiagnosticsUnderlineWarning", sp = "#d9757a", underline = true}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 3, fg = "#f2b15c", group = "LspDiagnosticsUnderlineInformation", sp = "#f2b15c", underline = true}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 2, fg = "#006c4f", group = "LspDiagnosticsUnderlineHint", sp = "#006c4f", underline = true}}
    else
      return {bg = "#f29cb1", ctermbg = 5, ctermfg = "SKIP", fg = "SKIP", group = "LspReferenceText"}, {bg = "#f29cb1", ctermbg = 5, ctermfg = "SKIP", fg = "SKIP", group = "LspReferenceRead"}, {bg = "#f29cb1", ctermbg = 5, ctermfg = "SKIP", fg = "SKIP", group = "LspReferenceWrite"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 8, fg = "#537680", group = "LspCodeLens"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 4, fg = "#2dacd2", group = "LspSignatureActiveParameter"}, {{bg = "SKIP", ctermbg = "SKIP", ctermfg = 1, fg = "#eb4949", group = "DiagnosticError"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 9, fg = "#d9757a", group = "DiagnosticWarn"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 3, fg = "#f2b15c", group = "DiagnosticInfo"}, {bg = "SKIP", ctermbg = "SKIP", ctermfg = 3, fg = "#f2b15c", group = "DiagnosticHint"}, {bg = "#daf6ff", ctermbg = 8, ctermfg = 1, fg = "#eb4949", group = "DiagnosticVirtualTextError"}, {bg = "#daf6ff", ctermbg = 8, ctermfg = 9, fg = "#d9757a", group = "DiagnosticVirtualTextWarn"}, {bg = "#daf6ff", ctermbg = 8, ctermfg = 3, fg = "#f2b15c", group = "DiagnosticVirtualTextInfo"}, {bg = "#daf6ff", ctermbg = 8, ctermfg = 2, fg = "#006c4f", group = "DiagnosticVirtualTextHint"}, {bg = "#78aab8", ctermbg = 8, ctermfg = 1, fg = "#eb4949", group = "DiagnosticFloatingError"}, {bg = "#78aab8", ctermbg = 8, ctermfg = 9, fg = "#d9757a", group = "DiagnosticFloatingWarn"}, {bg = "#78aab8", ctermbg = 8, ctermfg = 3, fg = "#f2b15c", group = "DiagnosticFloatingInfo"}, {bg = "#78aab8", ctermbg = 8, ctermfg = 2, fg = "#006c4f", group = "DiagnosticFloatingHint"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 1, fg = "#eb4949", group = "DiagnosticSignError"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 9, fg = "#d9757a", group = "DiagnosticSignWarn"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 3, fg = "#f2b15c", group = "DiagnosticSignInfo"}, {bg = "SKIP", bold = true, ctermbg = "SKIP", ctermfg = 2, fg = "#006c4f", group = "DiagnosticSignHint"}, {bg = "SKIP", ctermbg = "NONE", ctermfg = "SKIP", fg = "SKIP", group = "DiagnosticUnderlineError", sp = "#eb4949", underline = true}, {bg = "SKIP", ctermbg = "NONE", ctermfg = "SKIP", fg = "SKIP", group = "DiagnosticUnderlineWarn", sp = "#d9757a", underline = true}, {bg = "SKIP", ctermbg = "NONE", ctermfg = "SKIP", fg = "SKIP", group = "DiagnosticUnderlineInfo", sp = "#f2b15c", underline = true}, {bg = "SKIP", ctermbg = "NONE", ctermfg = "SKIP", fg = "SKIP", group = "DiagnosticUnderlineHint", sp = "#006c4f", underline = true}}
    end
  end
  return {_1_()}
end
_2amodule_2a["render"] = render
local function init()
  return run["highlight$<-table"](render())
end
_2amodule_2a["init"] = init
return _2amodule_2a