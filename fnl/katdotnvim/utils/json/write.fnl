(module katdotnvim.utils.json.write
  {require {json katdotnvim.utils.json.init}})

;;; Handles writing json to file

(defonce header (string.format "%s" json.path))

(defn file! [file json] "Writes a json file to std"
  (vim.fn.system (string.format "mkdir -p %s" header))
  (json.->file! (string.format "%s/%s-%s-%s.json" json.path file
                               vim.g.colors_name vim.o.background)
                json))

(defn override-file! [source-json override] "Writes a json file to std for overriding"
  (vim.fn.system (string.format "mkdir -p %s" header))
  (vim.fn.system (string.format "mkdir -p %s" (.. header override)))
  (json.->file! (string.format "%s%s/%s-%s.json" header override
                               vim.g.colors_name vim.o.background) source-json))
