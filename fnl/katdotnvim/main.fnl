(module katdotnvim.main
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.color
                   errors katdotnvim.utils.errors
                   }
         require-macros [katdotnvim.utils.macros]
         })


(defn init [style contrast]
  ; define some defaults
  (errors.setDefaults true)

  (when vim.g.colors_name
    (vim.cmd "highlight clear"))
  (when (= (vim.fn.exists :syntax_on) 1)
      (vim.cmd "syntax reset"))

  (set- termguicolors true)

  (def katStyle style)
  (def katContrast contrast)

  ; set background and g:colors_name
  (if (= katStyle :dark)
      (do
        (if (= katContrast :hard)
            (let- :g :colors_name "kat.nvim")
            (let- :g :colors_name "kat.nvim-owo"))
        (set- background :dark))
      (= katStyle :light)
      (do
        (if (= katContrast :hard)
            (let- :g :colors_name "kat.lightenvim")
            (let- :g :colors_name "kat.lightenvim-owo"))
        (set- background :light)))

  (. (require :katdotnvim.color))
  ((. (require :katdotnvim.highlights.main) :init))
  ((. (require :katdotnvim.highlights.syntax) :init))
  ((. (require :katdotnvim.highlights.terminal) :init))
  (if (= vim.g.kat_nvim_stupidFeatures true)
      ((. (require :katdotnvim.stupid) :stupidFunction)))

  ; add integrations
  (each [_ v (ipairs vim.g.kat_nvim_integrations)]
    (def output (.. "katdotnvim.highlights." v))
    ((. (require output) :init)))
  (each [_ v (ipairs vim.g.kat_nvim_filetype)]
    (def output (.. "katdotnvim.highlights.filetype." v))
    ((. (require output) :init)))
  )
