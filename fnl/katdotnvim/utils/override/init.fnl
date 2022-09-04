(module katdotnvim.utils.override.init
  {autoload {json katdotnvim.utils.json.init}})

;;; Handles loading in overrides dynamically

(defn main-files [] "Returns a table of the main json files found, if any"
  (let [fd (vim.loop.fs_opendir json.path nil (* (length json.files) 4))
        output {}]
    (if fd
      (do
        (each [_ descriptor (pairs (vim.loop.fs_readdir fd))]
          (when (= descriptor.type :file)
            (tset output descriptor.name true)))
        (vim.loop.fs_closedir fd)
        output)
      (do nil))))
