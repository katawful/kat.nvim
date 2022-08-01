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

(fn scope [opt]
  "Get the scope of an option"
  (let [opt# (tostring opt)]
    (if (pcall vim.api.nvim_get_option_info opt#)
      (. (vim.api.nvim_get_option_info opt#) :scope)
      false)))

;; Macro set the value of an option based on its scope
(fn set-option [option value scope]
  "Macro set the value of an option based on its scope"
  (match scope
    :global `(vim.api.nvim_set_option ,option ,value)
    :win `(vim.api.nvim_win_set_option 0 ,option ,value)
    :buf `(vim.api.nvim_buf_set_option 0 ,option ,value)))

(fn set-opt [option value ?flag] "Macro -- set an option"
  (if ?flag
    (do
      (assert-compile (= (type ?flag) :string)
                      (.. "Expected string, got " (type ?flag)) ?flag)
      (match ?flag
        :append (let [opt# (tostring option)]
                  `(: (. vim.opt ,opt#) :append ,value))
        :prepend (let [opt# (tostring option)]
                   `(: (. vim.opt ,opt#) :prepend ,value))
        :remove (let [opt# (tostring option)]
                  `(: (. vim.opt ,opt#) :remove ,value))
        _ (assert-compile nil (string.format
                                "Expected append, prepend, or remove, got '%s'" ?flag) ?flag)))
    (let [opt# (tostring option)]
      `(tset vim.opt ,opt# ,value))))

(fn set-local-opt [option value ?flag] "Macro -- set a local option"
  (assert-compile (or (= (scope option) :win) 
                      (= (scope option) :buf))
                  (string.format "Expected local option, got %s option" (scope option))
                  option)
  (if ?flag
    (do
      (assert-compile (= (type ?flag) :string)
                      (.. "Expected string, got " (type ?flag)) ?flag)
      (match ?flag
        :append (let [opt# (tostring option)]
                  `(: (. vim.opt_local ,opt#) :append ,value))
        :prepend (let [opt# (tostring option)]
                   `(: (. vim.opt_local ,opt#) :prepend ,value))
        :remove (let [opt# (tostring option)]
                  `(: (. vim.opt_local ,opt#) :remove ,value))
        _ (assert-compile nil (string.format
                                "Expected append, prepend, or remove, got '%s'" ?flag) ?flag)))
    (let [opt# (tostring option)]
      `(tset vim.opt_local ,opt# ,value))))

(fn set-global-opt [option value ?flag] "Macro -- set a global option"
  (assert-compile (= (scope option) :global)
                 (string.format "Expected global option, got %s option" (scope option))
                 option)
  (if ?flag
    (do
      (assert-compile (= (type ?flag) :string)
                      (.. "Expected string, got " (type ?flag)) ?flag)
      (match ?flag
        :append (let [opt# (tostring option)]
                  `(: (. vim.opt_global ,opt#) :append ,value))
        :prepend (let [opt# (tostring option)]
                   `(: (. vim.opt_global ,opt#) :prepend ,value))
        :remove (let [opt# (tostring option)]
                  `(: (. vim.opt_global ,opt#) :remove ,value))
        _ (assert-compile nil (string.format
                                "Expected append, prepend, or remove, got '%s'" ?flag) ?flag)))
    (let [opt# (tostring option)]
      `(tset vim.opt_global ,opt# ,value))))

(fn set-opt-auto [option value ?flag] "Macro -- set an option with auto scope
Generally, 'set' from Vim will try to use the global scope for anything.
If you want a local scope you have to use 'setlocal'. This is generally
not particularly clean, as you then have to remember what is what kind of
scope. This macro fixes this by always preferring the local scope if available
but not restricting the use of global-only scoped options
(set-opt-auto spell true) -> will set spell locally
(set-opt-auto mouse :nvi) -> will set mouse globally
(set-opt spell true)      -> will set spell globally

This macro is generally preferred when no specification is needed.
However, since it sets local options its generally avoided for system wide configs."
 (when ?flag
   (do
     (assert-compile (= (type ?flag) :string)
                     (string.format "Expected string, got %s" (type ?flag))
                     ?flag)
     (assert-compile (or (= ?flag :append)
                         (= ?flag :prepend)
                         (= ?flag :remove))
                     (string.format "Expected append, prepend, or remove; got '%s'" ?flag)
                     ?flag)))
 (let [scope# (scope option)
       opt# (tostring option)]
   (if ?flag
     (match scope#
       :win `(: (. vim.opt_local ,opt#) ,?flag ,value)
       :buf `(: (. vim.opt_local ,opt#) ,?flag ,value)
       :global `(: (. vim.opt_global ,opt#) ,?flag ,value))
     (match scope#
       :win `(tset vim.opt_local ,opt# ,value)
       :buf `(tset vim.opt_local ,opt# ,value)
       :global `(tset vim.opt_global ,opt# ,value)))))

(fn set-opts [options ?flag] "Macro -- plural of set-opt
Takes key-value table of options"
 (when ?flag
   (do
     (assert-compile (= (type ?flag) :string)
                     (string.format "Expected string, got %s" (type ?flag))
                     ?flag)
     (assert-compile (or (= ?flag :append)
                         (= ?flag :prepend)
                         (= ?flag :remove))
                     (string.format "Expected append, prepend, or remove; got '%s'" ?flag)
                     ?flag)))
 (let [output# []]
   (each [option# value# (pairs options)]
     (let [opt# (tostring option#)]
       (if ?flag
         (table.insert output# `(: (. vim.opt ,opt#) ,?flag ,value#))
         (table.insert output# `(tset vim.opt ,opt# ,value#)))))
   `,output#))

(fn set-local-opts [options ?flag] "Macro -- plural of set-local-opt
Takes key-value table of options"
 (when ?flag
   (do
     (assert-compile (= (type ?flag) :string)
                     (string.format "Expected string, got %s" (type ?flag))
                     ?flag)
     (assert-compile (or (= ?flag :append)
                         (= ?flag :prepend)
                         (= ?flag :remove))
                     (string.format "Expected append, prepend, or remove; got '%s'" ?flag)
                     ?flag)))
 (let [output# []]
   (each [option# value# (pairs options)]
     (assert-compile (or (= (scope option#) :win) 
                         (= (scope option#) :buf))
                     (string.format "Expected local option, got %s option" (scope option#))
                     option#)
     (let [opt# (tostring option#)]
       (if ?flag
         (table.insert output# `(: (. vim.opt_local ,opt#) ,?flag ,value#))
         (table.insert output# `(tset vim.opt_local ,opt# ,value#)))))
   `,output#))

(fn set-global-opts [options ?flag] "Macro -- plural of set-global-opt
Takes key-value table of options"
 (when ?flag
   (do
     (assert-compile (= (type ?flag) :string)
                     (string.format "Expected string, got %s" (type ?flag))
                     ?flag)
     (assert-compile (or (= ?flag :append)
                         (= ?flag :prepend)
                         (= ?flag :remove))
                     (string.format "Expected append, prepend, or remove; got '%s'" ?flag)
                     ?flag)))
 (let [output# []]
   (each [option# value# (pairs options)]
     (assert-compile (= (scope option#) :global)
                     (string.format "Expected global option, got %s option" (scope option#))
                     option#)
     (let [opt# (tostring option#)]
       (if ?flag
         (table.insert output# `(: (. vim.opt_global ,opt#) ,?flag ,value#))
         (table.insert output# `(tset vim.opt_global ,opt# ,value#)))))
   `,output#))

(fn set-opts-auto [options ?flag] "Macro -- plural of set-opt-auto
Takes key-value table of options
Generally, 'set' from Vim will try to use the global scope for anything.
If you want a local scope you have to use 'setlocal'. This is generally
not particularly clean, as you then have to remember what is what kind of
scope. This macro fixes this by always preferring the local scope if available
but not restricting the use of global-only scoped options
(set-opt-auto spell true) -> will set spell locally
(set-opt-auto mouse :nvi) -> will set mouse globally
(set-opt spell true)      -> will set spell globally

This macro is generally preferred when no specification is needed.
However, since it sets local options its generally avoided for system wide configs."
 (when ?flag
   (do
     (assert-compile (= (type ?flag) :string)
                     (string.format "Expected string, got %s" (type ?flag))
                     ?flag)
     (assert-compile (or (= ?flag :append)
                         (= ?flag :prepend)
                         (= ?flag :remove))
                     (string.format "Expected append, prepend, or remove; got '%s'" ?flag)
                     ?flag)))
 (let [output# []]
   (each [option# value# (pairs options)]
     (let [opt# (tostring option#)
           scope# (scope option#)]
       (if (= scope# :global)
         (if ?flag
           (table.insert output# `(: (. vim.opt_global ,opt#) ,?flag ,value#))
           (table.insert output# `(tset vim.opt_global ,opt# ,value#)))
         (if ?flag
           (table.insert output# `(: (. vim.opt_local ,opt#) ,?flag ,value#))
           (table.insert output# `(tset vim.opt_local ,opt# ,value#))))))
   `,output#))

(fn get-opt [option] "Macro -- get an option's value"
  (let [opt# (tostring option)]
    `(: (. vim.opt ,opt#) :get)))

(fn set-var [scope variable value] "Macro -- set a Vim variable
For b, w, and t scope, they can be indexed like (. b 1) for their
Lua table equivalent. The other scopes can't take an index and will
return an error."
  (let [test-scope# (tostring scope)
        var# (tostring variable)]
    (if (list? scope)
      ;; need to destruct the indexed list and inject the appropriate table
      (let [matched-scope# (tostring (. scope 2))
            index# (. scope 3)]
       (assert-compile (or (= matched-scope# :b)
                           (= matched-scope# :w)
                           (= matched-scope# :t))
                       (string.format "Expected b, w, or t scope; got %s" matched-scope#)
                       matched-scope#)
       `(tset (. (. vim ,matched-scope#) ,index#) ,var# ,value))
      (let [scope# (tostring scope)]
        (assert-compile (or (= scope# :g)
                            (= scope# :b)
                            (= scope# :w)
                            (= scope# :t)
                            (= scope# :v)
                            (= scope# :env)))
        `(tset (. vim ,scope#) ,var# ,value)))))

(fn set-vars [scope variables] "Macro -- plural of set-var for one scope"
  (let [output# []]
   (each [variable# value# (pairs variables)]
     (table.insert output# `,(set-var scope variable# value#)))
   `,output#))

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
 : set-opt
 : set-local-opt
 : set-global-opt
 : set-opt-auto
 : set-opts
 : set-local-opts
 : set-global-opts
 : set-opts-auto
 : get-opt
 : set-var
 : set-vars
 :let- let-
 :set- set-
 :setl- setl-
 :setg- setg-
 :seta- seta-
 :setp- setp-
 :setr- setr-
 :setw- setw-}

