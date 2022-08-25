(module katdotnvim.main
        {autoload {options katdotnvim.utils.options.init
                   message katdotnvim.utils.message.init}
         require-macros [katdotnvim.katcros-fnl.macros.nvim.api.options.macros
                         katdotnvim.katcros-fnl.macros.nvim.api.utils.macros]})

;;; Main plugin interface

;; fnlfmt: skip
(defn init [in-contrast] "Main plugin interface"
      (options.default) ; define some defaults

      (when (not (do-viml has :nvim-0.7))
        (do
          (fn mess [] (message.warn$ (message.<-table :utils.highlight.init
                                                      :0.6-deprecation)))
          (vim.defer_fn mess 1000)))
      (when vim.g.colors_name
        (vim.cmd "highlight clear"))
      (when (= (vim.fn.exists :syntax_on) 1)
        (vim.cmd "syntax reset"))
      (def contrast in-contrast)
      (def background vim.o.background)
      ;; set g:colors_name for hard and soft themes
      (if (= contrast :hard)
          (let- :g :colors_name :kat.nvim)
          (let- :g :colors_name :kat.nwim))
      (if (= vim.g.kat_nvim_dontRender true)
          ;; do the dynamic path
          (do
            ((. (require :katdotnvim.highlights.main) :init))
            ((. (require :katdotnvim.highlights.syntax) :init))
            ((. (require :katdotnvim.highlights.terminal) :init))
            (if (= vim.g.kat_nvim_stupidFeatures true)
                ((. (require :katdotnvim.stupid) :stupidFunction)))
            (require :katdotnvim.utils.export.init)
            ;; add integrations
            ((. (require :katdotnvim.utils.export.render) :init))
            (each [_ v (ipairs vim.g.kat_nvim_integrations)]
              (local output (.. :katdotnvim.highlights.integrations. v))
              ((. (require output) :init)))
            (each [_ v (pairs vim.g.kat_nvim_filetype)]
              (local output (.. :katdotnvim.highlights.filetype. v))
              ((. (require output) :init))))
          ;; do the prerendered path
          (do
            ((. (require (.. :katdotnvim.exported.main- background "-" contrast))
                :init))
            ((. (require (.. :katdotnvim.exported.syntax- background "-"
                             contrast)) :init))
            ((. (require :katdotnvim.highlights.terminal) :init))
            (if (= vim.g.kat_nvim_stupidFeatures true)
                ((. (require :katdotnvim.stupid) :stupidFunction)))
            (require :katdotnvim.utils.export.init) 
            ;; add integrations
            ((. (require :katdotnvim.utils.export.render) :init))
            (each [_ v (ipairs vim.g.kat_nvim_integrations)]
              (local output
                     (.. :katdotnvim.exported.integrations. v "-" background
                         "-" contrast))
              (when (not= v :gitsigns)
                ((. (require output) :init))))
            (each [_ v (pairs vim.g.kat_nvim_filetype)]
              (local output (.. :katdotnvim.exported.filetype. v "-" background
                                "-" contrast))
              ((. (require output) :init))))))
