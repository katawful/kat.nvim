(module katdotnvim.utils.json.write
        {require {json katdotnvim.utils.json.init main katdotnvim.main}
         require-macros [katcros-fnl.macros.nvim.api.utils.macros]})

;;; Handles writing json to file

(defonce header (string.format "%s" json.path))

(defn file! [file source-json colors_name] "Writes a json file to std
@file -- a file name with no path
@source-json -- a valid json object"
      (do-viml system (string.format "mkdir -p %s" header))
      (json.->file! (string.format "%s/%s-%s-%s.json" json.path file
                                   colors_name (. main.background-mut 1))
                    source-json))

(defn override-file! [source-json override colors_name]
      "Writes a json file to std for overriding
@source-json -- a valid json object
@override -- the name of the override
@colors_name -- name of colorscheme"
      (do-viml system (string.format "mkdir -p %s" header))
      (do-viml system (string.format "mkdir -p %s" (.. header override)))
      (json.->file! (string.format "%s%s/%s-%s.json" header override
                                   colors_name (. main.background-mut 1))
                    source-json))
