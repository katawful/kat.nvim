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
  ((. (require :katdotnvim.highlights.main) :init)))
