(module katdotnvim.utils.json.read
        {autoload {json katdotnvim.utils.json.init
                   main katdotnvim.main}})

;;; Handles reading json files

(defonce header (string.format "%s" json.path))

;; fnlfmt: skip
(defn file! [file]
      "Reads a json file
@file -- pathless, extensionless file name"
      (json.decode (json.<-file (string.format "%s%s-%s-%s.json" header file
                                               (. main.colors-name-mut 1)
                                               (. main.background-mut 1)))))

(defn full-file! [full-file] "Reads from a full file path
@full-file -- full file path to a json file"
      (json.decode (json.<-file (string.format "%s%s" header full-file))))

(defn colors [dir] "Read colors table from file for much faster startup"
      (json.decode (json.<-file (string.format "%s/colors-%s-%s.json"
                                               dir
                                               (. main.colors-name-mut 1)
                                               (. main.background-mut 1)))))
