(module katdotnvim.main
        {autoload {options katdotnvim.utils.options.init
                   message katdotnvim.utils.message.init
                   color katdotnvim.color
                   override katdotnvim.utils.override.init
                   run katdotnvim.utils.highlight.run
                   json katdotnvim.utils.json.init
                   read katdotnvim.utils.json.read}
         require-macros [katcros-fnl.macros.nvim.api.options.macros
                         katcros-fnl.macros.nvim.api.utils.macros]})

;;; Main plugin interface

;; fnlfmt: skip
(defn init [in-contrast] "Main plugin interface"
      ;; Set defaults
      (options.default)

      ;; Setup colorscheme
      (when vim.g.colors_name
        (do-ex highlight "clear"))
      (when (do-viml exists :syntax_on)
        (do-ex syntax "reset"))

      ;; Define variations for kat.nvim
      ;; For mutability reasons, I use a 1 key seq table for contrast and background.
      ;; This may or may not change in name, but won't change in principle as I really
      ;; -prefer 'def' for modules
      (def contrast in-contrast)
      (def background vim.o.background)
      (def contrast-mut [in-contrast])
      (def background-mut [vim.o.background])
      (color.update) ; absolutely needed to set all the colors properly
      (if (= (. contrast-mut 1) :hard)
          (set-var g :colors_name :kat.nvim)
          (set-var g :colors_name :kat.nwim))

      ;; Load colors
      (let [has-render (override.main-files)
            matcher (string.format "%s-%s.json" vim.g.colors_name background)
            integrations (let [output {}]
                           (each [_ v (pairs vim.g.kat_nvim_integrations)]
                             (tset output (.. "integrations." v) true))
                           (each [_ v (pairs vim.g.kat_nvim_filetype)]
                             (tset output (.. "filetype." v) true))
                           output)]
        ;; This path is if we had found the files in stdpath('data').
        ;; TODO rewrite json loading to go through iteratively.
        ;; This will allow functional colors so *always* be loaded if the json file
        ;; -isn't found.
        (if has-render
          (do
            (run.highlight$<-table (read.file! :main))
            (run.highlight$<-table (read.file! :syntax))
            (each [file _ (pairs has-render)]
              (when (string.find file matcher 1 true)
                (each [key _ (pairs integrations)]
                  (when (string.find file key 1 true)
                    (run.highlight$<-table (read.full-file! file))))))
            ;; From here to there doesn't need to be done until after any other loading
            ;; from here
            ((. (require :katdotnvim.highlights.terminal) :init))
            (if (= vim.g.kat_nvim_stupidFeatures true)
              ((. (require :katdotnvim.stupid) :stupidFunction)))
            (require :katdotnvim.utils.export.init)
            ((. (require :katdotnvim.utils.export.render) :init))
            ;; to there
            ;; Load in overrides from end user
            (let [has-overrides (override.files)]
              (when has-overrides
                (each [file _ (pairs has-overrides)]
                  (when (string.find file matcher 1 true)
                    (run.highlight$<-table (read.full-file! file)))))))
          ;; Run dynamically generated colors
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
            ;; Load in overrides from end user
            (let [has-overrides (override.files)]
              (when has-overrides
                (each [file _ (pairs has-overrides)]
                  (when (string.find file matcher 1 true)
                    (run.highlight$<-table (read.full-file! file))))))))))
