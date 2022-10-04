(module katdotnvim.utils.highlight.get
        {autoload {s aniseed.string a aniseed.core}})

;;; Handles general manipulation of highlight groups

(defn group [table] "Get the group name of a highlight group" (?. table :group))

(defn gui-fg [table] "Get the gui foreground of a highlight group"
      (?. table :fg))

(defn gui-bg [table] "Get the gui background of a highlight group"
      (?. table :bg))

(defn term-fg [table] "Get the term foreground of a highlight group"
      (?. table :ctermfg))

(defn term-bg [table] "Get the term background of a highlight group"
      (?. table :ctermbg))

(defn special [table] "Get the special colors of a highlight group"
      (?. table :sp))

(defn blend [table] "Get the blend of a highlight group" (?. table :blend))

(defn link [table] "Get the linking group for a highlight group"
      (?. table :link))

(defn default [table] "Get default key for a highlight group"
      (?. table :default))

(defn all-attr->table [table#] "Get the boolean attributes of a highlight group
  as a table" 
      (let [output {}]
        (each [k v (pairs table#)]
          ;; specifically look for non-nil values
          (if (or (= v true) (= v false))
              (do
                (if (= vim.g.kat_nvim_max_version :0.8)
                    (match k
                      :underlineline (tset output :underdouble v)
                      :underdot (tset output :underdotted v)
                      :underdash (tset output :underdashed v)
                      _ (tset output k v))
                    (do
                      (tset output k v))))))
        output))
