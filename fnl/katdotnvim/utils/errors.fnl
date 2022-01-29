(module katdotnvim.utils.errors
        {require-macros [katdotnvim.utils.macros]})

; this module handles error messages

(defn errMessage [errType message]
  (let [errType (tostring errType)
        message (tostring message)]
    (local output (string.format "kat.nvim E%s: %s" errType message))
    (vim.notify output vim.log.levels.ERROR)))

(defn setDefaults [check]
  (if (= check true)
      (do
        (when (= (vim.fn.exists :kat_nvim_commentStyle) 0)
              (let- :g :kat_nvim_commentStyle :italic))
        (when (= (vim.fn.exists :kat_nvim_integrations) 0)
              (let- :g :kat_nvim_integrations
                [:treesitter
                 :lsp
                 :ts_rainbow
                 :indent_blankline
                 :startify
                 :coc
                 :cmp
                 :fugitive
                 ]))
        (when (= (vim.fn.exists :kat_nvim_filetype) 0)
              (let- :g :kat_nvim_filetype [:vim
                                           :vimwiki
                                           :markdown]))
        (when (= (vim.fn.exists :kat_nvim_stupidFeatures) 0)
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
                                           :fugitive
                                           ])))
    )
