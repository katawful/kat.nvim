(module katdotnvim.utils.export.rxvt
        {autoload {hsl externals.hsluv
                   ucolors katdotnvim.utils.highlight.utils
                   colors katdotnvim.color
                   groups katdotnvim.highlights.main
                   main katdotnvim.main
                   export katdotnvim.utils.export.init
                   errors katdotnvim.utils.errors
                   a aniseed.core}})

;;; Exports 16 colors for rxvt-unicode

(def- loop vim.loop)

(def comment-type "!")

;; FN -- generates a table of colors for rxvt
;; $output -- table of colors where the key is the string for the rxvt group
(defn gen-colors [] "Exports a table of strings for Urxvt"
      (let [output {"URxvt*foreground:" (. (groups.mainFG) 1)
                    "URxvt*background:" (. (groups.mainBG) 1)
                    ; :selection_foreground (. (groups.selectionFG) 1)
                    ; :selection_background (. (groups.selectionBG) 1)
                    ; :contrast (. main.contrast-mut 1)
                    ; :shade (. main.background-mut 1)
                    ; :cursor (. (. (groups.mainFG) 1) 1)
                    ; :cursor_text_color :background
                    "URxvt*color0:" (. (groups.mainBG) 1)
                    "URxvt*color1:" (. (colors.normal-colors) :red)
                    "URxvt*color2:" (. (colors.normal-colors) :green)
                    "URxvt*color3:" (. (colors.normal-colors) :orange)
                    "URxvt*color4:" (. (colors.normal-colors) :blue)
                    "URxvt*color5:" (. (colors.normal-colors) :pink)
                    "URxvt*color6:" (. (colors.normal-colors) :purple)
                    "URxvt*color7:" (. (groups.mainFG) 1)
                    "URxvt*color8:" (. (groups.umbraBG) 1)
                    "URxvt*color15:" (. (groups.umbraFG) 1)}]
        (if (= (. main.background-mut 1) :light)
            (do
              (tset output "URxvt*color9:"
                    (ucolors.darken (. (colors.normal-colors) :red) 0.2))
              (tset output "URxvt*color10:"
                    (ucolors.darken (. (colors.normal-colors) :green) 0.2))
              (tset output "URxvt*color11:"
                    (ucolors.darken (. (colors.normal-colors) :orange) 0.2))
              (tset output "URxvt*color12:"
                    (ucolors.darken (. (colors.normal-colors) :blue) 0.2))
              (tset output "URxvt*color13:"
                    (ucolors.darken (. (colors.normal-colors) :pink) 0.2))
              (tset output "URxvt*color14:"
                    (ucolors.darken (. (colors.normal-colors) :purple) 0.2)))
            (do
              (tset output "URxvt*color9:"
                    (ucolors.brighten (. (colors.normal-colors) :red) 0.2))
              (tset output "URxvt*color10:"
                    (ucolors.brighten (. (colors.normal-colors) :green) 0.2))
              (tset output "URxvt*color11:"
                    (ucolors.brighten (. (colors.normal-colors) :orange) 0.2))
              (tset output "URxvt*color12:"
                    (ucolors.brighten (. (colors.normal-colors) :blue) 0.2))
              (tset output "URxvt*color13:"
                    (ucolors.brighten (. (colors.normal-colors) :pink) 0.2))
              (tset output "URxvt*color14:"
                    (ucolors.brighten (. (colors.normal-colors) :purple) 0.2))))
        output))

;; FN -- output rxvt string to a file at the current working directory
(defn output! [] (let [file-name (string.format "Urxvt-%s-%s.Xresources"
                                                (tostring vim.g.colors_name)
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
