(module katdotnvim.utils.color-test
  {autoload {ucolor katdotnvim.utils.color}})

(deftest blend
  (t.= "#1a2632" (ucolor.blend "#222222" "#182736" 0.2)
       "Blends 2 colors by some alpha"))

(deftest brighten
  (t.= "#5c5c5c" (ucolor.brighten "#222222" 0.3)
       "Brighten a hex color by some percent"))

(deftest darken
  (t.= "#1a1a1a" (ucolor.darken "#222222" 0.3)
       "Darken a hex color by some percent"))

(deftest saturation
  (t.= "#00345c" (ucolor.saturation "#123456" 0.3)
       "Change saturation on a hex color by some percent"))

(deftest hsluv-brighten
  (t.= "#95a46e" (ucolor.hsluv-brighten [100 50 50] 0.3)
       "Brigthen a hsluv color by some percent"))
