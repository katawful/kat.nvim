(module katdotnvim.utils.options.init
        {require-macros [katdotnvim.katcros-fnl.macros.nvim.api.options.macros]})

;;; Module for option management

;; FN -- set global values to default by force
(defn default* [] "Set all plugin options to default by force"
      (let- :g :kat_nvim_commentStyle :italic)
      (let- :g :kat_nvim_stupidFeatures false)
      (let- :g :kat_nvim_integrations [:vim :vimwiki :markdown])
      (let- :g :kat_nvim_integrations
            [:treesitter
             :lsp
             :gitsigns
             :ts_rainbow
             :indent_blankline
             :startify
             :coc
             :cmp
             :fugitive]) (let- :g :kat_nvim_dontRender false)
      (let- :g :kat_nvim_compile_enable false))

;; FN -- check global variables and set to default values if needed
(defn default []
      "Check global variables and set to default if no value was set"
      (if (= (vim.fn.exists :kat_nvim_commentStyle) 0)
          (let- :g :kat_nvim_commentStyle :italic))
      (if (= (vim.fn.exists :kat_nvim_compile_enable) 0)
          (let- :g :kat_nvim_compile_enable false))
      (if (= (vim.fn.exists :kat_nvim_integrations) 0)
          (let- :g :kat_nvim_integrations
                [:treesitter
                 :lsp
                 :gitsigns
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
          (let- :g :kat_nvim_dontRender false)))
