(module katdotnvim.utils.json.read
        {autoload {json katdotnvim.utils.json.init main katdotnvim.main}})

;;; Handles reading json files

(defonce header (string.format "%s" json.path))

(defn file! [file]
      "Reads a json file\n@file -- pathless, extensionless file name"
      (json.decode (json.<-file (string.format "%s%s-%s-%s.json" header file
                                               vim.g.colors_name
                                               (. main.background-mut 1)))))

(defn full-file! [full-file] "Reads from a full file path
@full-file -- full file path to a json file"
      (json.decode (json.<-file (string.format "%s%s" header full-file))))
