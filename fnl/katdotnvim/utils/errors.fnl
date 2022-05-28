(module katdotnvim.utils.errors
        {require-macros [katdotnvim.katcros-fnl.macros.nvim.api.options.macros]})

;;; Module for error time management

;; FN -- create an error message
;; @error-type -- the specified error type for easier troubleshooting, a number
;; @message -- a string message
(defn message$ [error-type message test]
      "Send a Neovim error message via vim.notify"
      (let [error-type (tostring error-type)
            message (tostring message)]
        (let [output (string.format "kat.nvim E%s: %s" error-type message)]
          (when (and (= test nil))
            (vim.notify output vim.log.levels.ERROR))
          output)))

;; FN -- set plugin to default options
;; @check -- boolean to see if we need to test if option exists
(defn options->default [check] "Set all plugin options to default"
      (if (= check true)
          (do
            (if (= (vim.fn.exists :kat_nvim_commentStyle) 0)
                (let- :g :kat_nvim_commentStyle :italic))
            (if (= (vim.fn.exists :kat_nvim_compile_enable) 0)
                (let- :g :kat_nvim_compile_enable 0))
            (if (= (vim.fn.exists :kat_nvim_integrations) 0)
                (let- :g :kat_nvim_integrations
                      [:treesitter
                       :lsp
                       :ts_rainbow
                       :indent_blankline
                       :startify
                       :coc
                       :cmp
                       :fugitive]))
            (if (= (vim.fn.exists :kat_nvim_max_version) 0)
                (let- :g :kat_nvim_max_version
                      (if (= (vim.fn.has :nvim-0.7) 0) :0.6 :0.7)))
            (if (= (vim.fn.exists :kat_nvim_filetype) 0)
                (let- :g :kat_nvim_filetype [:vim :vimwiki :markdown]))
            (if (= (vim.fn.exists :kat_nvim_stupidFeatures) 0)
                (let- :g :kat_nvim_stupidFeatures false))
            (if (= (vim.fn.exists :kat_nvim_dontRender) 0)
                (let- :g :kat_nvim_dontRender 0)))
          (do
            (let- :g :kat_nvim_commentStyle :italic)
            (let- :g :kat_nvim_stupidFeatures false)
            (let- :g :kat_nvim_integrations [:vim :vimwiki :markdown])
            (let- :g :kat_nvim_integrations
                  [:treesitter
                   :lsp
                   :ts_rainbow
                   :indent_blankline
                   :startify
                   :coc
                   :cmp
                   :fugitive])
            (let- :g :kat_nvim_dontRender 0)
            (let- :g :kat_nvim_compile_enable 0))))
