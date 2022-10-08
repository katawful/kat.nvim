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
      ;; adds ~2.5ms
      (color.update) ; absolutely needed to set all the colors properly
      (if (= (. contrast-mut 1) :hard)
          (set-var g :colors_name :kat.nvim)
          (set-var g :colors_name :kat.nwim))
      (def colors-name-mut [vim.g.colors_name])

      ;; Load colors
      ;; This falls back dynamically to functional colors if no JSON was found
      ;; adds ~5ms in functional, 3ms in json
      (let [rendered-length (do (var i 0)
                              (each [k _ (pairs (override.main-files) :until (> i 0))]
                                (set i (+ i 1)))
                              i)
            matcher (string.format "%s-%s.json" vim.g.colors_name background)
            integrations (let [output {}]
                           (each [_ v (pairs vim.g.kat_nvim_integrations)]
                             (tset output (.. "integrations." v) true))
                           (each [_ v (pairs vim.g.kat_nvim_filetype)]
                             (tset output (.. "filetype." v) true))
                           output)]
        (if (json.exists? :main)
            (run.highlight$<-table (read.file! :main))
            ((. (require :katdotnvim.highlights.main) :init)))
        (if (json.exists? :syntax)
            (run.highlight$<-table (read.file! :syntax))
            ((. (require :katdotnvim.highlights.syntax) :init)))
        ;; Very large increase in startup time
        ;; 1.5ms for json, 2-3ms for functional
        (if (> rendered-length 0)
          ;; If there's json files found:
          ;; go through integrations and load the file if it was found
            (each [key _ (pairs integrations)]
              (if (json.exists? key)
                (run.highlight$<-table (read.file! key))
                ((. (require (.. :katdotnvim.highlights. key)) :init))))
          ;; full fallback
            (do
              (each [key _ (pairs integrations)]
                (print key)
                ((. (require (.. :katdotnvim.highlights. key)) :init)))))
        ;; From here to there doesn't need to be done until after any other loading
        ;; TODO: fix loading so for somethings
        ;; very small increase in startup time, maybe 0.2ms?
        ;; doubt i need to worry
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
                (run.highlight$<-table (read.full-file! file))))))))
