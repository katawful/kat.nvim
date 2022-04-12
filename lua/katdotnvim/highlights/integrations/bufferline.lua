local _2afile_2a = "fnl/katdotnvim/highlights/integrations/bufferline.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.integrations.bufferline"
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
local colors, groups, main, syntax, ucolors = autoload("katdotnvim.color"), autoload("katdotnvim.highlights.main"), autoload("katdotnvim.main"), autoload("katdotnvim.highlights.syntax"), autoload("katdotnvim.utils.color")
do end (_2amodule_locals_2a)["colors"] = colors
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["syntax"] = syntax
_2amodule_locals_2a["ucolors"] = ucolors
local function tabFG()
  local output = ""
  if ((vim.o.background == "dark") and (main.katContrast == "soft")) then
    output = ucolors.brighten(groups.mainFG()[1], 0.8)
  else
    output = groups.mainFG()[1]
  end
  return output
end
_2amodule_2a["tabFG"] = tabFG
local function init()
  return (require("bufferline")).setup({highlights = {fill = {guifg = groups.fillBG()[1], guibg = groups.fillBG()[1]}, tab = {guifg = tabFG(), guibg = groups.highlightBG()[1]}, tab_selected = {guifg = tabFG(), guibg = groups.selectionBG()[1]}, tab_close = {guifg = tabFG(), guibg = groups.highlightBG()[1], gui = "bold,italic"}, info = {guifg = tabFG(), guibg = groups.selectionBG()[1]}, buffer_visible = {guifg = tabFG(), guibg = ucolors.blend(groups.selectionBG()[1], groups.mainBG()[1], 0.8)}, buffer_selected = {guifg = tabFG(), guibg = groups.selectionBG()[1], gui = "bold,italic"}, close_button = {guifg = tabFG(), guibg = groups.highlightBG()[1], gui = "bold"}, close_button_visible = {guifg = tabFG(), guibg = ucolors.blend(groups.selectionBG()[1], groups.mainBG()[1], 0.8), gui = "bold"}, close_button_selected = {guifg = tabFG(), guibg = groups.selectionBG()[1], gui = "bold"}, modified = {guifg = groups.warningBG()[1], guibg = groups.highlightBG()[1]}, modified_visible = {guifg = groups.warningBG()[1], guibg = ucolors.blend(groups.selectionBG()[1], groups.mainBG()[1], 0.8)}, modified_selected = {guifg = groups.warningBG()[1], guibg = groups.selectionBG()[1]}, duplicate_selected = {guifg = tabFG(), guibg = groups.selectionBG()[1]}, duplicate_visible = {guifg = tabFG(), guibg = ucolors.blend(groups.selectionBG()[1], groups.mainBG()[1], 0.8)}, duplicate = {guifg = tabFG(), guibg = groups.highlightBG()[1]}, separator_selected = {guifg = groups.fillBG()[1], guibg = groups.selectionBG()[1]}, separator_visible = {guifg = groups.fillBG()[1], guibg = ucolors.blend(groups.selectionBG()[1], groups.mainBG()[1], 0.8)}, separator = {guifg = groups.fillBG()[1], guibg = groups.highlightBG()[1]}, indicator_selected = {guifg = tabFG(), guibg = groups.selectionBG()[1]}, pick_selected = {guifg = tabFG(), guibg = groups.selectionBG()[1]}, pick_visible = {guifg = tabFG(), guibg = groups.selectionBG()[1]}, pick = {guifg = tabFG(), guibg = groups.selectionBG()[1]}, background = {guifg = tabFG(), guibg = groups.highlightBG()[1]}}})
end
_2amodule_2a["init"] = init
return _2amodule_2a