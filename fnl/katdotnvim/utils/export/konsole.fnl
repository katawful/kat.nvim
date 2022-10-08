(module katdotnvim.utils.export.konsole
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   groups katdotnvim.highlights.main
                   main katdotnvim.main
                   export katdotnvim.utils.export.init}})

;;; This module exports the 16 colors for konsole

;; requirements
(def- loop vim.loop)

;; FN -- generates a table of colors for konsole
;; $output -- a table of colors where the key is the string for the konsole group

;; fnlfmt: skip
(defn gen-colors [] "Export a table of strings for konsole"
      (let [output {"[Background]" (.. :Color= (export.hex->rgb-string colors.kat.bg.base.color))
                    "[BackgroundFaint]" (.. :Color= (export.hex->rgb-string colors.kat.bg.meld.color))
                    "[BackgroundIntense]" (.. :Color= (export.hex->rgb-string colors.kat.bg.umbra.color))
                    "[Foreground]" (.. :Color= (export.hex->rgb-string colors.kat.fg.auto.color))
                    "[ForegroundFaint]" (.. :Color= (export.hex->rgb-string colors.kat.fg.meld.color))
                    "[ForegroundIntense]" (.. :Color= (export.hex->rgb-string colors.kat.fg.umbra.color))
                    "[Color0]" (.. :Color= (export.hex->rgb-string colors.kat.bg.base.color))
                    "[Color1]" (.. :Color= (export.hex->rgb-string colors.kat.red.base.color))
                    "[Color2]" (.. :Color= (export.hex->rgb-string colors.kat.green.base.color))
                    "[Color3]" (.. :Color= (export.hex->rgb-string colors.kat.orange.base.color))
                    "[Color4]" (.. :Color= (export.hex->rgb-string colors.kat.blue.base.color))
                    "[Color5]" (.. :Color= (export.hex->rgb-string colors.kat.pink.base.color))
                    "[Color6]" (.. :Color= (export.hex->rgb-string colors.kat.purple.base.color))
                    "[Color7]" (.. :Color= (export.hex->rgb-string colors.kat.fg.auto.color))
                    "[Color8]" (.. :Color= (export.hex->rgb-string colors.kat.bg.umbra.color))
                    "[Color15]" (.. :Color= (export.hex->rgb-string colors.kat.fg.umbra.color))
                    "[General]" (string.format "Blur=false
ColorRandomization=false
Description=%s
Opacity=1
Wallpaper="
                                               (.. (tostring (. main.colors-name-mut 1))
                                                   "-"
                                                   (tostring (. main.background-mut 1))))}]
        (if (= (. main.background-mut 1) :light)
            (do
              (tset output "[Color0Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.bg.base.color 0.2))))
              (tset output "[Color1Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.red.base.color 0.2))))
              (tset output "[Color2Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.green.base.color 0.2))))
              (tset output "[Color3Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.orange.base.color 0.2))))
              (tset output "[Color4Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.blue.base.color 0.2))))
              (tset output "[Color5Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.pink.base.color 0.2))))
              (tset output "[Color6Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.purple.base.color 0.2))))
              (tset output "[Color7Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.fg.base.color 0.2))))
              (tset output "[Color8Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.bg.umbra.color 0.2))))
              (tset output "[Color9Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.red.base.color 0.2))))
              (tset output "[Color10Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.green.base.color 0.2))))
              (tset output "[Color11Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.orange.base.color 0.2))))
              (tset output "[Color12Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.blue.base.color 0.2))))
              (tset output "[Color13Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.pink.base.color 0.2))))
              (tset output "[Color14Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.purple.base.color 0.2))))
              (tset output "[Color15Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.fg.umbra.color 0.2))))
              (tset output "[Color0Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.bg.base.color 0.2))))
              (tset output "[Color1Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.red.base.color 0.2))))
              (tset output "[Color2Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.green.base.color 0.2))))
              (tset output "[Color3Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.orange.base.color 0.2))))
              (tset output "[Color4Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.blue.base.color 0.2))))
              (tset output "[Color5Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.pink.base.color 0.2))))
              (tset output "[Color6Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.purple.base.color 0.2))))
              (tset output "[Color7Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.fg.base.color 0.2))))
              (tset output "[Color8Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.bg.umbra.color 0.2))))
              (tset output "[Color9Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.red.base.color 0.2))))
              (tset output "[Color10Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.green.base.color 0.2))))
              (tset output "[Color11Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.orange.base.color 0.2))))
              (tset output "[Color12Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.blue.base.color 0.2))))
              (tset output "[Color13Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.pink.base.color 0.2))))
              (tset output "[Color14Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.purple.base.color 0.2))))
              (tset output "[Color15Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.fg.umbra.color 0.2))))
              (tset output "[Color9]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.red.base.color 0.2))))
              (tset output "[Color10]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.green.base.color 0.2))))
              (tset output "[Color11]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.orange.base.color 0.2))))
              (tset output "[Color12]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.blue.base.color 0.2))))
              (tset output "[Color13]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.pink.base.color 0.2))))
              (tset output "[Color14]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.purple.base.color 0.2)))))
            (do
              (tset output "[Color0Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.bg.base.color 0.2))))
              (tset output "[Color1Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.red.base.color 0.2))))
              (tset output "[Color2Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.green.base.color 0.2))))
              (tset output "[Color3Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.orange.base.color 0.2))))
              (tset output "[Color4Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.blue.base.color 0.2))))
              (tset output "[Color5Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.pink.base.color 0.2))))
              (tset output "[Color6Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.purple.base.color 0.2))))
              (tset output "[Color7Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.fg.base.color 0.2))))
              (tset output "[Color8Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.bg.umbra.color 0.2))))
              (tset output "[Color9Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.red.base.color 0.2))))
              (tset output "[Color10Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.green.base.color 0.2))))
              (tset output "[Color11Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.orange.base.color 0.2))))
              (tset output "[Color12Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.blue.base.color 0.2))))
              (tset output "[Color13Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.pink.base.color 0.2))))
              (tset output "[Color14Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.purple.base.color 0.2))))
              (tset output "[Color15Faint]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.fg.umbra.color 0.2))))
              (tset output "[Color0Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.bg.base.color 0.2))))
              (tset output "[Color1Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.red.base.color 0.2))))
              (tset output "[Color2Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.green.base.color 0.2))))
              (tset output "[Color3Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.orange.base.color 0.2))))
              (tset output "[Color4Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.blue.base.color 0.2))))
              (tset output "[Color5Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.pink.base.color 0.2))))
              (tset output "[Color6Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.purple.base.color 0.2))))
              (tset output "[Color7Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.fg.base.color 0.2))))
              (tset output "[Color8Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.darken colors.kat.bg.umbra.color 0.2))))
              (tset output "[Color9Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.red.base.color 0.2))))
              (tset output "[Color10Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.green.base.color 0.2))))
              (tset output "[Color11Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.orange.base.color 0.2))))
              (tset output "[Color12Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.blue.base.color 0.2))))
              (tset output "[Color13Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.pink.base.color 0.2))))
              (tset output "[Color14Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.purple.base.color 0.2))))
              (tset output "[Color15Intense]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.fg.umbra.color 0.2))))
              (tset output "[Color9]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.red.base.color 0.2))))
              (tset output "[Color10]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.green.base.color 0.2))))
              (tset output "[Color11]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.orange.base.color 0.2))))
              (tset output "[Color12]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.blue.base.color 0.2))))
              (tset output "[Color13]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.pink.base.color 0.2))))
              (tset output "[Color14]"
                    (.. :Color= (export.hex->rgb-string (ucolors.brighten colors.kat.purple.base.color 0.2))))))
        output))

;; FN -- output konsole string to a file at the current working directory
(defn output! [] (let [file-name (string.format "konsole-%s-%s.colorscheme"
                                                (tostring (. main.colors-name-mut
                                                             1))
                                                (tostring (. main.background-mut
                                                             1)))
                       fd (assert (loop.fs_open file-name :w 0))]
                   (assert (loop.fs_chmod file-name 420))
                   (assert (loop.fs_write fd
                                          (export.string->two-line-color* (gen-colors)
                                                                          :konsole)
                                          0))
                   (export.notify$ :konsole)
                   (assert (loop.fs_close fd))))
