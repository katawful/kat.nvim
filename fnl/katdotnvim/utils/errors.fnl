(module katdotnvim.utils.errors
        {require-macros [katdotnvim.utils.macros.vimscript.macros]})

;;; Module for error time management

;; FN -- create an error message
;; @error-type -- the specified error type for easier troubleshooting, a number
;; @message -- a string message
(defn message$ [error-type message]
  (let [error-type (tostring error-type)
        message (tostring message)]
    (let [output (string.format "kat.nvim E%s: %s" error-type message)]
      (vim.notify output vim.log.levels.ERROR))))

;; FN -- set plugin to default options
;; @check -- boolean to see if we need to test if option exists
(defn options->default [check]
  (if (= check true)
      (do
        (if (= (vim.fn.exists :kat_nvim_commentStyle) 0)
            (let- :g :kat_nvim_commentStyle :italic))
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
        (if (= (vim.fn.exists :kat_nvim_filetype) 0)
            (let- :g :kat_nvim_filetype [:vim
                                         :vimwiki
                                         :markdown]))
        (if (= (vim.fn.exists :kat_nvim_stupidFeatures) 0)
            (let- :g :kat_nvim_stupidFeatures false)))
      (do
          (let- :g :kat_nvim_commentStyle :italic)
          (let- :g :kat_nvim_stupidFeatures false)
          (let- :g :kat_nvim_integrations [:vim
                                           :vimwiki
                                           :markdown])
          (let- :g :kat_nvim_integrations [:treesitter
                                           :lsp
                                           :ts_rainbow
                                           :indent_blankline
                                           :startify
                                           :coc
                                           :cmp
                                           :fugitive]))))
