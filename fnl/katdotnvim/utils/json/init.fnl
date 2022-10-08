(module katdotnvim.utils.json.init
        {autoload {main katdotnvim.main}
         require-macros [katcros-fnl.macros.nvim.api.utils.macros]})

;;; JSON manipulation

(defonce std-data (let [path (do-viml stdpath :data)]
                    (.. path :/kat)))

;; TODO: move this somewhere better
(defonce files [:main
                :syntax
                :integrations.cmp
                :integrations.coc
                :integrations.fugitive
                :integrations.gitsigns
                :integrations.indent_blankline
                :integrations.lsp
                :integrations.startify
                :integrations.treesitter
                :integrations.ts_rainbow
                :filetype.markdown
                :filetype.vim
                :filetype.vimwiki])

(defonce path (.. std-data :/kat.nvim/json/))

(defonce header (string.format "%s" path))

;; TODO: move this somewhere better
(defn expand-table [tbl] "Expands a table so that no functions remain
@tbl -- lua table
Returns a lua table"
      (let [output []]
        (each [k value (pairs tbl)]
          ;; check for function
          (if (= (type value) :function) ;; if table and isn't empty
              (if (and (= (type (value)) :table) (?. (value) 1))
                  (each [_ nest (pairs (value))]
                    (if (= (type nest) :function)
                        ;; Execute if function
                        (table.insert output (nest))
                        (table.insert output nest)))
                  ;; else is function
                  ;; Don't pass nil
                  (when (value)
                    (table.insert output (value))))
              ;; if just table
              (= (type (?. value 1)) :table) (each [_ nest (pairs value)]
                                               (table.insert output nest))
              (table.insert output value)))
        output))

(defn encode [tbl] "Encode lua table as a json\n@tbl -- a valid Lua table"
      (-> tbl
          (expand-table)
          (vim.json.encode)))

(defn encode-simple [tbl] "Encode pure lua table as json
@tbl -- lua table with no functions"
      (vim.json.encode tbl))

;; fnlfmt: skip
(defn decode [json]
      "Decode json into a lua table
@json -- a valid json object"
      (vim.json.decode json))

(defn ->file! [file json] "Store json to file
@file -- a json file path
@json -- a valid json object"
      (os.execute (.. "rm -f " file))
      (with-open [json-file (io.open file :w)]
        (json-file:write json)))

(defn exists? [file] "See if json file exists"
      (do-viml filereadable (string.format "%s%s-%s-%s.json" header file
                                           (. main.colors-name-mut 1)
                                           (. main.background-mut 1))))

(defn <-file [file] "Read stored json
@file -- a json file path
Returns empty table upon nil file"
      (let [json-file (io.open file :r)]
        (if json-file
            (do
              (let [out (json-file:read :*a)]
                (io.close json-file)
                out))
            "{}")))

(defn file-parse [suffix]
      "Returns 'high-colors' function from a file
Searches from 'katdotnvim.highlights'
@suffix -- based on the module structure of this plugin
           with 'katdotnvim.highlights' removed from the module name"
      (let [file (string.format "katdotnvim.highlights.%s" suffix)]
        ((. (require file) :high-colors))))
