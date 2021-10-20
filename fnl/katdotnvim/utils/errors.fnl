(module katdotnvim.utils.errors)

; this module handles error messages

(defn errMessage [errType message]
  (let [errType (tostring errType)
        message (tostring message)]
    (def- output (.. "kat.nvim E" errType ": " message))
    (print "out " output)
    (vim.api.nvim_err_writeln output)))

(defn setDefaults []
  (set vim.g.kat_nvim_settings
       {:style :dark
        :contrast :hard
        :commentStyle :italic
        :stupidFeatures false}))
