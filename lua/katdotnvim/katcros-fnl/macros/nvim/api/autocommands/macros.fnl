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

;;; Macro file for autocommands

;; Macro -- create an augroup to return as a variable
;; @name -- name of group
;; @no-clear -- if true, don't clear out group. opposite of default
(fn def-aug- [name no-clear]
  "Macro -- define an auto group for return"
  (if (= no-clear (or false nil))
    `(vim.api.nvim_create_augroup ,name {:clear true})
    `(vim.api.nvim_create_augroup ,name {:clear false})))

;; Macro -- create autocommand
(fn auc- [events pattern callback desc args]
  "Macro -- create autocommand"
  (let [opts# {}
        call-type# (if (= (type callback) :string)
                     :command
                     :callback)]
    ; if no desc string, just insert that table
    (if (= (type desc) :table)
      (do
        (tset desc call-type# callback)
        (if (not= pattern nil)
          (tset desc :pattern pattern))
        `(vim.api.nvim_create_autocmd ,events ,desc))
      ; if a desc string, add them all to the opts table
      (= (type desc) :string)
      (do
        (tset opts# :desc desc)
        (tset opts# call-type# callback)
        (if (not= pattern nil)
          (tset opts# :pattern pattern))
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.api.nvim_create_autocmd ,events ,opts#))
      ; no additional options or description
      (do
        (if (not= pattern nil)
          (tset opts# :pattern pattern))
        (tset opts# call-type# callback)
        `(vim.api.nvim_create_autocmd ,events ,opts#)))))

;; Macro -- use an autogroup
(fn aug- [group ...]
  "Macro -- insert auto group into autocmd calls"
  (let [autocmd# [...]
        out# []]
    (each [key# val# (ipairs autocmd#)]
      ; (assert-compile (list? val#) "expected list for body" val#)
      (assert-compile (if (= (tostring (. val# 1)) "auc-") "auc-")
                      "expected autocmd call" (. val# 1))
      (if (= (tostring (. val# 1)) "auc-")
        (do
          ; see if have table
          (var had-table# false)
          (each [k# v# (pairs val#)]
            ; gotta make sure its an actual table
            ; not a list or symbol
            (if (and (not= k# 2)
                     (= (type v#) :table)
                     (not= (list? v#) v#)
                     (not= (sym? v#) v#))
              (do
                (tset v# :group group)
                (set had-table# true))))
          (if (= had-table# false)
            (do
              (table.insert val# {:group group})))
          (table.insert out# val#))))
    `,out#))

;; Macro -- clear out autocmds based on multiple queries
(fn cle-auc! [tbl] "Macro -- clear autocommands"
  (assert-compile (= (type tbl) :table)
                  (.. "Expected table, got " (type tbl)) tbl)
  `(vim.api.nvim_clear_autocmds ,tbl))

;; Macro -- clear autocmd by event
(fn cle-auc<-event! [events] "Macro -- clear autocommands from events"
  (assert-compile (or (= (type events) :string)
                      (= (type events) :table))
                  (.. "Expected table or string, got " (type events)) events)
  `(vim.api.nvim_clear_autocmds {:event ,events}))

;; Macro -- clear autocmd by pattern
(fn cle-auc<-pattern! [patterns] "Macro -- clear autocommands from patterns"
  (assert-compile (or (= (type patterns) :string)
                      (= (type patterns) :table))
                  (.. "Expected table or string, got " (type patterns)) patterns)
  `(vim.api.nvim_clear_autocmds {:pattern ,patterns}))

;; Macro -- clear autocmd by buffer
(fn cle-auc<-buffer! [buffers] "Macro -- clear autocommands from buffers"
  (assert-compile (= (type buffers) :number)
                  (.. "Expected boolean or number, got " (type buffers)) buffers)
  (let [buffer# (if (= buffers true)
                  0
                  buffers)]
    `(vim.api.nvim_clear_autocmds {:buffer ,buffer#})))

;; Macro -- clear autocmd by group
(fn cle-auc<-group! [groups] "Macro -- clear autocommands from group"
  (assert-compile (or (= (type groups) :string)
                      (= (type groups) :number))
                  (.. "Expected string or number, got " (type groups)) groups)
  `(vim.api.nvim_clear_autocmds {:group ,groups}))

;; Macro -- delete autogroup
(fn del-aug! [id] "Macro -- delete augroup by id or name"
  (assert-compile (or (= (type id) :string)
                      (= (type id) :number))
                  (.. "Expected string or number, got " (type id)) id)
  (if (= (type id) :string)
    `(vim.api.nvim_del_augroup_by_name ,id)
    `(vim.api.nvim_del_augroup_by_id ,id)))

;; Macro -- autocommand to table
(fn get-auc [tbl] "Macro -- get autocommands"
  (assert-compile (= (type tbl) :table)
                  (.. "Expected table, got " (type tbl)) tbl)
  `(vim.api.nvim_get_autocmds ,tbl))

(fn get-auc<-group [groups] "Macro -- get autocommand from group"
  (assert-compile (or (= (type groups) :string)
                      (= (type groups) :number))
                  (.. "Expected string or number, got " (type groups)) groups)
  `(vim.api.nvim_get_autocmds {:group ,groups}))

(fn get-auc<-pattern [patterns] "Macro -- get autocommands from patterns"
  (assert-compile (or (= (type patterns) :string)
                      (= (type patterns) :table))
                  (.. "Expected table or string, got " (type patterns)) patterns)
  `(vim.api.nvim_get_autocmds {:pattern ,patterns}))

(fn get-auc<-event [events] "Macro -- get autocommands from events"
  (assert-compile (or (= (type events) :string)
                      (= (type events) :table))
                  (.. "Expected table or string, got " (type events)) events)
  `(vim.api.nvim_get_autocmds {:event ,events}))

(fn do-auc [events ?opts] "Macro -- do autocommand"
  (assert-compile (or (= (type events) :table)
                      (= (type events) :string))
                  (.. "Expected table or string for arg #1, got " (type events))
                  events)
  (let [opts (if (= ?opts nil)
               {}
               ?opts)]
    (assert-compile (or (not ?opts) (= (type opts) :table))
                    (.. "Expected table for arg #2, got " (type opts)) opts)
    `(vim.api.nvim_exec_autocmds ,events ,opts)))

{
 : cle-auc!
 : cle-auc<-event!
 : cle-auc<-pattern!
 : cle-auc<-buffer!
 : cle-auc<-group!
 : get-auc
 : get-auc<-event
 : get-auc<-pattern
 : get-auc<-group
 : do-auc
 : aug-
 : auc-
 : del-aug!
 : def-aug-}

