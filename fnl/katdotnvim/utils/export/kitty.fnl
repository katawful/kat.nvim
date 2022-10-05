(module katdotnvim.utils.export.kitty
        {autoload {ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   groups katdotnvim.highlights.main
                   main katdotnvim.main
                   export katdotnvim.utils.export.init}})

;;; This module exports the 16 colors for kitty

;; require vim.loop
(def- loop vim.loop)

(def comment-type "#")

;; FN -- generates a table of colors for kitty colors
;; $output -- a table of colors where the key is the string for kitty group
(defn gen-colors [] "Export a table of strings for kitty"
      (let [output {:foreground colors.kat.fg.auto.color
                    :background colors.kat.bg.base.color
                    :selection_foreground colors.kat.fg.auto.color
                    :selection_background colors.kat.blue.base.color
                    :cursor colors.kat.fg.auto.color
                    :cursor_text_color colors.kat.bg.base.color
                    :url_color colors.kat.orange.base.color
                    :active_border_color colors.kat.blue.base.color
                    :inactive_border_color colors.kat.bg.meld.color
                    :bell_border_color colors.kat.green.auto.color
                    ;; Tabs
                    :active_tab_foreground colors.kat.fg.auto.color
                    :active_tab_background colors.kat.blue.base.color
                    :inactive_tab_foreground colors.kat.fg.auto.color
                    :inactive_tab_background (ucolors.blend (. (groups.highlightBG)
                                                               1)
                                                            (. (groups.meldBG)
                                                               1)
                                                            0.5)
                    :tab_bar_background colors.kat.pink.base.color
                    :tab_bar_margin_color colors.kat.orange.base.color
                    ;; Marks
                    :mark1_foreground colors.kat.bg.base.color
                    :mark1_background colors.kat.red.base.color
                    :mark2_foreground colors.kat.bg.base.color
                    :mark2_background colors.kat.blue.base.color
                    :mark3_foreground colors.kat.bg.base.color
                    :mark3_background colors.kat.green.auto.color
                    ;; Colors
                    :color0 colors.kat.bg.base.color
                    :color1 colors.kat.red.base.color
                    :color2 colors.kat.green.base.color
                    :color3 colors.kat.orange.base.color
                    :color4 colors.kat.blue.base.color
                    :color5 colors.kat.pink.base.color
                    :color6 colors.kat.purple.base.color
                    :color7 colors.kat.fg.auto.color
                    :color8 colors.kat.bg.umbra.color
                    :color15 colors.kat.fg.umbra.color}]
        (if (= (. main.background-mut 1) :light)
            (do
              (tset output :color9
                    (ucolors.darken colors.kat.red.base.color 0.2))
              (tset output :color10
                    (ucolors.darken colors.kat.green.base.color 0.2))
              (tset output :color11
                    (ucolors.darken colors.kat.orange.base.color 0.2))
              (tset output :color12
                    (ucolors.darken colors.kat.blue.base.color 0.2))
              (tset output :color13
                    (ucolors.darken colors.kat.pink.base.color 0.2))
              (tset output :color14
                    (ucolors.darken colors.kat.purple.base.color 0.2)))
            (do
              (tset output :color9
                    (ucolors.brighten colors.kat.red.base.color 0.2))
              (tset output :color10
                    (ucolors.brighten colors.kat.green.base.color 0.2))
              (tset output :color11
                    (ucolors.brighten colors.kat.orange.base.color 0.2))
              (tset output :color12
                    (ucolors.brighten colors.kat.blue.base.color 0.2))
              (tset output :color13
                    (ucolors.brighten colors.kat.pink.base.color 0.2))
              (tset output :color14
                    (ucolors.brighten colors.kat.purple.base.color 0.2))))
        output))

;; FN -- output kitty string to a file at the current working directory
(defn output! [] (let [file-name (string.format "kitty-%s-%s.conf"
                                                (tostring (. main.colors-name-mut
                                                             1))
                                                (tostring (. main.background-mut
                                                             1)))
                       fd (assert (loop.fs_open file-name :w 0))]
                   (assert (loop.fs_chmod file-name 420))
                   (assert (loop.fs_write fd
                                          (export.string->one-line-color (gen-colors)
                                                                         :kitty)
                                          0))
                   (export.notify$ :kitty)
                   (assert (loop.fs_close fd))))
