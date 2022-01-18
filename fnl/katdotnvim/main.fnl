(module katdotnvim.main
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.color
                   errors katdotnvim.utils.errors}
         require-macros [katdotnvim.utils.macros]})


(defn init [contrast]
  ; define some defaults
  (errors.setDefaults true)

  (when vim.g.colors_name
    (vim.cmd "highlight clear"))
  (when (= (vim.fn.exists :syntax_on) 1)
      (vim.cmd "syntax reset"))

  (set- termguicolors true)

  (def katContrast contrast)

  ; set g:colors_name for hard and soft themes
  (if (= katContrast :hard)
    (let- :g :colors_name "kat.nvim")
    (let- :g :colors_name "kat.nwim"))

  ((. (require :katdotnvim.highlights.main) :init))
  ((. (require :katdotnvim.highlights.syntax) :init))
  ((. (require :katdotnvim.highlights.terminal) :init))
  (if (= vim.g.kat_nvim_stupidFeatures true)
      ((. (require :katdotnvim.stupid) :stupidFunction)))

  ; add integrations
  (each [_ v (ipairs vim.g.kat_nvim_integrations)]
    (local output (.. "katdotnvim.highlights.integrations." v))
    ((. (require output) :init)))
  (each [_ v (ipairs vim.g.kat_nvim_filetype)]
    (local output (.. "katdotnvim.highlights.filetype." v))
    ((. (require output) :init))))
