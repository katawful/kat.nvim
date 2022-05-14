;;; katcros-fnl: Fennel macros, predominantly for Neovim development
;;; Copyright (C) 2022 Kat

;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation, either version 3 of the License, or
;;; (at your option) any later version.

;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.

;;; You should have received a copy of the GNU General Public License
;;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

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

