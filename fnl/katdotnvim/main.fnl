(module katdotnvim.main
        {autoload {options katdotnvim.utils.options.init
                   message katdotnvim.utils.message.init
                   color katdotnvim.color
                   override katdotnvim.utils.override.init
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
      (let [has-render (override.main-files)
            matcher (string.format "%s-%s.json" vim.g.colors_name background)
            integrations (let [output {}]
                           (each [_ v (pairs vim.g.kat_nvim_integrations)]
                             (tset output (.. "integrations." v) true))
                           (each [_ v (pairs vim.g.kat_nvim_filetype)]
                             (tset output (.. "filetype." v) true))
                           output)]
        (if has-render
          (do
            (run.highlight$<-table (read.file! :main))
            (run.highlight$<-table (read.file! :syntax))
            (each [file _ (pairs has-render)]
              (when (string.find file matcher 1 true)
                (each [key _ (pairs integrations)]
                  (when (string.find file key 1 true)
                    (run.highlight$<-table (read.full-file! file))))))
            ((. (require :katdotnvim.highlights.terminal) :init))
            (if (= vim.g.kat_nvim_stupidFeatures true)
              ((. (require :katdotnvim.stupid) :stupidFunction)))
            (require :katdotnvim.utils.export.init)
            (let [has-overrides (override.files)]
              (when has-overrides
                (each [file _ (pairs has-overrides)]
                  (when (string.find file matcher 1 true)
                    (run.highlight$<-table (read.full-file! file)))))))
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
              ((. (require output) :init)))
            (let [has-overrides (override.files)]
              (when has-overrides
                (each [file _ (pairs has-overrides)]
                  (when (string.find file matcher 1 true)
                    (run.highlight$<-table (read.full-file! file))))))))))
