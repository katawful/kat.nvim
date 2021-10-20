(module katdotnvim.main
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.color
                   errors katdotnvim.utils.errors
                   }
         require-macros [katdotnvim.utils.macros]
         })

; define some defaults
(if (not= (vim.fn.exists "g:kat_nvim_settings") 1)
  (errors.setDefaults))

(defn init []
  (vim.cmd "highlight clear")
  (if (= (vim.fn.exists :syntax_on) true)
    (vim.cmd "syntax reset"))

  (set- termguicolors true)
  (let- :g colors_name "kat.nvim")
  (if (= (. vim.g.kat_nvim_settings :style) :dark)
    (set- background :dark)
    (= (. vim.g.kat_nvim_settings :style) :light)
    (set- background :light)
    (do
      (errors.errMessage 1 (.. (. vim.g.kat_nvim_settings :style) " is not a valid setting, defaulting to 'dark'"))
      (errors.setDefaults)
      (set- background :dark)))

  ((. (require :katdotnvim.highlights.main) :init))
  ((. (require :katdotnvim.highlights.syntax) :init))
  ((. (require :katdotnvim.highlights.treesitter) :init))
  ((. (require :katdotnvim.highlights.terminal) :init))
  (if (= vim.g.kat_nvim_settings.stupidFeatures true)
    ((. (require :katdotnvim.stupid) :stupidFunction)))
  )
