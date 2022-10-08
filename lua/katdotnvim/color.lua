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
local main, ucolors = autoload("katdotnvim.main"), autoload("katdotnvim.utils.highlight.utils")
do end (_2amodule_locals_2a)["main"] = main
_2amodule_locals_2a["ucolors"] = ucolors
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
local function def_normal_colors()
  local output = {red = red_primary, green = green_primary, orange = orange_primary, pink = pink_primary, purple = purple_primary, blue = blue_primary}
  return output
end
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
local function init(table)
  local _7_ = table
  if (_7_ == "normalColors") then
    return def_normal_colors()
  elseif (_7_ == "background") then
    return def_back_colors()
  elseif (_7_ == "foreground") then
    return def_fore_colors()
  else
    return nil
  end
end
_2amodule_2a["init"] = init
local function normal_colors()
  return def_normal_colors()
end
_2amodule_2a["normal-colors"] = normal_colors
local function background()
  return def_back_colors()
end
_2amodule_2a["background"] = background
local function foreground()
  return def_fore_colors()
end
_2amodule_2a["foreground"] = foreground
local kat = {pink = {}, red = {}, blue = {}, green = {}, purple = {}, orange = {}, teal = {}, plum = {}, fg = {}, bg = {}}
_2amodule_2a["kat"] = kat
local function update()
  local color_2a
  do
    local normal_colors0 = def_normal_colors()
    local foreground0 = def_fore_colors()
    local background0 = def_back_colors()
    local output = {}
    for k, v in pairs(normal_colors0) do
      output[k] = v
    end
    for i = 1, 6 do
      output[("f" .. (i - 1))] = (foreground0)[i]
      output[("b" .. (i - 1))] = (background0)[i]
    end
    color_2a = output
  end
  kat.pink.base = {desc = "Base color, no changes applied", color = color_2a.pink}
  kat.red.base = {desc = "Base color, no changes applied", color = color_2a.red}
  kat.blue.base = {desc = "Base color, no changes applied", color = color_2a.blue}
  kat.green.base = {desc = "Base color, no changes applied", color = color_2a.green}
  kat.purple.base = {desc = "Base color, no changes applied", color = color_2a.purple}
  kat.orange.base = {desc = "Base color, no changes applied", color = color_2a.orange}
  kat.fg.base = {desc = "Base color, no changes applied", color = color_2a.f0}
  kat.bg.base = {desc = "Base color, no changes applied", color = color_2a.b0}
  kat.fg.umbra = {desc = "Umbra/second color, lighter shadow variation", color = color_2a.f1}
  kat.fg.shadow = {desc = "Shadow/third color, used to contrast base fg", color = color_2a.f2}
  kat.fg.meld = {desc = "Meld/fourth, used to blend in with the base fg", color = color_2a.f3}
  kat.fg.fifth = {desc = "5th bg color, dark for dark background and bright for light background", color = color_2a.f4}
  kat.fg.sixth = {desc = "6th bg color, dark for dark background and bright for light background", color = color_2a.f5}
  local _9_
  if (((main["background-mut"])[1] == "dark") and ((main["contrast-mut"])[1] == "soft")) then
    _9_ = ucolors.brighten(color_2a.f0, 1)
  else
    _9_ = color_2a.f0
  end
  kat.fg.auto = {desc = "Auto matching color, used to always maintain bright color regardless of contrast", color = _9_}
  kat.bg.umbra = {desc = "Umbra/second color, lighter shadow variation", color = color_2a.b1}
  kat.bg.shadow = {desc = "Shadow/third color, used to contrast base bg", color = color_2a.b2}
  kat.bg.meld = {desc = "Meld/fourth color, used to blend in with the base fg", color = color_2a.b3}
  kat.bg.fifth = {desc = "5th bg color, bright for dark background and dark for light background", color = color_2a.b4}
  kat.bg.sixth = {desc = "6th bg color, bright for dark background and dark for light background", color = color_2a.b5}
  local _11_
  if ((main["background-mut"])[1] == "light") then
    _11_ = ucolors.saturation(ucolors.darken(color_2a.green, 0.5), 0.4)
  else
    _11_ = ucolors.saturation(ucolors.brighten(color_2a.green, 0.5), -0.2)
  end
  kat.green.auto = {desc = "Auto matching color, used to increase contrast depending on background", color = _11_}
  kat.green.match_fg = {desc = "Matches to base fg color", color = ucolors.blend(color_2a.green, color_2a.f0, 0.5)}
  kat.green.auto_match_fg = {desc = "Matches to base fg color based on auto matching green", color = ucolors.blend(kat.green.auto.color, color_2a.f0, 0.5)}
  kat.green.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.green, color_2a.b0, 0.5)}
  kat.green.match_bg_less = {desc = "Matches to base bg color less", color = ucolors.blend(color_2a.green, color_2a.b0, 0.7)}
  kat.green.mix_blue = {desc = "Mixes in blue", color = ucolors.blend(color_2a.green, color_2a.blue, 0.5)}
  kat.green.mix_red = {desc = "Mixes in red", color = ucolors.blend(color_2a.green, color_2a.red, 0.2)}
  kat.green.mix_purple = {desc = "Mixes in purple", color = ucolors.saturation(ucolors.blend(color_2a.green, color_2a.purple, 0.3), 0.8)}
  kat.blue.mix_orange_match_fg = {desc = "Mixes in orange, then matches to base fg color", color = ucolors.blend(ucolors.blend(color_2a.orange, color_2a.f0, 0.1), color_2a.blue, 0.2)}
  kat.blue.darken = {desc = "Darkens color by 20%", color = ucolors.darken(color_2a.blue, 0.2)}
  kat.blue.brighten = {desc = "Brighten color by 20%", color = ucolors.brighten(color_2a.blue, 0.2)}
  kat.blue.match_fg = {desc = "Matches to base fg color", color = ucolors.blend(color_2a.blue, color_2a.f0, 0.5)}
  kat.blue.match_fg_less = {desc = "Matches to base fg color, uses more of the blue", color = ucolors.blend(color_2a.blue, color_2a.f0, 0.7)}
  kat.blue.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.blue, color_2a.b0, 0.5)}
  kat.blue.mix_shadow_bg = {desc = "Mixes in shadow bg color", color = ucolors.blend(color_2a.blue, color_2a.b2, 0.8)}
  kat.blue.mix_shadow_bg_more = {desc = "Mixes in shadow bg color more", color = ucolors.blend(color_2a.blue, color_2a.b2, 0.4)}
  kat.blue.mix_meld_bg = {desc = "Mixes in meld bg color", color = ucolors.blend(color_2a.blue, color_2a.b3, 0.8)}
  do
    local teal = ucolors.blend(color_2a.blue, color_2a.b5, 0.65)
    kat.teal.base = {desc = "Base color, is a mix of blue and sixth background", color = teal}
    local _13_
    if ((main["background-mut"])[1] == "light") then
      _13_ = ucolors.darken(ucolors.blend(teal, color_2a.f5, 0.5), 0.4)
    else
      _13_ = ucolors.brighten(ucolors.blend(teal, color_2a.f5, 0.5), 0.4)
    end
    kat.teal.auto = {desc = "Auto matches based on background", color = _13_}
    kat.teal.mix_purple = {desc = "Mixes in purple", color = ucolors.brighten(ucolors.blend(teal, color_2a.purple, 0.2), 0.2)}
    kat.teal.mix_red = {desc = "Mixes in red", color = ucolors.blend(teal, color_2a.red, 0.3)}
    kat.teal.mix_red_brighten_dull = {desc = "Mixes in red, brightens, not as bright", color = ucolors.saturation(ucolors.brighten(ucolors.blend(teal, color_2a.red, 0.3), 0.1), 0.1)}
    kat.teal.mix_red_brighten = {desc = "Mixes in red, brightens, not as bright", color = ucolors.saturation(ucolors.brighten(ucolors.blend(teal, color_2a.red, 0.3), 0.1), 0.5)}
    kat.teal.mix_pink = {desc = "Mixes in pink", color = ucolors.blend(teal, color_2a.pink, 0.8)}
    kat.teal.mix_pink = {desc = "Mixes in pink", color = ucolors.blend(teal, color_2a.pink, 0.8)}
    kat.teal.mix_shadow_fg = {desc = "Mixes in shadow fg", color = ucolors.darken(ucolors.blend(teal, color_2a.f2, 0.8), 0.2)}
    local _15_
    if ((main["background-mut"])[1] == "light") then
      _15_ = ucolors.darken(ucolors.blend(teal, color_2a.green, 0.3), 0.4)
    else
      _15_ = ucolors.brighten(ucolors.blend(teal, color_2a.green, 0.3), 0.2)
    end
    kat.teal.mix_green = {desc = "Mixes in green, matches background", color = _15_}
  end
  kat.red.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.red, color_2a.b0, 0.7)}
  kat.red.match_fg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.red, color_2a.f0, 0.6)}
  kat.red.mix_red = {desc = "Mixes in red", color = ucolors.brighten(ucolors.blend(color_2a.red, color_2a.red, 0.2), 0.1)}
  kat.red.mix_orange = {desc = "Mixes in orange", color = ucolors.saturation(ucolors.brighten(ucolors.blend(color_2a.red, color_2a.orange, 0.2), 0.3), 0.8)}
  kat.red.mix_pink = {desc = "Mixes in pink", color = ucolors.saturation(ucolors.blend(color_2a.red, color_2a.pink, 0.2), 1)}
  kat.red.mix_meld_fg = {desc = "Mixes in meld fg color", color = ucolors.blend(color_2a.red, color_2a.f3, 0.2)}
  local _17_
  if ((main["background-mut"])[1] == "light") then
    _17_ = ucolors.darken(ucolors.blend(color_2a.red, color_2a.green, 0.2), 0.5)
  else
    _17_ = ucolors.brighten(ucolors.blend(color_2a.red, color_2a.green, 0.2), 0.5)
  end
  kat.red.mix_green_variant = {desc = "Mixes in green, matches to background, variation", color = _17_}
  local _19_
  do
    local green
    do
      local output = ""
      if ((main["background-mut"])[1] == "light") then
        output = ucolors.saturation(ucolors.darken(color_2a.green, 0.5), 0.4)
      else
        output = ucolors.saturation(ucolors.brighten(color_2a.green, 0.5), -0.2)
      end
      green = output
    end
    if ((main["background-mut"])[1] == "light") then
      _19_ = ucolors.darken(ucolors.blend(color_2a.red, green, 0.2), 0.5)
    else
      _19_ = ucolors.brighten(ucolors.blend(color_2a.red, green, 0.2), 0.5)
    end
  end
  kat.red.mix_green = {desc = "Mixes in the auto matching green, matches background", color = _19_}
  kat.red.mix_blue = {desc = "Mixes in blue", color = ucolors.brighten(ucolors.blend(color_2a.red, color_2a.blue, 0.1), 0.2)}
  kat.red.mix_purple = {desk = "Mixes in purple", color = ucolors.brighten(ucolors.blend(color_2a.red, color_2a.purple, 0.2), 0.1)}
  kat.red.darken = {desc = "Darkens red", color = ucolors.darken(color_2a.red, 0.2)}
  kat.purple.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.purple, color_2a.b0, 0.7)}
  kat.purple.match_fg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.purple, color_2a.f0, 0.7)}
  do
    local plum = ucolors.blend(color_2a.pink, color_2a.purple, 0.65)
    kat.plum.base = {desc = "Base color, mixes purple and pink", color = plum}
    kat.plum.match_fg = {desc = "Matches to base fg color", color = ucolors.blend(plum, color_2a.f0, 0.8)}
    kat.plum.mix_red = {desc = "Mixes in red", color = ucolors.blend(plum, color_2a.red, 0.2)}
    kat.plum.mix_meld_bg = {desc = "Mixes in meld bg", color = ucolors.blend(plum, color_2a.b3, 0.2)}
    kat.plum.mix_green = {desc = "Mixes in green", color = ucolors.blend(plum, color_2a.green, 0.2)}
    kat.plum.auto_mix_green = {desc = "Mixes in green based on auto matching green", color = ucolors.blend(plum, kat.green.auto.color, 0.2)}
  end
  kat.orange.match_fg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.orange, color_2a.f0, 0.7)}
  kat.orange.match_fg_less = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.orange, color_2a.f0, 0.9)}
  kat.orange.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.orange, color_2a.b0, 0.7)}
  kat.orange.mix_green = {desc = "Mixes in green", color = ucolors.blend(color_2a.orange, color_2a.green, 0.2)}
  kat.orange.auto_mix_green = {desc = "Mixes in green based on auto matching green", color = ucolors.blend(color_2a.orange, kat.green.auto.color, 0.2)}
  kat.orange.mix_blue = {desc = "Mixes in blue", color = ucolors.blend(color_2a.orange, color_2a.blue, 0.2)}
  kat.orange.mix_sixth_bg = {desc = "Mixes in sixth bg", color = ucolors.saturation(ucolors.blend(color_2a.orange, color_2a.b5, 0.2), 1)}
  kat.orange.mix_red = {desc = "Mixes in red", color = ucolors.blend(color_2a.orange, color_2a.red, 0.4)}
  kat.pink.match_fg = {desc = "Matches to base fg color", color = ucolors.blend(color_2a.pink, color_2a.f0, 0.6)}
  kat.pink.match_fg_less = {desc = "Matches to base fg color less", color = ucolors.blend(color_2a.pink, color_2a.f0, 0.7)}
  kat.pink.match_bg = {desc = "Matches to base bg color", color = ucolors.blend(color_2a.pink, color_2a.b0, 0.6)}
  kat.pink.match_bg_less = {desc = "Matches to base bg color less", color = ucolors.blend(color_2a.pink, color_2a.b0, 0.8)}
  kat.pink.mix_red = {desc = "Mixes in red", color = ucolors.blend(color_2a.pink, color_2a.red, 0.2)}
  kat.pink.mix_blue = {desc = "Mixes in blue", color = ucolors.blend(color_2a.pink, color_2a.blue, 0.2)}
  kat.pink.mix_purple = {desc = "Mixes in purple", color = ucolors.blend(color_2a.pink, color_2a.purple, 0.2)}
  kat.pink.mix_green = {desc = "Mixes in green", color = ucolors.blend(color_2a.pink, color_2a.green, 0.2)}
  kat.pink.auto_mix_green = {desc = "Mixes in green based on auto matching green", color = ucolors.blend(color_2a.pink, kat.green.auto.color, 0.2)}
  do
    local teal = ucolors.blend(color_2a.blue, color_2a.b5, 0.65)
    kat.pink.mix_teal = {desc = "Mixes in teal", color = ucolors.blend(color_2a.pink, teal, 0.2)}
  end
  kat.pink.mix_meld_fg = {desc = "Mix meld fg", color = ucolors.blend(color_2a.pink, color_2a.f3, 0.2)}
  kat.pink.mix_meld_bg = {desc = "Mix meld bg", color = ucolors.blend(color_2a.pink, color_2a.b3, 0.2)}
  kat.pink.mix_sixth_bg = {desc = "Mix sixth bg", color = ucolors.blend(color_2a.pink, color_2a.b5, 0.2)}
  return nil
end
_2amodule_2a["update"] = update
update()
return _2amodule_2a