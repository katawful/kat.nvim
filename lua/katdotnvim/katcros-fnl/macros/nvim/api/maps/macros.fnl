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

;;; Macro file for key maps

;; Macro -- create a normal mode map
;; Has 3 outputs
;; 1 -- No description, but opts table
;; 2 -- Description and optional opts table
;; 3 -- Just lhs and rhs
;; @lhs -- left hand map, must be a string
;; @rhs -- right hand map, can be whatever
;; @desc -- description, or opts table if no description
;; @args -- opts table when description is used
(fn nno- [lhs rhs desc args]
  "Macro -- create a normal mode map"
  (let [opts# {}]
    ; if no desc string, just insert that table
    (if (= (type desc) :table)
      (do
        `(vim.keymap.set :n ,lhs ,rhs ,desc))
      ; if a desc string, add them all to the opts table
      (= (type desc) :string)
      (do
        (tset opts# :desc desc)
        ; make sure to add the opts table
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.keymap.set :n ,lhs ,rhs ,opts#))
      ; no additional options or description
      (do
        `(vim.keymap.set :n ,lhs ,rhs)))))


;; Macro -- create an insert mode map
;; Has 3 outputs
;; 1 -- No description, but opts table
;; 2 -- Description and optional opts table
;; 3 -- Just lhs and rhs
;; @lhs -- left hand map, must be a string
;; @rhs -- right hand map, can be whatever
;; @desc -- description, or opts table if no description
;; @args -- opts table when description is used
(fn ino- [lhs rhs desc args]
  "Macro -- create a insert mode map"
  (let [opts# {}]
    ; if no desc string, just insert that table
    (if (= (type desc) :table)
      (do
        `(vim.keymap.set :i ,lhs ,rhs ,desc))
      ; if a desc string, add them all to the opts# table
      (= (type desc) :string)
      (do
        (tset opts# :desc desc)
        ; make sure to add the opts# table
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.keymap.set :i ,lhs ,rhs ,opts#))
      ; no additional options or description
      (do
        `(vim.keymap.set :i ,lhs ,rhs)))))

;; Macro -- create a visual mode map
;; Has 3 outputs
;; 1 -- No description, but opts table
;; 2 -- Description and optional opts table
;; 3 -- Just lhs and rhs
;; @lhs -- left hand map, must be a string
;; @rhs -- right hand map, can be whatever
;; @desc -- description, or opts table if no description
;; @args -- opts table when description is used
(fn vno- [lhs rhs desc args]
  "Macro -- create a visual mode map"
  (let [opts# {}]
    ; if no desc string, just insert that table
    (if (= (type desc) :table)
      (do
        `(vim.keymap.set :v ,lhs ,rhs ,desc))
      ; if a desc string, add them all to the opts# table
      (= (type desc) :string)
      (do
        (tset opts# :desc desc)
        ; make sure to add the opts# table
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.keymap.set :v ,lhs ,rhs ,opts#))
      ; no additional options or description
      (do
        `(vim.keymap.set :v ,lhs ,rhs)))))

;; Macro -- create a terminal mode map
;; Has 3 outputs
;; 1 -- No description, but opts table
;; 2 -- Description and optional opts table
;; 3 -- Just lhs and rhs
;; @lhs -- left hand map, must be a string
;; @rhs -- right hand map, can be whatever
;; @desc -- description, or opts table if no description
;; @args -- opts table when description is used
(fn tno- [lhs rhs desc args]
  "Macro -- create a terminal mode map"
  (let [opts# {}]
    ; if no desc string, just insert that table
    (if (= (type desc) :table)
      (do
        `(vim.keymap.set :t ,lhs ,rhs ,desc))
      ; if a desc string, add them all to the opts# table
      (= (type desc) :string)
      (do
        (tset opts# :desc desc)
        ; make sure to add the opts# table
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.keymap.set :t ,lhs ,rhs ,opts#))
      ; no additional options or description
      (do
        `(vim.keymap.set :t ,lhs ,rhs)))))


;; Macro -- create a command-line mode map
;; Has 3 outputs
;; 1 -- No description, but opts table
;; 2 -- Description and optional opts table
;; 3 -- Just lhs and rhs
;; @lhs -- left hand map, must be a string
;; @rhs -- right hand map, can be whatever
;; @desc -- description, or opts table if no description
;; @args -- opts# table when description is used
(fn cno- [lhs rhs desc args]
  "Macro -- create a command-line mode map"
  (let [opts# {}]
    ; if no desc string, just insert that table
    (if (= (type desc) :table)
      (do
        `(vim.keymap.set :c ,lhs ,rhs ,desc))
      ; if a desc string, add them all to the opts# table
      (= (type desc) :string)
      (do
        (tset opts# :desc desc)
        ; make sure to add the opts# table
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.keymap.set :c ,lhs ,rhs ,opts#))
      ; no additional options or description
      (do
        `(vim.keymap.set :c ,lhs ,rhs)))))

;; Macro -- create a operator mode map
;; Has 3 outputs
;; 1 -- No description, but opts table
;; 2 -- Description and optional opts table
;; 3 -- Just lhs and rhs
;; @lhs -- left hand map, must be a string
;; @rhs -- right hand map, can be whatever
;; @desc -- description, or opts table if no description
;; @args -- opts table when description is used
(fn ono- [lhs rhs desc args]
  "Macro -- create a operator mode map"
  (let [opts# {}]
    ; if no desc string, just insert that table
    (if (= (type desc) :table)
      (do
        `(vim.keymap.set :o ,lhs ,rhs ,desc))
      ; if a desc string, add them all to the opts# table
      (= (type desc) :string)
      (do
        (tset opts# :desc desc)
        ; make sure to add the opts# table
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.keymap.set :o ,lhs ,rhs ,opts#))
      ; no additional options or description
      (do
        `(vim.keymap.set :o ,lhs ,rhs opts#)))))

;; Macro -- create a recursive map across multiple modes
;; Has 3 outputs
;; 1 -- No description, but opts table
;; 2 -- Description and optional opts table
;; 3 -- Just lhs and rhs
;; @modes -- sequential table of modes desired
;; @lhs -- left hand map, must be a string
;; @rhs -- right hand map, can be whatever
;; @desc -- description, or opts table if no description
;; @args -- opts table when description is used
(fn map- [modes lhs rhs desc args]
  "Macro -- create a recursive map across multiple modes"
  (let [opts# {}]
    ; if no desc string, just insert that table
    (if (= (type desc) :table)
      (do
        (tset desc :remap true)
        `(vim.keymap.set ,modes ,lhs ,rhs ,desc))
      ; if a desc string, add them all to the opts# table
      (= (type desc) :string)
      (do
        (tset opts# :desc desc)
        (tset opts# :remap true)
        ; make sure to add the opts# table
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.keymap.set ,modes ,lhs ,rhs ,opts#))
      ; no additional options or description
      (do
        (tset opts# :remap true)
        `(vim.keymap.set ,modes ,lhs ,rhs ,opts#)))))

;; Macro -- create a map across multiple modes
;; Has 3 outputs
;; 1 -- No description, but opts table
;; 2 -- Description and optional opts table
;; 3 -- Just lhs and rhs
;; @modes -- sequential table of modes desired
;; @lhs -- left hand map, must be a string
;; @rhs -- right hand map, can be whatever
;; @desc -- description, or opts table if no description
;; @args -- opts table when description is used
(fn nomap- [modes lhs rhs desc args]
  "Macro -- create a map across multiple modes"
  (let [opts# {}]
    ; if no desc string, just insert that table
    (if (= (type desc) :table)
      (do
        `(vim.keymap.set ,modes ,lhs ,rhs ,desc))
      ; if a desc string, add them all to the opts# table
      (= (type desc) :string)
      (do
        (tset opts# :desc desc)
        ; make sure to add the opts# table
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.keymap.set ,modes ,lhs ,rhs ,opts#))
      ; no additional options or description
      (do
        `(vim.keymap.set ,modes ,lhs ,rhs)))))

;; Macro -- create a recursive normal mode map
;; Has 3 outputs
;; 1 -- No description, but opts table
;; 2 -- Description and optional opts table
;; 3 -- Just lhs and rhs
;; @lhs -- left hand map, must be a string
;; @rhs -- right hand map, can be whatever
;; @desc -- description, or opts table if no description
;; @args -- opts table when description is used
(fn nm- [lhs rhs desc args]
  "Macro -- create a recursive normal mode map"
  (let [opts# {}]
    ; if no desc string, just insert that table
    (if (= (type desc) :table)
      (do
        (tset desc :remap true)
        `(vim.keymap.set :n ,lhs ,rhs ,desc))
      ; if a desc string, add them all to the opts# table
      (= (type desc) :string)
      (do
        (tset opts# :desc desc)
        (tset opts# :remap true)
        ; make sure to add the opts# table
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.keymap.set :n ,lhs ,rhs ,opts#))
      ; no additional options or description
      (do
        (tset opts# :remap true)
        `(vim.keymap.set :n ,lhs ,rhs opts#)))))

;; Macro -- create a recursive operator mode map
;; Has 3 outputs
;; 1 -- No description, but opts table
;; 2 -- Description and optional opts table
;; 3 -- Just lhs and rhs
;; @lhs -- left hand map, must be a string
;; @rhs -- right hand map, can be whatever
;; @desc -- description, or opts table if no description
;; @args -- opts table when description is used
(fn om- [lhs rhs desc args]
  "Macro -- create a recursive operator mode map"
  (let [opts# {}]
    ; if no desc string, just insert that table
    (if (= (type desc) :table)
      (do
        (tset desc :remap true)
        `(vim.keymap.set :o ,lhs ,rhs ,desc))
      ; if a desc string, add them all to the opts# table
      (= (type desc) :string)
      (do
        (tset opts# :desc desc)
        (tset opts# :remap true)
        ; make sure to add the opts# table
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.keymap.set :o ,lhs ,rhs ,opts#))
      ; no additional options or description
      (do
        (tset opts# :remap true)
        `(vim.keymap.set :o ,lhs ,rhs opts#)))))

;; Macro -- create a recursive visual mode map
;; Has 3 outputs
;; 1 -- No description, but opts table
;; 2 -- Description and optional opts table
;; 3 -- Just lhs and rhs
;; @lhs -- left hand map, must be a string
;; @rhs -- right hand map, can be whatever
;; @desc -- description, or opts table if no description
;; @args -- opts table when description is used
(fn vm- [lhs rhs desc args]
  "Macro -- create a recursive visual mode map"
  (let [opts# {}]
    ; if no desc string, just insert that table
    (if (= (type desc) :table)
      (do
        (tset desc :remap true)
        `(vim.keymap.set :v ,lhs ,rhs ,desc))
      ; if a desc string, add them all to the opts# table
      (= (type desc) :string)
      (do
        (tset opts# :desc desc)
        (tset opts# :remap true)
        ; make sure to add the opts# table
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.keymap.set :v ,lhs ,rhs ,opts#))
      ; no additional options or description
      (do
        (tset opts# :remap true)
        `(vim.keymap.set :v ,lhs ,rhs opts#)))))

;; Macro -- create a recursive insert mode map
;; Has 3 outputs
;; 1 -- No description, but opts table
;; 2 -- Description and optional opts table
;; 3 -- Just lhs and rhs
;; @lhs -- left hand map, must be a string
;; @rhs -- right hand map, can be whatever
;; @desc -- description, or opts table if no description
;; @args -- opts table when description is used
(fn im- [lhs rhs desc args]
  "Macro -- create a recursive insert mode map"
  (let [opts# {}]
    ; if no desc string, just insert that table
    (if (= (type desc) :table)
      (do
        (tset desc :remap true)
        `(vim.keymap.set :i ,lhs ,rhs ,desc))
      ; if a desc string, add them all to the opts# table
      (= (type desc) :string)
      (do
        (tset opts# :desc desc)
        (tset opts# :remap true)
        ; make sure to add the opts# table
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.keymap.set :i ,lhs ,rhs ,opts#))
      ; no additional options or description
      (do
        (tset opts# :remap true)
        `(vim.keymap.set :i ,lhs ,rhs opts#)))))

;; Macro -- create a recursive terminal mode map
;; Has 3 outputs
;; 1 -- No description, but opts table
;; 2 -- Description and optional opts table
;; 3 -- Just lhs and rhs
;; @lhs -- left hand map, must be a string
;; @rhs -- right hand map, can be whatever
;; @desc -- description, or opts table if no description
;; @args -- opts table when description is used
(fn tm- [lhs rhs desc args]
  "Macro -- create a recursive terminal mode map"
  (let [opts# {}]
    ; if no desc string, just insert that table
    (if (= (type desc) :table)
      (do
        (tset desc :remap true)
        `(vim.keymap.set :t ,lhs ,rhs ,desc))
      ; if a desc string, add them all to the opts# table
      (= (type desc) :string)
      (do
        (tset opts# :desc desc)
        (tset opts# :remap true)
        ; make sure to add the opts# table
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.keymap.set :t ,lhs ,rhs ,opts#))
      ; no additional options or description
      (do
        (tset opts# :remap true)
        `(vim.keymap.set :t ,lhs ,rhs opts#)))))

;; Macro -- create a recursive command-line mode map
;; Has 3 outputs
;; 1 -- No description, but opts table
;; 2 -- Description and optional opts table
;; 3 -- Just lhs and rhs
;; @lhs -- left hand map, must be a string
;; @rhs -- right hand map, can be whatever
;; @desc -- description, or opts table if no description
;; @args -- opts table when description is used
(fn cm- [lhs rhs desc args]
  "Macro -- create a recursive command-line mode map"
  (let [opts# {}]
    ; if no desc string, just insert that table
    (if (= (type desc) :table)
      (do
        (tset desc :remap true)
        `(vim.keymap.set :c ,lhs ,rhs ,desc))
      ; if a desc string, add them all to the opts# table
      (= (type desc) :string)
      (do
        (tset opts# :desc desc)
        (tset opts# :remap true)
        ; make sure to add the opts# table
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.keymap.set :c ,lhs ,rhs ,opts#))
      ; no additional options or description
      (do
        (tset opts# :remap true)
        `(vim.keymap.set :c ,lhs ,rhs opts#)))))

{
 :map- map-
 :nomap- nomap-
 :ino- ino-
 :im- im-
 :vno- vno-
 :vm- vm-
 :tno- tno-
 :tm- tm-
 :cno- cno-
 :cm- cm-
 :nno- nno-
 :nm- nm-
 :ono- ono-
 :om- om-}
