(module katdotnvim.utils.highlight.utils-test
  {autoload {ucolor katdotnvim.utils.highlight.utils}})

(deftest blend
  (t.= "#1a2632" (ucolor.blend "#222222" "#182736" 0.2)
       "Blends 2 colors, biased to 2nd color")
  (t.= "#202326" (ucolor.blend "#222222" "#182736" 0.8)
       "Blends 2 colors, biased to 1st color")
  (t.= "#222222" (ucolor.blend "#222222" "#182736" 1.0)
       "Blends 2 colors, only mixes left color")
  (t.= "#182736" (ucolor.blend "#222222" "#182736" 0.0)
       "Blends 2 colors, only mixes right color"))

(deftest brighten
  (t.= "#222222" (ucolor.brighten "#222222" 0.0)
       "Brighten a hex color by 0%")
  (t.= "#5c5c5c" (ucolor.brighten "#222222" 0.3)
       "Brighten a hex color by 30%")
  (t.= "#cecece" (ucolor.brighten "#222222" 0.8)
       "Brighten a hex color by 80%")
  (t.= "#ffffff" (ucolor.brighten "#222222" 1.0)
       "Brighten a hex color by 100%"))

(deftest darken
  (t.= "#222222" (ucolor.darken "#222222" 0.0)
       "Darken a hex color by 0%")
  (t.= "#1a1a1a" (ucolor.darken "#222222" 0.3)
       "Darken a hex color by 30%")
  (t.= "#0a0a0a" (ucolor.darken "#222222" 0.8)
       "Darken a hex color by 80%")
  (t.= "#000000" (ucolor.darken "#222222" 1.0)
       "Darken a hex color by 100%"))

(deftest saturation
  (t.= "#333333" (ucolor.saturation "#123456" -1.0)
       "Change saturation on a hex color by -100%")
  (t.= "#2f333a" (ucolor.saturation "#123456" -0.8)
       "Change saturation on a hex color by -80%")
  (t.= "#21334c" (ucolor.saturation "#123456" -0.3)
       "Change saturation on a hex color by -30%")
  (t.= "#123456" (ucolor.saturation "#123456" 0.0)
       "Change saturation on a hex color by 0%")
  (t.= "#00345c" (ucolor.saturation "#123456" 0.3)
       "Change saturation on a hex color by 30%")
  (t.= "#00345c" (ucolor.saturation "#123456" 0.8)
       "Change saturation on a hex color by 80%")
  (t.= "#00345c" (ucolor.saturation "#123456" 1.0)
       "Change saturation on a hex color by 100%"))

(deftest hsluv-brighten
  (t.= "#707c52" (ucolor.hsluv-brighten [100 50 50] 0.0)
       "Brigthen a hsluv color by 0%")
  (t.= "#95a46e" (ucolor.hsluv-brighten [100 50 50] 0.3)
       "Brigthen a hsluv color by 30%")
  (t.= "#d6eb9f" (ucolor.hsluv-brighten [100 50 50] 0.8)
       "Brigthen a hsluv color by 80%")
  (t.= "#ffffff" (ucolor.hsluv-brighten [100 50 50] 1.0)
       "Brigthen a hsluv color by 100%"))
