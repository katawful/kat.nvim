(module katdotnvim.utils.json.write
  {autoload {json katdotnvim.utils.json.init}})

;;; Handles writing json to file

(defonce header (string.format "%s" json.path))

(defn file! [file] "Writes a json file to std"
  (vim.fn.system (string.format "mkdir -p %s" header))
  (json.->file! (string.format "%s/%s-%s-%s.json" json.path file
                               vim.g.colors_name vim.o.background)
                (-> file
                   (json.file-parse)
                   (json.encode))))
