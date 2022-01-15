(module katdotnvim.utils.errors
        {require-macros [katdotnvim.utils.macros]})

; this module handles error messages

(defn errMessage [errType message]
  (let [errType (tostring errType)
        message (tostring message)]
    (local output (.. "kat.nvim E" errType ": " message))
    (print "out " output)
    (vim.api.nvim_err_writeln output)))

(defn setDefaults [check]
  (if (= check true)
      (do
        (when (= (vim.fn.exists :kat_nvim_commentStyle) 0)
              (let- :g :kat_nvim_commentStyle :italic))
        (when (= (vim.fn.exists :kat_nvim_integrations) 0)
              (let- :g :kat_nvim_integrations {1 :treesitter
                                               2 :lsp
                                               3 :ts_rainbow
                                               4 :indent_blankline
                                               5 :startify
                                               6 :coc
                                               7 :cmp
                                               8 :fugitive
                                               }))
        (when (= (vim.fn.exists :kat_nvim_filetype) 0)
              (let- :g :kat_nvim_filetype {1 :vim
                                           2 :vimwiki
                                           3 :markdown}))
        (when (= (vim.fn.exists :kat_nvim_stupidFeatures) 0)
              (let- :g :kat_nvim_stupidFeatures false)))
      (do
          (let- :g :kat_nvim_commentStyle :italic)
          (let- :g :kat_nvim_stupidFeatures false)
          (let- :g :kat_nvim_integrations {1 :vim
                                           2 :vimwiki
                                           3 :markdown})
          (let- :g :kat_nvim_integrations {1 :treesitter
                                           2 :lsp
                                           3 :ts_rainbow
                                           4 :indent_blankline
                                           5 :startify
                                           6 :coc
                                           7 :cmp
                                           8 :fugitive
                                           })))
    )
