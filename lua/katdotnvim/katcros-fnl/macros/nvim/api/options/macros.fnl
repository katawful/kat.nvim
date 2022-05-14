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

;;; Macro file for option management

;; Private macros
;; Macro -- get the scope of an option
(fn get-scope [opt]
  "Macro -- get the scope of an option"
  (if (pcall vim.api.nvim_get_option_info opt)
    (. (vim.api.nvim_get_option_info opt) :scope)
    false))
;; Macro set the value of an option based on its scope
(fn set-option [option value scope]
  "Macro set the value of an option based on its scope"
  (match scope
    :global `(vim.api.nvim_set_option ,option ,value)
    :win `(vim.api.nvim_win_set_option 0 ,option ,value)
    :buf `(vim.api.nvim_buf_set_option 0 ,option ,value)))

;; Macro -- set a global option
(fn setg- [option value]
  "Macro -- set a global option"
  (let [option (tostring option)]
    `(tset vim.opt_global ,option ,value)))

;; Macro -- set a local option
(fn setl- [option value]
  "Macro -- set a local option"
  (let [option (tostring option)]
    `(tset vim.opt_local ,option ,value)))

;; Macro -- set a window option
(fn setw- [option value]
  "Macro -- set a window option"
  (let [option (tostring option)]
    (set-option option value :win)))

;; Macro -- set an option generically if possible
(fn set- [option value]
  "Macro -- set an option generically if possible"
  (let [option (tostring option)
        value value
        scope# (get-scope option)]
    (set-option option value scope#)))

;; Macro -- append a value to an option
(fn seta- [option value]
  "Macro -- append a value to an option"
  (let [option  (tostring option)]
    `(tset vim.opt ,option (+ (. vim.opt ,option) ,value))))

;; Macro -- prepend a value to an option
(fn setp- [option value]
  "Macro -- prepend a value to an option"
  (let [option (tostring option)]
    `(tset vim.opt ,option (^ (. vim.opt ,option) ,value))))

;; Macro -- remove a value from an option
(fn setr- [option value]
  "Macro -- remove a value from an option"
  (let [option (tostring option)]
    `(tset vim.opt ,option (- (. vim.opt ,option) ,value))))

;; Macro -- set a variable of some scope
;; @scope -- a character string of the scope
;; @obj -- the variable as a string
;; @... -- the options
(fn let- [scope obj ...]
  "Macro -- set a variable of some scope"
  (let [scope (tostring scope)
        obj (tostring obj)
        output [...]
        value []]
    (var value "")
    ; if number of operands is 1
    (if (= (length output) 1
         (each [key val (pairs output)]
           ; set the output to just the value of the operands
           (set value val)))
      (> (length output) 1
         ; else set the output to the whole table
        (do (set value output))))
    (match scope
      :g `(tset vim.g ,obj ,value)
      :b `(tset vim.b ,obj ,value)
      :w `(tset vim.w ,obj ,value)
      :t `(tset vim.t ,obj ,value)
      :v `(tset vim.v ,obj ,value)
      :env `(tset vim.env ,obj ,value))))

{
 :let- let-
 :set- set-
 :setl- setl-
 :setg- setg-
 :seta- seta-
 :setp- setp-
 :setr- setr-
 :setw- setw-}

