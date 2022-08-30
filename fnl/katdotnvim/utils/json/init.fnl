(module katdotnvim.utils.json.init)

;;; JSON manipulation

(defonce std-data (let [path (vim.fn.stdpath :data)]
                    (.. path "/kat")))

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

(defonce path (.. std-data "/kat.nvim/json/"))

(defn encode [tbl] "Encode lua table as a json"
  (let [encodee []
        source tbl]
    (each [_ value (pairs source)]
      ;; check for function
      (if (and (= (type value) :function) (not= (value) nil))
          (each [_ nest (pairs [(value)])]
            (table.insert encodee nest))
          (or (= (type value) :table) (not= (value) nil))
          ;; if just table
          (if (= (type (?. value 1)) :table)
              (each [_ nest (pairs value)]
                (table.insert encodee nest))
              (table.insert encodee value))))
    (vim.json.encode encodee)))

(defn decode [json] "Decode json into a lua table" (vim.json.decode json))

(defn ->file! [file json] "Store json to file" (os.execute (.. "rm " file))
      (with-open [json-file (io.open file :w)]
        (json-file:write json)))

(defn <-file [file] "Read stored json"
      (let [json-file (io.open file :r)]
        (if json-file
          (do (json-file:read :*a)
            (io.close json-file))
          "{}")))

(defn file-parse [suffix] "Returns 'high-colors' function from a file
Searches from 'katdotnvim.highlights'"
  (let [file (string.format "katdotnvim.highlights.%s" suffix)]
    ((. (require file) :high-colors))))
