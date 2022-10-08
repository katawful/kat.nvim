(module katdotnvim.utils.json.write
        {autoload {json katdotnvim.utils.json.init
                   main katdotnvim.main
                   color-table katdotnvim.color}
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

(defn colors [dir] "Writes colors table to file for much faster startup"
      ; (do-ex colorscheme :kat.nvim)
      (let [colors [[:light :soft :kat.nwim]
                    [:light :hard :kat.nvim]
                    [:dark :soft :kat.nwim]
                    [:dark :hard :kat.nvim]]]
        (set main.background-mut [])
        (set main.contrast-mut [])
        (set main.colors-name-mut [])
        (each [_ v (pairs colors)]
          (tset main.background-mut 1 (. v 1))
          (tset main.contrast-mut 1 (. v 2))
          (tset main.colors-name-mut 1 (. v 3))
          (json.->file! (string.format "%s/colors-%s-%s.json" dir (. v 3)
                                       (. v 1))
                        (json.encode-simple (color-table.output))))
        (tset main.background-mut 1 old-background)
        (tset main.contrast-mut 1 old-contrast)
        (tset main.colors-name-mut 1 old-colors-name)))
