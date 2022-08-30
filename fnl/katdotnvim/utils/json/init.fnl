(module katdotnvim.utils.json.init)

;;; JSON manipulation

(defonce std-data (let [path (vim.fn.stdpath :data)]
                    (.. path "/kat")))

(defonce files [:main
                :syntax
                :integrations.airline
                :integrations.bufferline
                :integrations.cmp
                :integrations.coc
                :integrations.fugitive
                :integrations.gitsigns
                :integrations.indent_blankline
                :integrations.lightline
                :integrations.lsp
                :integrations.startify
                :integrations.treesitter
                :integrations.ts_rainbow
                :filetype.markdown
                :filetype.vim
                :filetype.vimwiki])

(defonce path (.. std-data "/kat.nvim/json/"))

(defn encode [table] "Encode lua table as a json" (vim.json.encode table))

(defn decode [json] "Decode json into a lua table" (vim.json.decode json))

(defn ->file! [file json] "Store json to file" (os.execute (.. "rm " file))
      (with-open [json-file (io.open file :w)]
        (json-file:write json)))

(defn <-file [file] "Read stored json"
      (with-open [json-file (io.open file :r)]
        (if json-file
            (json-file:read :*a)
            "{}")))

(defn file-parse [suffix] "Returns 'high-colors' function from a file
Searches from 'katdotnvim.highlights'"
  (let [file (string.format "katdotnvim.highlights.%s" suffix)]
    ((. (require file) :high-colors))))
