(module katdotnvim.highlights.terminal
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.color
                   syntax katdotnvim.highlights.syntax
                   groups katdotnvim.highlights.main
                   }
         require-macros [katdotnvim.utils.macros]
         })

; this affects the terminal

(defn init []
  (let- :g :terminal_color_0 (. colors.background 1))
  (let- :g :terminal_color_1 (. colors.normalColors :red))
  (let- :g :terminal_color_2 (. colors.normalColors :green))
  (let- :g :terminal_color_3 (. colors.normalColors :orange))
  (let- :g :terminal_color_4 (. colors.normalColors :blue))
  (let- :g :terminal_color_5 (. colors.normalColors :pink))
  (let- :g :terminal_color_6 (. colors.normalColors :purple))
  (let- :g :terminal_color_7 (. colors.foreground 1))
  (let- :g :terminal_color_8 (. colors.background 2))
  (if (= vim.g.kat_nvim_settings.style :light)
    (do
      (let- :g :terminal_color_9 (ucolors.darken (. colors.normalColors :red) 0.2))
      (let- :g :terminal_color_10 (ucolors.darken (. colors.normalColors :green) 0.2))
      (let- :g :terminal_color_11 (ucolors.darken (. colors.normalColors :orange) 0.2))
      (let- :g :terminal_color_12 (ucolors.darken (. colors.normalColors :blue) 0.2))
      (let- :g :terminal_color_13 (ucolors.darken (. colors.normalColors :pink) 0.2))
      (let- :g :terminal_color_14 (ucolors.darken (. colors.normalColors :purple) 0.2)))
    (do
      (let- :g :terminal_color_9 (ucolors.brighten (. colors.normalColors :red) 0.2))
      (let- :g :terminal_color_10 (ucolors.brighten (. colors.normalColors :green) 0.2))
      (let- :g :terminal_color_11 (ucolors.brighten (. colors.normalColors :orange) 0.2))
      (let- :g :terminal_color_12 (ucolors.brighten (. colors.normalColors :blue) 0.2))
      (let- :g :terminal_color_13 (ucolors.brighten (. colors.normalColors :pink) 0.2))
      (let- :g :terminal_color_14 (ucolors.brighten (. colors.normalColors :purple) 0.2))))
  (let- :g :terminal_color_15 (. colors.foreground 2))
  )

; let g:terminal_color_0 = s:kat.16[0]
; let g:terminal_color_1 = s:kat.16[1]
; let g:terminal_color_2 = s:kat.16[2]
; let g:terminal_color_3 = s:kat.16[3]
; let g:terminal_color_4 = s:kat.16[4]
; let g:terminal_color_5 = s:kat.16[5]
; let g:terminal_color_6 = s:kat.16[6]
; let g:terminal_color_7 = s:kat.16[7]
; let g:terminal_color_8 = s:kat.16[8]
; let g:terminal_color_9 = s:kat.16[9]
; let g:terminal_color_10 = s:kat.16[10]
; let g:terminal_color_11 = s:kat.16[11]
; let g:terminal_color_12 = s:kat.16[12]
; let g:terminal_color_13 = s:kat.16[13]
; let g:terminal_color_14 = s:kat.16[14]
; let g:terminal_color_15 = s:kat.16[15]
