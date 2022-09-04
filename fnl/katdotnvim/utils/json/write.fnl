(module katdotnvim.utils.json.write
        {require {json katdotnvim.utils.json.init main katdotnvim.main}})

;;; Handles writing json to file

(defonce header (string.format "%s" json.path))

(defn file! [file source-json] "Writes a json file to std
@file -- a file name with no path
@source-json -- a valid json object"
      (vim.fn.system (string.format "mkdir -p %s" header))
      (json.->file! (string.format "%s/%s-%s-%s.json" json.path file
                                   vim.g.colors_name (. main.background-mut 1))
                    source-json))

(defn override-file! [source-json override colors_name]
      "Writes a json file to std for overriding
@source-json -- a valid json object
@override -- the name of the override
@colors_name -- name of colorscheme"
      (vim.fn.system (string.format "mkdir -p %s" header))
      (vim.fn.system (string.format "mkdir -p %s" (.. header override)))
      (json.->file! (string.format "%s%s/%s-%s.json" header override
                                   colors_name (. main.background-mut 1))
                    source-json))
