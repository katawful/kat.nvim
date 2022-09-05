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
            (do
              nil))))

(defn get-dir [] "Get directories for override files to look through"
      (let [desc-num (+ 10 (* (length json.files) 4))
            fd (vim.loop.fs_opendir json.path nil desc-num)
            output {}]
        (if fd
            (do
              (each [_ descriptor (pairs (vim.loop.fs_readdir fd))]
                (when (= descriptor.type :directory)
                  (tset output descriptor.name true)))
              (vim.loop.fs_closedir fd)
              output)
            (do
              nil))))

(defn files [] "Returns a table of override files found, if any"
      (let [desc-num 20
            dirs (get-dir)
            output {}]
        (if dirs
            (do
              (each [dir _ (pairs dirs)]
                (let [fd (vim.loop.fs_opendir (.. json.path dir) nil desc-num)]
                  (when fd
                    (do
                      (each [_ descriptor (pairs (vim.loop.fs_readdir fd))]
                        (when (= descriptor.type :file)
                          (do
                            (tset output (.. dir "/" descriptor.name) true))))))
                  (vim.loop.fs_closedir fd)))
              output)
            (do
              nil))))
