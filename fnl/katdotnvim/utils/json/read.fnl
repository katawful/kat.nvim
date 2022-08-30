(module katdotnvim.utils.json.read
  {autoload {json katdotnvim.utils.json.init}})

;;; Handles reading json files

(defonce header (string.format "%s" json.path))

(defn file! [file] "Reads a json file"
  (json.decode (json.<-file (.. json.path file ".json"))))