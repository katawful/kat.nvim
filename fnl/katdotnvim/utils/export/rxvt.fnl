(module katdotnvim.utils.export.rxvt
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   groups katdotnvim.highlights.main
                   main katdotnvim.main
                   export katdotnvim.utils.export.init}})

;;; Exports 16 colors for rxvt-unicode

(def- loop vim.loop)

(def comment-type "!")

;; FN -- generates a table of colors for rxvt
;; $output -- table of colors where the key is the string for the rxvt group
(defn gen-colors [] "Exports a table of strings for Urxvt"
      (let [output {"*foreground:" colors.kat.fg.auto.color
                    "*background:" colors.kat.bg.base.color
                    "*cursorColor:" colors.kat.fg.auto.color
                    "*fadeColor:" colors.kat.bg.meld.color
                    "*pointerColorForeground:" colors.kat.fg.auto.color
                    "*pointerColorBackground:" colors.kat.bg.base.color
                    "Urxvt*foreground:" colors.kat.fg.auto.color
                    "Urxvt*background:" colors.kat.bg.base.color
                    ; :selection_foreground colors.kat.fg.auto.color
                    ; :selection_background colors.kat.blue.base.color
                    ; :contrast (. main.contrast-mut 1)
                    ; :shade (. main.background-mut 1)
                    ; :cursor (. colors.kat.fg.auto.color 1)
                    ; :cursor_text_color :background
                    "URxvt*color0:" colors.kat.bg.base.color
                    "URxvt*color1:" colors.kat.red.base.color
                    "URxvt*color2:" colors.kat.green.base.color
                    "URxvt*color3:" colors.kat.orange.base.color
                    "URxvt*color4:" colors.kat.blue.base.color
                    "URxvt*color5:" colors.kat.pink.base.color
                    "URxvt*color6:" colors.kat.purple.base.color
                    "URxvt*color7:" colors.kat.fg.auto.color
                    "URxvt*color8:" colors.kat.bg.umbra.color
                    "URxvt*color15:" colors.kat.fg.umbra.color}]
        (if (= (. main.background-mut 1) :light)
            (do
              (tset output "URxvt*color9:"
                    (ucolors.darken colors.kat.red.base.color 0.2))
              (tset output "URxvt*color10:"
                    (ucolors.darken colors.kat.green.base.color 0.2))
              (tset output "URxvt*color11:"
                    (ucolors.darken colors.kat.orange.base.color 0.2))
              (tset output "URxvt*color12:"
                    (ucolors.darken colors.kat.blue.base.color 0.2))
              (tset output "URxvt*color13:"
                    (ucolors.darken colors.kat.pink.base.color 0.2))
              (tset output "URxvt*color14:"
                    (ucolors.darken colors.kat.purple.base.color 0.2)))
            (do
              (tset output "URxvt*color9:"
                    (ucolors.brighten colors.kat.red.base.color 0.2))
              (tset output "URxvt*color10:"
                    (ucolors.brighten colors.kat.green.base.color 0.2))
              (tset output "URxvt*color11:"
                    (ucolors.brighten colors.kat.orange.base.color 0.2))
              (tset output "URxvt*color12:"
                    (ucolors.brighten colors.kat.blue.base.color 0.2))
              (tset output "URxvt*color13:"
                    (ucolors.brighten colors.kat.pink.base.color 0.2))
              (tset output "URxvt*color14:"
                    (ucolors.brighten colors.kat.purple.base.color 0.2))))
        output))

;; FN -- output rxvt string to a file at the current working directory
(defn output! [] (let [file-name (string.format "Urxvt-%s-%s.Xresources"
                                                (tostring (. main.colors-name-mut
                                                             1))
                                                (tostring (. main.background-mut
                                                             1)))
                       fd (assert (loop.fs_open file-name :w 0))]
                   (assert (loop.fs_chmod file-name 420))
                   (assert (loop.fs_write fd
                                          (export.string->one-line-color (gen-colors)
                                                                         :rxvt-unicode)
                                          0))
                   (export.notify$ :rxvt-unicode)
                   (assert (loop.fs_close fd))))
