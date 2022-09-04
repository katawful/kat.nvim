local _2afile_2a = "fnl/katdotnvim/utils/export/konsole.fnl"
local _2amodule_name_2a = "katdotnvim.utils.export.konsole"
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
local a, colors, errors, export, groups, hsl, main, ucolors = autoload("katdotnvim.aniseed.core"), autoload("katdotnvim.color"), autoload("katdotnvim.utils.errors"), autoload("katdotnvim.utils.export.init"), autoload("katdotnvim.highlights.main"), autoload("externals.hsluv"), autoload("katdotnvim.main"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["colors"] = colors
_2amodule_locals_2a["errors"] = errors
_2amodule_locals_2a["export"] = export
_2amodule_locals_2a["groups"] = groups
_2amodule_locals_2a["hsl"] = hsl
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["ucolors"] = ucolors
local loop = vim.loop
_2amodule_locals_2a["loop"] = loop
local function gen_colors()
  local output = {["[Background]"] = ("Color=" .. export["hex->rgb-string"](groups.mainBG()[1])), ["[BackgroundFaint]"] = ("Color=" .. export["hex->rgb-string"](groups.meldBG()[1])), ["[BackgroundIntense]"] = ("Color=" .. export["hex->rgb-string"](groups.umbraBG()[1])), ["[Foreground]"] = ("Color=" .. export["hex->rgb-string"](groups.mainFG()[1])), ["[ForegroundFaint]"] = ("Color=" .. export["hex->rgb-string"](groups.meldFG()[1])), ["[ForegroundIntense]"] = ("Color=" .. export["hex->rgb-string"](groups.umbraFG()[1])), ["[Color0]"] = ("Color=" .. export["hex->rgb-string"](colors.background()[1])), ["[Color1]"] = ("Color=" .. export["hex->rgb-string"]((colors["normal-colors"]()).red)), ["[Color2]"] = ("Color=" .. export["hex->rgb-string"]((colors["normal-colors"]()).green)), ["[Color3]"] = ("Color=" .. export["hex->rgb-string"]((colors["normal-colors"]()).orange)), ["[Color4]"] = ("Color=" .. export["hex->rgb-string"]((colors["normal-colors"]()).blue)), ["[Color5]"] = ("Color=" .. export["hex->rgb-string"]((colors["normal-colors"]()).pink)), ["[Color6]"] = ("Color=" .. export["hex->rgb-string"]((colors["normal-colors"]()).purple)), ["[Color7]"] = ("Color=" .. export["hex->rgb-string"](groups.mainFG()[1])), ["[Color8]"] = ("Color=" .. export["hex->rgb-string"](colors.background()[2])), ["[Color15]"] = ("Color=" .. export["hex->rgb-string"](colors.foreground()[2])), ["[General]"] = string.format("Blur=false\nColorRandomization=false\nDescription=%s\nOpacity=1\nWallpaper=", (tostring(vim.g.colors_name) .. "-" .. tostring(main.background)))}
  if (main.background == "light") then
    output["[Color0Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken(colors.background()[1], 0.2)))
    do end (output)["[Color1Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).red, 0.2)))
    do end (output)["[Color2Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).green, 0.2)))
    do end (output)["[Color3Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).orange, 0.2)))
    do end (output)["[Color4Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).blue, 0.2)))
    do end (output)["[Color5Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).pink, 0.2)))
    do end (output)["[Color6Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).purple, 0.2)))
    do end (output)["[Color7Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten(colors.foreground()[1], 0.2)))
    do end (output)["[Color8Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken(colors.background()[2], 0.2)))
    do end (output)["[Color9Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).red, 0.2)))
    do end (output)["[Color10Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).green, 0.2)))
    do end (output)["[Color11Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).orange, 0.2)))
    do end (output)["[Color12Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).blue, 0.2)))
    do end (output)["[Color13Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).pink, 0.2)))
    do end (output)["[Color14Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).purple, 0.2)))
    do end (output)["[Color15Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten(colors.foreground()[2], 0.2)))
    do end (output)["[Color0Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten(colors.background()[1], 0.2)))
    do end (output)["[Color1Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).red, 0.2)))
    do end (output)["[Color2Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).green, 0.2)))
    do end (output)["[Color3Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).orange, 0.2)))
    do end (output)["[Color4Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).blue, 0.2)))
    do end (output)["[Color5Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).pink, 0.2)))
    do end (output)["[Color6Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).purple, 0.2)))
    do end (output)["[Color7Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken(colors.foreground()[1], 0.2)))
    do end (output)["[Color8Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten(colors.background()[2], 0.2)))
    do end (output)["[Color9Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).red, 0.2)))
    do end (output)["[Color10Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).green, 0.2)))
    do end (output)["[Color11Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).orange, 0.2)))
    do end (output)["[Color12Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).blue, 0.2)))
    do end (output)["[Color13Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).pink, 0.2)))
    do end (output)["[Color14Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).purple, 0.2)))
    do end (output)["[Color15Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken(colors.foreground()[2], 0.2)))
    do end (output)["[Color9]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).red, 0.2)))
    do end (output)["[Color10]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).green, 0.2)))
    do end (output)["[Color11]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).orange, 0.2)))
    do end (output)["[Color12]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).blue, 0.2)))
    do end (output)["[Color13]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).pink, 0.2)))
    do end (output)["[Color14]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).purple, 0.2)))
  else
    output["[Color0Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten(colors.background()[1], 0.2)))
    do end (output)["[Color1Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).red, 0.2)))
    do end (output)["[Color2Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).green, 0.2)))
    do end (output)["[Color3Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).orange, 0.2)))
    do end (output)["[Color4Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).blue, 0.2)))
    do end (output)["[Color5Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).pink, 0.2)))
    do end (output)["[Color6Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).purple, 0.2)))
    do end (output)["[Color7Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken(colors.foreground()[1], 0.2)))
    do end (output)["[Color8Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten(colors.background()[2], 0.2)))
    do end (output)["[Color9Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).red, 0.2)))
    do end (output)["[Color10Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).green, 0.2)))
    do end (output)["[Color11Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).orange, 0.2)))
    do end (output)["[Color12Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).blue, 0.2)))
    do end (output)["[Color13Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).pink, 0.2)))
    do end (output)["[Color14Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken((colors["normal-colors"]()).purple, 0.2)))
    do end (output)["[Color15Faint]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken(colors.foreground()[2], 0.2)))
    do end (output)["[Color0Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken(colors.background()[1], 0.2)))
    do end (output)["[Color1Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).red, 0.2)))
    do end (output)["[Color2Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).green, 0.2)))
    do end (output)["[Color3Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).orange, 0.2)))
    do end (output)["[Color4Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).blue, 0.2)))
    do end (output)["[Color5Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).pink, 0.2)))
    do end (output)["[Color6Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).purple, 0.2)))
    do end (output)["[Color7Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten(colors.foreground()[1], 0.2)))
    do end (output)["[Color8Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.darken(colors.background()[2], 0.2)))
    do end (output)["[Color9Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).red, 0.2)))
    do end (output)["[Color10Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).green, 0.2)))
    do end (output)["[Color11Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).orange, 0.2)))
    do end (output)["[Color12Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).blue, 0.2)))
    do end (output)["[Color13Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).pink, 0.2)))
    do end (output)["[Color14Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).purple, 0.2)))
    do end (output)["[Color15Intense]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten(colors.foreground()[2], 0.2)))
    do end (output)["[Color9]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).red, 0.2)))
    do end (output)["[Color10]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).green, 0.2)))
    do end (output)["[Color11]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).orange, 0.2)))
    do end (output)["[Color12]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).blue, 0.2)))
    do end (output)["[Color13]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).pink, 0.2)))
    do end (output)["[Color14]"] = ("Color=" .. export["hex->rgb-string"](ucolors.brighten((colors["normal-colors"]()).purple, 0.2)))
  end
  return output
end
_2amodule_2a["gen-colors"] = gen_colors
local function output_21()
  local file_name = string.format("konsole-%s-%s.colorscheme", tostring(vim.g.colors_name), tostring(main.background))
  local fd = assert(loop.fs_open(file_name, "w", 0))
  assert(loop.fs_chmod(file_name, 420))
  assert(loop.fs_write(fd, export["string->two-line-color*"](gen_colors(), "konsole"), 0))
  export["notify$"]("konsole")
  return assert(loop.fs_close(fd))
end
_2amodule_2a["output!"] = output_21
return _2amodule_2a