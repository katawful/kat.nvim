(module katdotnvim.color)

; this file contains all the pre-defined colors

; background and foreground colors
; these are predefined, they don't need to be generated numerically
(when (= (. vim.g.kat_nvim_settings :style) :dark)
  (def background
    {1 "#121c2d"
     2 "#1c2e4a"
     3 "#2c466e"
     4 "#46689c"
     5 "#6690d0"
     6 "#78adff"
     })
  (def foreground
    {1 "#daf6ff"
     2 "#b5d5df"
     3 "#8dbcca"
     4 "#699faf"
     5 "#4f7e8c"
     6 "#325049"
     })
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
