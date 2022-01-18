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
    output = ucolors.brighten(groups.mainFG(), 0.8)
  else
    output = groups.mainFG()
  end
  return output
end
_2amodule_2a["tabFG"] = tabFG
local function init()
  return (require("bufferline")).setup({highlights = {fill = {guifg = groups.fillBG(), guibg = groups.fillBG()}, tab = {guifg = tabFG(), guibg = groups.highlightBG()}, tab_selected = {guifg = tabFG(), guibg = groups.selectionBG()}, tab_close = {guifg = tabFG(), guibg = groups.highlightBG(), gui = "bold,italic"}, info = {guifg = tabFG(), guibg = groups.selectionBG()}, buffer_visible = {guifg = tabFG(), guibg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8)}, buffer_selected = {guifg = tabFG(), guibg = groups.selectionBG(), gui = "bold,italic"}, close_button = {guifg = tabFG(), guibg = groups.highlightBG(), gui = "bold"}, close_button_visible = {guifg = tabFG(), guibg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8), gui = "bold"}, close_button_selected = {guifg = tabFG(), guibg = groups.selectionBG(), gui = "bold"}, modified = {guifg = groups.warningBG(), guibg = groups.highlightBG()}, modified_visible = {guifg = groups.warningBG(), guibg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8)}, modified_selected = {guifg = groups.warningBG(), guibg = groups.selectionBG()}, duplicate_selected = {guifg = tabFG(), guibg = groups.selectionBG()}, duplicate_visible = {guifg = tabFG(), guibg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8)}, duplicate = {guifg = tabFG(), guibg = groups.highlightBG()}, separator_selected = {guifg = groups.fillBG(), guibg = groups.selectionBG()}, separator_visible = {guifg = groups.fillBG(), guibg = ucolors.blendColors(groups.selectionBG(), groups.mainBG(), 0.8)}, separator = {guifg = groups.fillBG(), guibg = groups.highlightBG()}, indicator_selected = {guifg = tabFG(), guibg = groups.selectionBG()}, pick_selected = {guifg = tabFG(), guibg = groups.selectionBG()}, pick_visible = {guifg = tabFG(), guibg = groups.selectionBG()}, pick = {guifg = tabFG(), guibg = groups.selectionBG()}, background = {guifg = tabFG(), guibg = groups.highlightBG()}}})
end
_2amodule_2a["init"] = init