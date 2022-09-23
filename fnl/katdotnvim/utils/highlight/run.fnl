(module katdotnvim.utils.highlight.run
        {autoload {apply katdotnvim.utils.highlight.init}})

;;; Handles running of highlight groups

;; FN -- highlight Neovim with a table of table of values
;; @high-table -- table to highlight

;; fnlfmt: skip
(defn highlight$<-table [high-table]
      "Highlight Neovim from a higlight table
Handles evaluating functions and nested tables"
      (each [_ value (pairs high-table)]
        ;; In some cases we have a function to handle different kinds of
        ;; -highlighting of some groups.
        ;; Make sure that function does not return incase its not relevant.
        (if (and (= (type value) :function) (not= (value) nil))
            (if (and (= (type (value)) :table) (?. (value) 1))
              (each [_ nest (pairs (value))]
                (if (= (type nest) :function)
                  (apply.highlight$ (nest))
                  (apply.highlight$ nest)))
              (apply.highlight$ (value)))
            ;; Everything else should just be a table, but still make sure that
            ;; -the nil returning function doesn't go through.
            (or (= (type value) :table) (not= (value) nil))
            (do
              ;; just check if we have a nested table or not
              (if (= (type (?. value 1)) :table)
                  (each [_ nest (pairs value)]
                    (apply.highlight$ nest))
                  (apply.highlight$ value))))))
