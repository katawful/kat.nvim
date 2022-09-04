(module katdotnvim.main
        {autoload {options katdotnvim.utils.options.init
                   message katdotnvim.utils.message.init
                   color katdotnvim.color
                   run katdotnvim.utils.highlight.run
                   json katdotnvim.utils.json.init
                   read katdotnvim.utils.json.read}
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
      (def contrast-mut [in-constrast])
      (def background-mut [vim.o.background])
      (color.update)
      ;; set g:colors_name for hard and soft themes
      (if (= contrast :hard)
          (let- :g :colors_name :kat.nvim)
          (let- :g :colors_name :kat.nwim))
      (let [has-render (io.open (.. json.path "main-kat.nvim-dark.json") :r)]
        (if has-render
          (do
            (run.highlight$<-table (read.file! :main))
            (run.highlight$<-table (read.file! :syntax))
            ((. (require :katdotnvim.highlights.terminal) :init))
            (if (= vim.g.kat_nvim_stupidFeatures true)
              ((. (require :katdotnvim.stupid) :stupidFunction)))
            (require :katdotnvim.utils.export.init)
            ;; add integrations
            ((. (require :katdotnvim.utils.export.render) :init))
            (each [_ v (ipairs vim.g.kat_nvim_integrations)]
              (run.highlight$<-table (read.file! (.. "integrations." v))))
            (each [_ v (pairs vim.g.kat_nvim_filetype)]
              (run.highlight$<-table (read.file! (.. "filetype." v))))
            ;; TODO - deal with overrides here
            (io.close has-render))
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
              ((. (require output) :init)))))))
