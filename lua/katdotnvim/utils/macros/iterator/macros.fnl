;; takes a value and puts it into a sequential table for a certain number of times
(fn value->table [iterator# number-over# value-to-in#]
  `(do
    (local in-table# [])
    (for [,iterator# 1 ,number-over#]
      (local value-from-in# ,value-to-in#) 
      (tset in-table# ,iterator# value-from-in#))
    in-table#))

{:value->table value->table}
