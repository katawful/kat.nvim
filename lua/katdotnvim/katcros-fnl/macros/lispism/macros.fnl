;;; Macros to convert Lua constructs to something more Lisp-y

;; Macro -- table lookup
;; @origin -- table to search
;; @lookup -- lookup value
;; @... -- list to do on the lookupped value
(fn opt- [origin lookup ...]
  "Macro -- Lookup a value in a table, and do"
  (let [output [...]]
       `(do
          ((. (require ,origin) ,lookup)
           ,...))))

;; takes a value and puts it into a sequential table for a certain number of times
(fn value->table [iterator# number-over# value-to-in#]
  `(do
    (local in-table# [])
    (for [,iterator# 1 ,number-over#]
      (local value-from-in# ,value-to-in#) 
      (tset in-table# ,iterator# value-from-in#))
    in-table#))

{
 :opt- opt-
 :value->table value->table}

