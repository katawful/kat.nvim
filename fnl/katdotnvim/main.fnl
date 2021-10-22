(module katdotnvim.main
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.color
                   errors katdotnvim.utils.errors
                   }
         require-macros [katdotnvim.utils.macros]
         })

; define some defaults
(errors.setDefaults true)

(defn init []
  (vim.cmd "highlight clear")
  (if (= (vim.fn.exists :syntax_on) true)
    (vim.cmd "syntax reset"))

  (set- termguicolors true)
  (let- :g colors_name "kat.nvim")
  (if (= vim.g.kat_nvim_style :dark)
    (set- background :dark)
    (= vim.g.kat_nvim_style :light)
    (set- background :light)
    (do
      (errors.errMessage 1 (.. vim.g.kat_nvim_style " is not a valid setting, defaulting to 'dark'"))
      (errors.setDefaults false)
      (set- background :dark)))

  ((. (require :katdotnvim.highlights.main) :init))
  ((. (require :katdotnvim.highlights.syntax) :init))
  ((. (require :katdotnvim.highlights.treesitter) :init))
  ((. (require :katdotnvim.highlights.terminal) :init))
  (if (= vim.g.kat_nvim_stupidFeatures true)
    ((. (require :katdotnvim.stupid) :stupidFunction)))
  ((. (require :katdotnvim.highlights.lsp) :init))
  )
