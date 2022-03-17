local _2afile_2a = "fnl/katdotnvim/highlights/filetype/vimwiki.fnl"
local _2amodule_name_2a = "katdotnvim.highlights.filetype.vimwiki"
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
  ucolors.highlight("VimwikiMarkers", (colors.init("background"))[5], "SKIP", groups.mainFG()[2], "SKIP")
  ucolors.highlight("VimwikiLink", groups.infoBG()[1], "SKIP", groups.infoBG()[2], "SKIP", "underline,bold", groups.infoBG()[1])
  ucolors.highlight("VimwikiList", groups.selectionBG()[1], "SKIP", groups.selectionBG()[2], "SKIP", "bold")
  ucolors.highlight("VimwikiCheckBoxDone", groups.auxBG()[1], "SKIP", groups.auxBG()[2], "SKIP", "bold")
  ucolors.highlight("VimwikiTag", groups.errorBG()[1], "SKIP", groups.errorBG()[2], "SKIP", "Bold")
  ucolors.highlight("VimwikiDelText", groups.fillBG()[1], "SKIP", groups.fillBG()[2], "SKIP", "strikethrough")
  ucolors.highlight("VimwikiCode", groups.meldFG()[1], groups.shadowBG()[1], groups.umbraFG()[2], groups.umbraBG()[2])
  ucolors.highlight("VimwikiHeader1", ucolors.darken((colors.init("normalColors")).blue, 0), "SKIP", 4, "SKIP", "bold")
  ucolors.highlight("VimwikiHeader2", ucolors.darken((colors.init("normalColors")).blue, 0.3), "SKIP", 12, "SKIP", "bold")
  ucolors.highlight("VimwikiHeader3", ucolors.darken((colors.init("normalColors")).orange, 0), "SKIP", 3, "SKIP", "bold")
  ucolors.highlight("VimwikiHeader4", ucolors.darken((colors.init("normalColors")).orange, 0.3), "SKIP", 11, "SKIP", "bold")
  ucolors.highlight("VimwikiHeader5", ucolors.darken((colors.init("normalColors")).pink, 0), "SKIP", 5, "SKIP", "bold")
  return ucolors.highlight("VimwikiHeader6", ucolors.darken((colors.init("normalColors")).pink, 0.3), "SKIP", 13, "SKIP", "bold")
end
_2amodule_2a["init"] = init
return _2amodule_2a