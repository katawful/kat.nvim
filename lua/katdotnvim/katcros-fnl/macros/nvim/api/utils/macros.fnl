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

;; Macro -- create a user command
;; Has 3 outputs
;; 1 -- No description, but opts table
;; 2 -- Description and optional opts table
;; 3 -- Just name and command
;; @name -- name for user command, should start with a capital
;; @command -- whatever fennel function desired
;; @desc -- description, or opts table if no description
;; @args -- opts table when description is used
(fn command- [name command desc args]
  (let [opts# {}]
    (if (= (type desc) :table)
      ; no description but opts table
      (do
        `(vim.api.nvim_create_user_command ,name ,command ,desc))
      (= (type desc) :string)
      ; descriptin and optional opts table
      (do
        (tset opts# :desc desc)
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.api.nvim_create_user_command ,name ,command ,opts#))
      ; no additional options or description
      (do
        `(vim.api.nvim_create_user_command ,name ,command ,opts#)))))

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
 :com- com-
 :command- command-
 :command*-vim command*-vim}
