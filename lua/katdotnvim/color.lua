local _2afile_2a = "fnl/katdotnvim/color.fnl"
local _2amodule_name_2a = "katdotnvim.color"
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
local main, read, ucolors, _ = autoload("katdotnvim.main"), autoload("katdotnvim.utils.json.read"), autoload("katdotnvim.utils.highlight.utils"), nil
_2amodule_locals_2a["main"] = main
_2amodule_locals_2a["read"] = read
_2amodule_locals_2a["ucolors"] = ucolors
_2amodule_locals_2a["_"] = _
local light_fore_back = "#daf6ff"
_2amodule_locals_2a["light-fore-back"] = light_fore_back
local dark_fore_back = "#121c2d"
_2amodule_locals_2a["dark-fore-back"] = dark_fore_back
local red_primary = "#eb4949"
_2amodule_locals_2a["red-primary"] = red_primary
local green_primary = "#2ce0aa"
_2amodule_locals_2a["green-primary"] = green_primary
local orange_primary = "#f2b15c"
_2amodule_locals_2a["orange-primary"] = orange_primary
local pink_primary = "#f29cb1"
_2amodule_locals_2a["pink-primary"] = pink_primary
local purple_primary = "#7a53a8"
_2amodule_locals_2a["purple-primary"] = purple_primary
local blue_primary = "#2dacd2"
_2amodule_locals_2a["blue-primary"] = blue_primary
local def_normal_colors = {red = red_primary, green = green_primary, orange = orange_primary, pink = pink_primary, purple = purple_primary, blue = blue_primary}
_2amodule_locals_2a["def-normal-colors"] = def_normal_colors
local function def_back_colors()
  local back
  if ((main["background-mut"])[1] == "dark") then
    if ((main["contrast-mut"])[1] == "soft") then
      back = {ucolors.brighten(dark_fore_back, 0.1), dark_fore_back, ucolors.brighten(dark_fore_back, 0.3), ucolors.brighten(dark_fore_back, 0.5), ucolors.brighten(dark_fore_back, 0.7), ucolors.brighten(dark_fore_back, 0.9)}
    elseif (((main["contrast-mut"])[1] == "hard") or ((main["contrast-mut"])[1] == nil)) then
      back = {dark_fore_back, ucolors.brighten(dark_fore_back, 0.1), ucolors.brighten(dark_fore_back, 0.3), ucolors.brighten(dark_fore_back, 0.5), ucolors.brighten(dark_fore_back, 0.7), ucolors.brighten(dark_fore_back, 0.9)}
    else
      back = nil
    end
  elseif ((main["background-mut"])[1] == "light") then
    if ((main["contrast-mut"])[1] == "soft") then
      back = {ucolors.saturation(ucolors.darken(light_fore_back, 0.1), -0.5), light_fore_back, ucolors.saturation(ucolors.darken(light_fore_back, 0.3), -0.5), ucolors.saturation(ucolors.darken(light_fore_back, 0.5), -0.5), ucolors.saturation(ucolors.darken(light_fore_back, 0.7), -0.5), ucolors.saturation(ucolors.darken(light_fore_back, 0.9), -0.5)}
    elseif (((main["contrast-mut"])[1] == "hard") or ((main["contrast-mut"])[1] == nil)) then
      back = {light_fore_back, ucolors.saturation(ucolors.darken(light_fore_back, 0.1), -0.5), ucolors.saturation(ucolors.darken(light_fore_back, 0.3), -0.5), ucolors.saturation(ucolors.darken(light_fore_back, 0.5), -0.5), ucolors.saturation(ucolors.darken(light_fore_back, 0.7), -0.5), ucolors.saturation(ucolors.darken(light_fore_back, 0.9), -0.5)}
    else
      back = nil
    end
  else
    back = nil
  end
  return back
end
_2amodule_locals_2a["def-back-colors"] = def_back_colors
local function def_fore_colors()
  local fore
  if ((main["background-mut"])[1] == "dark") then
    if ((main["contrast-mut"])[1] == "soft") then
      fore = {ucolors.saturation(ucolors.darken(light_fore_back, 0.1), -0.5), light_fore_back, ucolors.saturation(ucolors.darken(light_fore_back, 0.3), -0.5), ucolors.saturation(ucolors.darken(light_fore_back, 0.5), -0.5), ucolors.saturation(ucolors.darken(light_fore_back, 0.7), -0.5), ucolors.saturation(ucolors.darken(light_fore_back, 0.9), -0.5)}
    elseif (((main["contrast-mut"])[1] == "hard") or ((main["contrast-mut"])[1] == nil)) then
      fore = {light_fore_back, ucolors.saturation(ucolors.darken(light_fore_back, 0.1), -0.5), ucolors.saturation(ucolors.darken(light_fore_back, 0.3), -0.5), ucolors.saturation(ucolors.darken(light_fore_back, 0.5), -0.5), ucolors.saturation(ucolors.darken(light_fore_back, 0.7), -0.5), ucolors.saturation(ucolors.darken(light_fore_back, 0.9), -0.5)}
    else
      fore = nil
    end
  elseif ((main["background-mut"])[1] == "light") then
    if ((main["contrast-mut"])[1] == "soft") then
      fore = {ucolors.brighten(dark_fore_back, 0.1), dark_fore_back, ucolors.brighten(dark_fore_back, 0.3), ucolors.brighten(dark_fore_back, 0.5), ucolors.brighten(dark_fore_back, 0.7), ucolors.brighten(dark_fore_back, 0.9)}
    elseif (((main["contrast-mut"])[1] == "hard") or ((main["contrast-mut"])[1] == nil)) then
      fore = {dark_fore_back, ucolors.brighten(dark_fore_back, 0.1), ucolors.brighten(dark_fore_back, 0.3), ucolors.brighten(dark_fore_back, 0.5), ucolors.brighten(dark_fore_back, 0.7), ucolors.brighten(dark_fore_back, 0.9)}
    else
      fore = nil
    end
  else
    fore = nil
  end
  return fore
end
_2amodule_locals_2a["def-fore-colors"] = def_fore_colors
local kat = {}
local function update()
  local fname = vim.fn.fnamemodify((vim.api.nvim_get_runtime_file("json/colors-kat.n*im-*.json", true))[1], ":h")
  kat = read.colors(fname)
  do end (_2amodule_2a)["kat"] = kat
  return nil
end
_2amodule_2a["update"] = update
local function output()
  local color_2a
  do
    local normal_colors = def_normal_colors
    local foreground = def_fore_colors()
    local background = def_back_colors()
    local output0 = {}
    for k, v in pairs(normal_colors) do
      output0[k] = v
    end
    for i = 1, 6 do
      output0[("f" .. (i - 1))] = foreground[i]
      output0[("b" .. (i - 1))] = background[i]
    end
    color_2a = output0
  end
  local out = {pink = {}, red = {}, blue = {}, green = {}, orange = {}, purple = {}, plum = {}, teal = {}, fg = {}, bg = {}}
  out.pink.base = {desc = "Base color, no changes applied", color = color_2a.pink}
  out.red.base = {desc = "Base color, no changes applied", color = color_2a.red}
  out.blue.base = {desc = "Base color, no changes applied", color = color_2a.blue}
  out.green.base = {desc = "Base color, no changes applied", color = color_2a.green}
  out.purple.base = {desc = "Base color, no changes applied", color = color_2a.purple}
  out.orange.base = {desc = "Base color, no changes applied", color = color_2a.orange}
  out.fg.base = {desc = "Base color, no changes applied", color = color_2a.f0}
  out.bg.base = {desc = "Base color, no changes applied", color = color_2a.b0}
  out.fg.umbra = {desc = "Umbra/second color, lighter shadow variation", color = color_2a.f1}
  out.fg.shadow = {desc = "Shadow/third color, used to contrast base fg", color = color_2a.f2}
  out.fg.meld = {desc = "Meld/fourth, used to blend in with the base fg", color = color_2a.f3}
  out.fg.fifth = {desc = "5th bg color, dark for dark background and bright for light background", color = color_2a.f4}
  out.fg.sixth = {desc = "6th bg color, dark for dark background and bright for light background", color = color_2a.f5}
  local _7_
  if (((main["background-mut"])[1] == "dark") and ((main["contrast-mut"])[1] == "soft")) then
    _7_ = ucolors.brighten(color_2a.f0, 1)
  else
    _7_ = color_2a.f0
  end
  out.fg.auto = {desc = "Auto matching color, used to always maintain bright color regardless of contrast", color = _7_}
  out.bg.umbra = {desc = "Umbra/second color, lighter shadow variation", color = color_2a.b1}
  out.bg.shadow = {desc = "Shadow/third color, used to contrast base bg", color = color_2a.b2}
  out.bg.meld = {desc = "Meld/fourth color, used to blend in with the base fg", color = color_2a.b3}
  out.bg.fifth = {desc = "5th bg color, bright for dark background and dark for light background", color = color_2a.b4}
  out.bg.sixth = {desc = "6th bg color, bright for dark background and dark for light background", color = color_2a.b5}
  local _9_
  if ((main["background-mut"])[1] == "light") then
    _9_ = ucolors.saturation(ucolors.darken(color_2a.green, 0.5), 0.4)
  else
    _9_ = ucolors.saturation(ucolors.brighten(color_2a.green, 0.5), -0.2)
  end
  out.green.auto = {desc = "Auto matching color, used to increase contrast depending on background", color = _9_}
  out.green.match_fg = {desc = "Matches to base fg color", color = ucolors.blend(color_2a.green, color_2a.f0, 0.5)}
  out.green.auto_match_fg = {desc = "Matches to base fg color based on auto matching green", color = ucolors.blend(out.green.auto.color, color_2a.f0, 0.5)}
  out.green.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.green, color_2a.b0, 0.5)}
  out.green.match_bg_less = {desc = "Matches to base bg color less", color = ucolors.blend(color_2a.green, color_2a.b0, 0.7)}
  out.green.mix_blue = {desc = "Mixes in blue", color = ucolors.blend(color_2a.green, color_2a.blue, 0.5)}
  out.green.mix_red = {desc = "Mixes in red", color = ucolors.blend(color_2a.green, color_2a.red, 0.2)}
  out.green.mix_purple = {desc = "Mixes in purple", color = ucolors.saturation(ucolors.blend(color_2a.green, color_2a.purple, 0.3), 0.8)}
  out.blue.mix_orange_match_fg = {desc = "Mixes in orange, then matches to base fg color", color = ucolors.blend(ucolors.blend(color_2a.orange, color_2a.f0, 0.1), color_2a.blue, 0.2)}
  out.blue.darken = {desc = "Darkens color by 20%", color = ucolors.darken(color_2a.blue, 0.2)}
  out.blue.brighten = {desc = "Brighten color by 20%", color = ucolors.brighten(color_2a.blue, 0.2)}
  out.blue.match_fg = {desc = "Matches to base fg color", color = ucolors.blend(color_2a.blue, color_2a.f0, 0.5)}
  out.blue.match_fg_less = {desc = "Matches to base fg color, uses more of the blue", color = ucolors.blend(color_2a.blue, color_2a.f0, 0.7)}
  out.blue.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.blue, color_2a.b0, 0.5)}
  out.blue.mix_shadow_bg = {desc = "Mixes in shadow bg color", color = ucolors.blend(color_2a.blue, color_2a.b2, 0.8)}
  out.blue.mix_shadow_bg_more = {desc = "Mixes in shadow bg color more", color = ucolors.blend(color_2a.blue, color_2a.b2, 0.4)}
  out.blue.mix_meld_bg = {desc = "Mixes in meld bg color", color = ucolors.blend(color_2a.blue, color_2a.b3, 0.8)}
  do
    local teal = ucolors.blend(color_2a.blue, color_2a.b5, 0.65)
    out.teal.base = {desc = "Base color, is a mix of blue and sixth background", color = teal}
    local _11_
    if ((main["background-mut"])[1] == "light") then
      _11_ = ucolors.darken(ucolors.blend(teal, color_2a.f5, 0.5), 0.4)
    else
      _11_ = ucolors.brighten(ucolors.blend(teal, color_2a.f5, 0.5), 0.4)
    end
    out.teal.auto = {desc = "Auto matches based on background", color = _11_}
    out.teal.mix_purple = {desc = "Mixes in purple", color = ucolors.brighten(ucolors.blend(teal, color_2a.purple, 0.2), 0.2)}
    out.teal.mix_red = {desc = "Mixes in red", color = ucolors.blend(teal, color_2a.red, 0.3)}
    out.teal.mix_red_brighten_dull = {desc = "Mixes in red, brightens, not as bright", color = ucolors.saturation(ucolors.brighten(ucolors.blend(teal, color_2a.red, 0.3), 0.1), 0.1)}
    out.teal.mix_red_brighten = {desc = "Mixes in red, brightens, not as bright", color = ucolors.saturation(ucolors.brighten(ucolors.blend(teal, color_2a.red, 0.3), 0.1), 0.5)}
    out.teal.mix_pink = {desc = "Mixes in pink", color = ucolors.blend(teal, color_2a.pink, 0.8)}
    out.teal.mix_pink = {desc = "Mixes in pink", color = ucolors.blend(teal, color_2a.pink, 0.8)}
    out.teal.mix_shadow_fg = {desc = "Mixes in shadow fg", color = ucolors.darken(ucolors.blend(teal, color_2a.f2, 0.8), 0.2)}
    local _13_
    if ((main["background-mut"])[1] == "light") then
      _13_ = ucolors.darken(ucolors.blend(teal, color_2a.green, 0.3), 0.4)
    else
      _13_ = ucolors.brighten(ucolors.blend(teal, color_2a.green, 0.3), 0.2)
    end
    out.teal.mix_green = {desc = "Mixes in green, matches background", color = _13_}
  end
  out.red.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.red, color_2a.b0, 0.7)}
  out.red.match_fg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.red, color_2a.f0, 0.6)}
  out.red.mix_red = {desc = "Mixes in red", color = ucolors.brighten(ucolors.blend(color_2a.red, color_2a.red, 0.2), 0.1)}
  out.red.mix_orange = {desc = "Mixes in orange", color = ucolors.saturation(ucolors.brighten(ucolors.blend(color_2a.red, color_2a.orange, 0.2), 0.3), 0.8)}
  out.red.mix_pink = {desc = "Mixes in pink", color = ucolors.saturation(ucolors.blend(color_2a.red, color_2a.pink, 0.2), 1)}
  out.red.mix_meld_fg = {desc = "Mixes in meld fg color", color = ucolors.blend(color_2a.red, color_2a.f3, 0.2)}
  local _15_
  if ((main["background-mut"])[1] == "light") then
    _15_ = ucolors.darken(ucolors.blend(color_2a.red, color_2a.green, 0.2), 0.5)
  else
    _15_ = ucolors.brighten(ucolors.blend(color_2a.red, color_2a.green, 0.2), 0.5)
  end
  out.red.mix_green_variant = {desc = "Mixes in green, matches to background, variation", color = _15_}
  local _17_
  do
    local green
    do
      local output0 = ""
      if ((main["background-mut"])[1] == "light") then
        output0 = ucolors.saturation(ucolors.darken(color_2a.green, 0.5), 0.4)
      else
        output0 = ucolors.saturation(ucolors.brighten(color_2a.green, 0.5), -0.2)
      end
      green = output0
    end
    if ((main["background-mut"])[1] == "light") then
      _17_ = ucolors.darken(ucolors.blend(color_2a.red, green, 0.2), 0.5)
    else
      _17_ = ucolors.brighten(ucolors.blend(color_2a.red, green, 0.2), 0.5)
    end
  end
  out.red.mix_green = {desc = "Mixes in the auto matching green, matches background", color = _17_}
  out.red.mix_blue = {desc = "Mixes in blue", color = ucolors.brighten(ucolors.blend(color_2a.red, color_2a.blue, 0.1), 0.2)}
  out.red.mix_purple = {desk = "Mixes in purple", color = ucolors.brighten(ucolors.blend(color_2a.red, color_2a.purple, 0.2), 0.1)}
  out.red.darken = {desc = "Darkens red", color = ucolors.darken(color_2a.red, 0.2)}
  out.purple.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.purple, color_2a.b0, 0.7)}
  out.purple.match_fg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.purple, color_2a.f0, 0.7)}
  do
    local plum = ucolors.blend(color_2a.pink, color_2a.purple, 0.65)
    out.plum.base = {desc = "Base color, mixes purple and pink", color = plum}
    out.plum.match_fg = {desc = "Matches to base fg color", color = ucolors.blend(plum, color_2a.f0, 0.8)}
    out.plum.mix_red = {desc = "Mixes in red", color = ucolors.blend(plum, color_2a.red, 0.2)}
    out.plum.mix_meld_bg = {desc = "Mixes in meld bg", color = ucolors.blend(plum, color_2a.b3, 0.2)}
    out.plum.mix_green = {desc = "Mixes in green", color = ucolors.blend(plum, color_2a.green, 0.2)}
    out.plum.auto_mix_green = {desc = "Mixes in green based on auto matching green", color = ucolors.blend(plum, out.green.auto.color, 0.2)}
  end
  out.orange.match_fg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.orange, color_2a.f0, 0.7)}
  out.orange.match_fg_less = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.orange, color_2a.f0, 0.9)}
  out.orange.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.orange, color_2a.b0, 0.7)}
  out.orange.mix_green = {desc = "Mixes in green", color = ucolors.blend(color_2a.orange, color_2a.green, 0.2)}
  out.orange.auto_mix_green = {desc = "Mixes in green based on auto matching green", color = ucolors.blend(color_2a.orange, out.green.auto.color, 0.2)}
  out.orange.mix_blue = {desc = "Mixes in blue", color = ucolors.blend(color_2a.orange, color_2a.blue, 0.2)}
  out.orange.mix_sixth_bg = {desc = "Mixes in sixth bg", color = ucolors.saturation(ucolors.blend(color_2a.orange, color_2a.b5, 0.2), 1)}
  out.orange.mix_red = {desc = "Mixes in red", color = ucolors.blend(color_2a.orange, color_2a.red, 0.4)}
  out.pink.match_fg = {desc = "Matches to base fg color", color = ucolors.blend(color_2a.pink, color_2a.f0, 0.6)}
  out.pink.match_fg_less = {desc = "Matches to base fg color less", color = ucolors.blend(color_2a.pink, color_2a.f0, 0.7)}
  out.pink.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.pink, color_2a.b0, 0.6)}
  out.pink.match_bg_less = {desc = "Matches to base bg color less", color = ucolors.blend(color_2a.pink, color_2a.b0, 0.8)}
  out.pink.mix_red = {desc = "Mixes in red", color = ucolors.blend(color_2a.pink, color_2a.red, 0.2)}
  out.pink.mix_blue = {desc = "Mixes in blue", color = ucolors.blend(color_2a.pink, color_2a.blue, 0.2)}
  out.pink.mix_purple = {desc = "Mixes in purple", color = ucolors.blend(color_2a.pink, color_2a.purple, 0.2)}
  out.pink.mix_green = {desc = "Mixes in green", color = ucolors.blend(color_2a.pink, color_2a.green, 0.2)}
  out.pink.auto_mix_green = {desc = "Mixes in green based on auto matching green", color = ucolors.blend(color_2a.pink, out.green.auto.color, 0.2)}
  do
    local teal = ucolors.blend(color_2a.blue, color_2a.b5, 0.65)
    out.pink.mix_teal = {desc = "Mixes in teal", color = ucolors.blend(color_2a.pink, teal, 0.2)}
  end
  out.pink.mix_meld_fg = {desc = "Mix meld fg", color = ucolors.blend(color_2a.pink, color_2a.f3, 0.2)}
  out.pink.mix_meld_bg = {desc = "Mix meld bg", color = ucolors.blend(color_2a.pink, color_2a.b3, 0.2)}
  out.pink.mix_sixth_bg = {desc = "Mix sixth bg", color = ucolors.blend(color_2a.pink, color_2a.b5, 0.2)}
  return out
end
_2amodule_2a["output"] = output
return _2amodule_2a