(module katdotnvim.utils.json.write
  {require {json katdotnvim.utils.json.init
            main katdotnvim.main}})

;;; Handles writing json to file

(defonce header (string.format "%s" json.path))

(defn file! [file json] "Writes a json file to std"
  (vim.fn.system (string.format "mkdir -p %s" header))
  (json.->file! (string.format "%s/%s-%s-%s.json" json.path file
                               vim.g.colors_name (. main.background-mut 1))
                json))

(defn override-file! [source-json override colors_name] "Writes a json file to std for overriding"
  (vim.fn.system (string.format "mkdir -p %s" header))
  (vim.fn.system (string.format "mkdir -p %s" (.. header override)))
  (json.->file! (string.format "%s%s/%s-%s.json" header override
                               colors_name (. main.background-mut 1)) source-json))
