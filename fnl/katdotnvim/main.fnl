(module katdotnvim.main
        {autoload {colors katdotnvim.color
                   ucolors katdotnvim.utils.color
                   }
         require-macros [katdotnvim.utils.macros]
         })

; define some defaults
(if (not= (vim.fn.exists "g:kat_nvim_settings") 1)
  (do
    (set vim.g.kat_nvim_settings
      {:style :dark
       })))

(defn init []
  (vim.cmd "highlight clear")
  (if (= (vim.fn.exists :syntax_on) true)
    (vim.cmd "syntax reset"))

  (set- termguicolors true)
  (let- :g colors_name :katdotnvim)
  (if (= (. vim.g.kat_nvim_settings :style) :dark)
    (set- background :dark)
    (= (. vim.g.kat_nvim_settings :style) :light)
    (set- background :light)
    (vim.api.nvim_err_writeln "E1 kat.nvim: not a valid style"))

  ((. (require :katdotnvim.highlights.main) :init)))
