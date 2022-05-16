(module katdotnvim.utils.highlight.init
  {autoload {s aniseed.string}})

;;; Handles general manipulation of highlight groups

(defn group [table]
  "Get the group name of a highlight group"
  table.group)

(defn gui-fg [table]
  "Get the gui foreground of a highlight group"
  table.fg)

(defn gui-bg [table]
  "Get the gui background of a highlight group"
  table.bg)

(defn term-fg [table]
  "Get the term foreground of a highlight group"
  table.ctermfg)

(defn term-bg [table]
  "Get the term background of a highlight group"
  table.ctermbg)

(defn special [table]
  "Get the special colors of a highlight group"
  (?. table :sp))

(defn blend [table]
  "Get the blend of a highlight group"
  (?. table :blend))

(defn attr->table [table#]
  "Get the boolean attributes of a highlight group as a table"
  (let [output []]
    (each [k v (pairs table#)]
      (if (= v true)
        (table.insert output k)))
    output))

(defn all-attr->table [table#]
  (let [output {}]
      (each [k v (pairs table#)]
        (if (or (= v true) (= v false))
          (tset output k v)))
      output))

(defn attr->string [table]
  "Get the boolean attributes of a highlight group as a string
that is compatible with Vimscript's highlight function"
  (s.join "," (attr->table table)))

