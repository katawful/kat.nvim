(module katdotnvim.utils.options.init
        {autoload {message katdotnvim.utils.message.init}
         require-macros [katcros-fnl.macros.nvim.api.options.macros
                         katcros-fnl.macros.nvim.api.utils.macros]})

;;; Module for option management

;; FN -- set global values to default by force
(defn default* [] "Set all plugin options to default by force"
      (set-var g :kat_nvim_commentStyle :italic)
      (set-var g :kat_nvim_stupidFeatures false)
      (set-var g :kat_nvim_integrations [:vim :vimwiki :markdown])
      (set-var g :kat_nvim_integrations
               [:treesitter
                :lsp
                :gitsigns
                :ts_rainbow
                :indent_blankline
                :startify
                :coc
                :cmp
                :fugitive]) (set-var g :kat_nvim_dontRender false)
      (set-var g :kat_nvim_compile_enable false))

(def deprecation-check {:messaged false})

;; FN -- check global variables and set to default values if needed
(defn default []
      "Check global variables and set to default if no value was set"
      (if (do-viml exists :kat_nvim_commentStyle)
          (do
            (if (= deprecation-check.messaged false)
                (do
                  (fn mess []
                    (message.warn$ (string.format (message.<-table :utils.options.init
                                                                   :option-deprecation)
                                                  :vim.g.kat_nvim_commentStyle)))
                  (vim.defer_fn mess 1000))))
          (if (= deprecation-check.messaged false)
              (set-var g :kat_nvim_commentStyle :italic)))
      (if (do-viml exists :kat_nvim_compile_enable)
          (do
            (if (= deprecation-check.messaged false)
                (do
                  (fn mess []
                    (message.warn$ (string.format (message.<-table :utils.options.init
                                                                   :option-deprecation)
                                                  :vim.g.kat_nvim_compile_enable)))
                  (vim.defer_fn mess 1000)))))
      (if (not (do-viml exists :kat_nvim_integrations))
          (set-var g :kat_nvim_integrations
                   [:treesitter
                    :lsp
                    :gitsigns
                    :ts_rainbow
                    :indent_blankline
                    :startify
                    :coc
                    :cmp
                    :fugitive]))
      (if (not (do-viml exists :kat_nvim_max_version))
          (set-var g :kat_nvim_max_version
                   (do
                     ;; have 0.8 and 0.7 == 0.8
                     (if (and (do-viml has :nvim-0.8) (do-viml has :nvim-0.7))
                         :0.8
                         ;; have 0.7 and 0.6 and not 0.8 == 0.7
                         (and (do-viml has :nvim-0.7) (do-viml has :nvim-0.6)
                              (not (do-viml has :nvim-0.8)))
                         :0.7))))
      (if (not (do-viml exists :kat_nvim_filetype))
          (set-var g :kat_nvim_filetype [:vim :vimwiki :markdown]))
      (if (not (do-viml exists :kat_nvim_stupidFeatures))
          (set-var g :kat_nvim_stupidFeatures false))
      (if (do-viml exists :kat_nvim_dontRender)
          (do
            (if (= deprecation-check.messaged false)
                (do
                  (fn mess []
                    (message.warn$ (string.format (message.<-table :utils.options.init
                                                                   :option-deprecation)
                                                  :vim.g.kat_nvim_dontRender)))
                  (vim.defer_fn mess 1000)))))
      (tset deprecation-check :messaged true))
