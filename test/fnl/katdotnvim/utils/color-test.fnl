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

(deftest highlight$
  (t.= "highlight Test guifg=#111111 guibg=#eeeeee ctermfg=7 ctermbg=0 gui=bold,italic,underline cterm=bold,italic,underline guisp=#444444 blend=3"
       (ucolor.highlight$ :Test "#111111" "#eeeeee" 7 0 "bold,italic,underline" "#444444" 3)
       "Generates a highlight for Neovim"))

(deftest highlight-gui$
  (t.= "highlight Test guifg=#111111 guibg=#eeeeee gui=bold,italic,underline guisp=#444444 blend=3"
       (ucolor.highlight-gui$ :Test "#111111" "#eeeeee" "bold,italic,underline" "#444444" 3)
       "Generates a GUI only highlight for Neovim"))
