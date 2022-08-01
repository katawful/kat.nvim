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

;;; Macros for Neovim utilities

(local truthy-functions {
                         :bufexists true
                         :buflisted true
                         :bufloaded true
                         :did_filetype true
                         :empty true
                         :exists true
                         :eventhandler true
                         :filereadable true
                         :filewriteable true
                         :has true
                         :has_key true
                         :haslocaldir true
                         :hasmapto true
                         :hlexists true
                         :isdirectory true
                         :islocked true
                         :isnan true})

;; Macro -- call Ex/user commands a bit more cleanly
;; @function -- the function demanded
;; @... -- string for arguments
(fn com- [function ...]
  "Macro -- call Ex/user commands a bit more cleanly"
  (let [function (tostring function)
        args [...]]
    (var output function)
    (each [k v (pairs args)]
      (set output (.. output " " (tostring v))))
    `(vim.api.nvim_command ,output)))

(fn do-ex [function ...] "Macro -- run a Ex command
Can accept a table for functions that take key=val args"
  (let [args# [...]
        arg-string# []]
    (each [_ arg# (ipairs args#)]
      (if (= (type arg#) :table)
        (each [key# val# (pairs arg#)]
          (table.insert arg-string#
                        (string.format "%s=%s" key# val#)))
        (table.insert arg-string# arg#)))
    (var str# "")
    (each [_ v# (ipairs arg-string#)]
      (set str# (string.format "%s %s" str# v#)))
    (let [output# (.. (tostring function) " "
                    str#)]
      `(vim.api.nvim_exec ,output# true))))

(fn do-viml [function ...] "Macro -- run a VimL function
Returing boolean for builtin truthy/falsy functions such as 'has()'"
  (let [args# ...
        func# (tostring function)]
    (if (. truthy-functions func#)
      `(do
         (let [result# ((. vim.fn ,func#) ,...)]
            (if (= result# 0)
              false
              true)))
      `((. vim.fn ,func#) ,...))))

;; Macro -- create a user command
;; Has 3 outputs
;; 1 -- No description, but opts table
;; 2 -- Description and optional opts table
;; 3 -- Just name and command
;; @name -- name for user command, should start with a capital
;; @command -- whatever fennel function desired
;; @desc -- description, or opts table if no description
;; @args -- opts table when description is used
(fn cre-command [name command desc args]
  "Macro -- create a user command"
  (let [opts# {}]
    (if (= (type desc) :table)
      ; no description but opts table
      (if desc.buffer
        (do
          (each [key val (pairs desc)]
            (tset opts# key val))
          (let [buffer# (if (= opts#.buffer true)
                          0
                          opts#.buffer)]
            (set opts#.buffer nil)
            `(vim.api.nvim_buf_create_user_command ,buffer# ,name ,command ,opts#)))
        `(vim.api.nvim_create_user_command ,name ,command ,desc))
      (= (type desc) :string)
      ; descriptin and optional opts table
      (do
        (tset opts# :desc desc)
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        (if opts#.buffer
          (do
            (let [buffer# (if (= opts#.buffer true)
                            0
                            opts#.buffer)]
              (set opts#.buffer nil)
              `(vim.api.nvim_buf_create_user_command ,buffer# ,name ,command ,opts#)))
          `(vim.api.nvim_create_user_command ,name ,command ,opts#)))
      ; no additional options or description
      (do
        `(vim.api.nvim_create_user_command ,name ,command ,opts#)))))

(fn def-command [name command desc args] "Macro -- define a user command with a returned value
Returns a string of the user-command name"
 `(do
    ,(cre-command name command desc args)
    ,name))

(fn del-command [name ?buffer] "Macro -- delete a user command
Buffer created user commands will fail if ?buffer is not provided"
  (if ?buffer
    (assert-compile (or (= ?buffer true)
                        (= (type ?buffer) :number))
                    (.. "Expected true or number for arg #2, got " (type ?buffer))
                    ?buffer)
    (if (= ?buffer true)
      `(vim.api.nvim_buf_del_user_command ,name 0)
      `(vim.api.nvim_buf_del_user_command ,name ,?buffer))
    `(vim.api.nvim_del_user_command ,name)))

(fn do-command [command# ...] "Macro -- run a user command"
  (let [args# [...]
        arg-string# []
        start-char# (string.sub (tostring command#) 1 1)]
    (each [_ arg# (ipairs args#)]
      (if (= (type arg#) :table)
        (each [key# val# (pairs arg#)]
          (table.insert arg-string#
                        (string.format "%s=%s" key# val#)))
        (= (type arg#) :string)
        (table.insert arg-string# (.. "\"" arg# "\""))
        (table.insert arg-string# arg#)))
    (var str# "")
    (each [_ v# (ipairs arg-string#)]
      (set str# (string.format "%s %s" str# v#)))
    (assert-compile (start-char#:match "[A-Z]")
                    "Expected a user command that starts with an upper-case letter"
                    command#)
    (let [output# (.. (tostring command#) " " str#)]
     `(vim.cmd ,output#))))

(fn command- [...] "Macro -- alias for cre-command" (cre-command ...))

;; Macro -- create a user command using vimscript for non-0.7 users
;; @name -- command name
;; @attributes -- a table of user command attributes
;; @vimscript -- whatever vimscript one is running
(fn command*-vim [name attributes vimscript]
   ; TODO - think about having bang be optional
  (var output# "command! ")
  ; parse each value in the attribute table
  ; most are just true/false values so they don't need an argument
  (each [k v (pairs attributes)]
    (match k
      :buffer (set output# (.. output# "-buffer "))
      :bang (set output# (.. output# "-bang "))
      :bar (set output# (.. output# "-bar "))
      :register (set output# (.. output# "-register "))
      :complete (set output# (.. output# "-complete=" (tostring v) " "))
      :nargs (set output# (.. output# "-nargs=" (tostring v) " "))
      :range (do
               (if (= v true)
                 (set output# (.. output# "-range "))
                 (set output# (.. output# "-range=" (tostring v) " "))))
      :addr (set output# (.. output# "-nargs=" (tostring v)))))
  (set output# (.. output# name " " vimscript))
  `(do
     (vim.api.nvim_command ,output#)))

{
 : cre-command
 : def-command
 : del-command
 : do-command
 : do-viml
 : do-ex
 :com- com-
 :command- command-
 :command*-vim command*-vim}
