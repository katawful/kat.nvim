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
  (let [test {:group "Test"
              :fg "#111111"
              :bg "#eeeeee"
              :ctermfg 7
              :ctermbg 0
              :bold true
              :italic true
              :underline true
              :sp "#444444"
              :blend 3}
        expected (ucolor.highlight$
                   :Test
                   "#111111"
                   "#eeeeee"
                   7
                   0
                   "bold,italic,underline"
                   "#444444"
                   3)]
    (t.ok? (vim.deep_equal test expected)
     "Generates a highlight for Neovim, version independent")))

(deftest highlight$<-api
  (let [test {:group "Test"
              :fg "#111111"
              :bg "#eeeeee"
              :ctermfg 7
              :ctermbg 0
              :bold true
              :italic true
              :underline true
              :sp "#444444"
              :blend 3}
        expected (ucolor.highlight$<-api
                   :Test
                   "#111111"
                   "#eeeeee"
                   7
                   0
                   ["bold,italic,underline"
                    "#444444"
                    3])]
    (t.ok? (vim.deep_equal test expected)
     "Generates a highlight for Neovim using nvim api")))

(deftest highlight$<-vimscript
  (let [test {:group "Test"
              :fg "#111111"
              :bg "#eeeeee"
              :ctermfg 7
              :ctermbg 0
              :bold true
              :italic true
              :underline true
              :sp "#444444"
              :blend 3}
        expected (ucolor.highlight$<-vimscript
                   :Test
                   "#111111"
                   "#eeeeee"
                   7
                   0
                   ["bold,italic,underline"
                    "#444444"
                    3])]
    (t.ok? (vim.deep_equal test expected)
     "Generates a highlight for Neovim using Vimscript")))

(deftest highlight-gui$
  (let [test {:group "Test"
              :fg "#111111"
              :bg "#eeeeee"
              :bold true
              :italic true
              :underline true
              :sp "#444444"
              :blend 3}
        expected (ucolor.highlight-gui$
                   :Test
                   "#111111"
                   "#eeeeee"
                   "bold,italic,underline"
                   "#444444"
                   3)]
    (t.ok? (vim.deep_equal test expected)
     "Generates a GUI only highlight for Neovim, version independent")))

(deftest highlight-gui$<-api
  (let [test {:group "Test"
              :fg "#111111"
              :bg "#eeeeee"
              :bold true
              :italic true
              :underline true
              :sp "#444444"
              :blend 3}
        expected (ucolor.highlight-gui$<-api
                   :Test
                   "#111111"
                   "#eeeeee"
                   ["bold,italic,underline"
                    "#444444"
                    3])]
    (t.ok? (vim.deep_equal test expected)
     "Generates a GUI only highlight for Neovim using nvim api")))

(deftest highlight-gui$<-vimscript
  (let [test {:group "Test"
              :fg "#111111"
              :bg "#eeeeee"
              :bold true
              :italic true
              :underline true
              :sp "#444444"
              :blend 3}
        expected (ucolor.highlight-gui$<-vimscript
                   :Test
                   "#111111"
                   "#eeeeee"
                   ["bold,italic,underline"
                    "#444444"
                    3])]
    (t.ok? (vim.deep_equal test expected)
     "Generates a GUI only highlight for Neovim using Vimscript")))
