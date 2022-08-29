(module katdotnvim.utils.json.init)

;;; JSON manipulation

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
