(module katdotnvim.utils.errors
        {require-macros [katdotnvim.utils.macros]})

; this module handles error messages

(defn errMessage [errType message]
  (let [errType (tostring errType)
        message (tostring message)]
    (def- output (.. "kat.nvim E" errType ": " message))
    (print "out " output)
    (vim.api.nvim_err_writeln output)))

(defn setDefaults [check]
  (if (= check true)
    (do
      (when (= (vim.fn.exists :kat_nvim_style) 0)
        (let- :g :kat_nvim_style :dark))
      (when (= (vim.fn.exists :kat_nvim_contrast) 0)
        (let- :g :kat_nvim_contrast :hard))
      (when (= (vim.fn.exists :kat_nvim_commentStyle) 0)
        (let- :g :kat_nvim_commentStyle :italic))
      (when (= (vim.fn.exists :kat_nvim_integrations) 0)
        (let- :g :kat_nvim_integrations {}))
      (when (= (vim.fn.exists :kat_nvim_filetype) 0)
        (let- :g :kat_nvim_filetype {}))
      (when (= (vim.fn.exists :kat_nvim_stupidFeatures) 0)
        (let- :g :kat_nvim_stupidFeatures false)))
    (do
        (let- :g :kat_nvim_style :dark)
        (let- :g :kat_nvim_contrast :hard)
        (let- :g :kat_nvim_commentStyle :italic)
        (let- :g :kat_nvim_stupidFeatures false)
        (let- :g :kat_nvim_integrations {})
        (let- :g :kat_nvim_integrations {})))
    )
