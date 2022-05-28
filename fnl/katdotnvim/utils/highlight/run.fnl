(module katdotnvim.utils.highlight.run
        {autoload {a aniseed.core ucolors katdotnvim.utils.color}})

;;; Handles running of highlight groups

;; FN -- highlight Neovim with a table of table of values
;; @high-table -- table to highlight
;; fnlfmt: skip
(defn highlight$<-table [high-table]
      "Highlight Neovim from a table of values
Table is: group guifg guibg termfg termbg attr special blend"
      (each [_ value (pairs high-table)] 
        ; in some cases we have a function to handle different kinds of ; highlighting of some groups ; make sure that function does not return incase its not relevant
        (if (and (= (type value) :function) (not= (value) nil))
            (do
              (each [_ nest (pairs [(value)])]
                (ucolors.highlight$ nest)))
            ; everything else should just be a table, but still make sure that ; the nil returning function doesn't go through
            (or (= (type value) :table) (not= (value) nil))
            (do
              ; just check if we have a nested table or not
              (if (= (type (?. value 1)) :table)
                  (each [_ nest (pairs value)]
                    (ucolors.highlight$ nest))
                  (ucolors.highlight$ value))))))
