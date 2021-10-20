(module katdotnvim.color
        {autoload {ucolors katdotnvim.utils.color}})

; this file contains all the pre-defined colors
(var back {})
(var fore {})

; back and foreground colors
; these are predefined, they don't need to be generated numerically
; TODO find a way to do these dynamically, i don't like hardcoding this
(when (= (. vim.g.kat_nvim_settings :style) :dark)
  (do
    (when (= (. vim.g.kat_nvim_settings :contrast) :soft)
      (set back
           {1 "#1c2e4a"
            2 "#121c2d"
            3 "#2c466e"
            4 "#46689c"
            5 "#6690d0"
            6 "#78adff"
            }))
    (when (= (. vim.g.kat_nvim_settings :contrast) :hard)
      (set back
           {1 "#121c2d"
            2 "#1c2e4a"
            3 "#2c466e"
            4 "#46689c"
            5 "#6690d0"
            6 "#78adff"
            }))
    ; (set back
        ;   {1 "#121c2d"
             ;    2 (ucolors.brighten "#121c2d" 0.1)
             ;    3 (ucolors.brighten "#121c2d" 0.2)
             ;    4 (ucolors.brighten "#121c2d" 0.35)
             ;    5 (ucolors.brighten "#121c2d" 0.5)
             ;    6 (ucolors.brighten "#121c2d" 0.7)
             ;    })
    (when (= (. vim.g.kat_nvim_settings :contrast) :soft)
      (set fore
           {1 "#b5d5df"
            2 "#daf6ff"
            3 "#8dbcca"
            4 "#699faf"
            5 "#4f7e8c"
            6 "#325049"
            }))
    (when (= (. vim.g.kat_nvim_settings :contrast) :hard)
      (set fore
           {1 "#daf6ff"
            2 "#b5d5df"
            3 "#8dbcca"
            4 "#699faf"
            5 "#4f7e8c"
            6 "#325049"
            }))
    ; (set fore
        ;   {1 "#daf6ff"
             ;    2 (ucolors.darken "#daf6ff" 0.1)
             ;    3 (ucolors.darken "#daf6ff" 0.2)
             ;    4 (ucolors.darken "#daf6ff" 0.35)
             ;    5 (ucolors.darken "#daf6ff" 0.5)
             ;    6 (ucolors.darken "#daf6ff" 0.7)
             ;    })
    ))

  ; else if color is light
(when (= (. vim.g.kat_nvim_settings :style) :light)
  (do
    (when (= (. vim.g.kat_nvim_settings :contrast) :soft)
      (set back
        {1 "#b5d5df"
         2 "#daf6ff"
         3 "#8dbcca"
         4 "#699faf"
         5 "#4f7e8c"
         6 "#325049"
         }))
    (when (= (. vim.g.kat_nvim_settings :contrast) :hard)
      (set back
        {1 "#daf6ff"
         2 "#b5d5df"
         3 "#8dbcca"
         4 "#699faf"
         5 "#4f7e8c"
         6 "#325049"
         }))
    (when (= (. vim.g.kat_nvim_settings :contrast) :soft)
      (set fore
           {1 "#1c2e4a"
            2 "#121c2d"
            3 "#2c466e"
            4 "#46689c"
            5 "#6690d0"
            6 "#78adff"
            }))
    (when (= (. vim.g.kat_nvim_settings :contrast) :hard)
      (set fore
           {1 "#121c2d"
            2 "#1c2e4a"
            3 "#2c466e"
            4 "#46689c"
            5 "#6690d0"
            6 "#78adff"
            }))
    ))

; define colors
(def normalColors
  {:red :#eb4949
   :green :#2ce0aa
   :orange :#f2b15c
   :pink :#f29cb1
   :purple :#7a53a8
   :blue :#2dacd2
   })

(def background back)
(def foreground fore)
