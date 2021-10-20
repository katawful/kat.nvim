(module katdotnvim.color
        {autoload {ucolors katdotnvim.utils.color}})

; this file contains all the pre-defined colors

; background and foreground colors
; these are predefined, they don't need to be generated numerically
; TODO find a way to do these dynamically, i don't like hardcoding this
(when (= (. vim.g.kat_nvim_settings :style) :dark)
  (def background
    {1 "#121c2d"
     2 "#1c2e4a"
     3 "#2c466e"
     4 "#46689c"
     5 "#6690d0"
     6 "#78adff"
     })
  ; (def background
  ;   {1 "#121c2d"
  ;    2 (ucolors.brighten "#121c2d" 0.1)
  ;    3 (ucolors.brighten "#121c2d" 0.2)
  ;    4 (ucolors.brighten "#121c2d" 0.35)
  ;    5 (ucolors.brighten "#121c2d" 0.5)
  ;    6 (ucolors.brighten "#121c2d" 0.7)
  ;    })
  (def foreground
    {1 "#daf6ff"
     2 "#b5d5df"
     3 "#8dbcca"
     4 "#699faf"
     5 "#4f7e8c"
     6 "#325049"
     })
  ; (def foreground
  ;   {1 "#daf6ff"
  ;    2 (ucolors.darken "#daf6ff" 0.1)
  ;    3 (ucolors.darken "#daf6ff" 0.2)
  ;    4 (ucolors.darken "#daf6ff" 0.35)
  ;    5 (ucolors.darken "#daf6ff" 0.5)
  ;    6 (ucolors.darken "#daf6ff" 0.7)
  ;    })
  )
; else if color is light
(when (= (. vim.g.kat_nvim_settings :style) :light)
  (def background
    {1 "#daf6ff"
     2 "#b5d5df"
     3 "#8dbcca"
     4 "#699faf"
     5 "#4f7e8c"
     6 "#325049"
     })
  (def foreground
    {1 "#121c2d"
     2 "#1c2e4a"
     3 "#2c466e"
     4 "#46689c"
     5 "#6690d0"
     6 "#78adff"
     })
  )

; define colors
(def normalColors
  {:red :#eb4949
   :green :#2ce0aa
   :orange :#f2b15c
   :pink :#f29cb1
   :purple :#7a53a8
   :blue :#2dacd2
   })
