(module katdotnvim.main
  {autoload {colors katdotnvim.color
             ucolors katdotnvim.utils.color
             errors katdotnvim.utils.errors}
   require-macros [katdotnvim.utils.macros.vimscript.macros]})

;;; Main plugin interface

(defn init [in-contrast]
  ; define some defaults
  (errors.options->default true)

  (when vim.g.colors_name
    (vim.cmd "highlight clear"))
  (when (= (vim.fn.exists :syntax_on) 1)
    (vim.cmd "syntax reset"))

  ; (set- termguicolors true)

  (def contrast in-contrast)

  ; set g:colors_name for hard and soft themes
  (if (= contrast :hard)
    (let- :g :colors_name "kat.nvim")
    (let- :g :colors_name "kat.nwim"))

  ((. (require :katdotnvim.highlights.main) :init))
  ((. (require :katdotnvim.highlights.syntax) :init))
  ((. (require :katdotnvim.highlights.terminal) :init))
  (if (= vim.g.kat_nvim_stupidFeatures true)
    ((. (require :katdotnvim.stupid) :stupidFunction)))
  (require :katdotnvim.utils.export.init)

  ; add integrations
  (each [_ v (ipairs vim.g.kat_nvim_integrations)]
    (local output (.. "katdotnvim.highlights.integrations." v))
    ((. (require output) :init)))
  (each [_ v (pairs vim.g.kat_nvim_filetype)]
    (local output (.. "katdotnvim.highlights.filetype." v))
    ((. (require output) :init))))
