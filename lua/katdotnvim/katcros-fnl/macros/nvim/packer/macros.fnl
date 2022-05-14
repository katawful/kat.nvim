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

;;; Macros for plugin packer.nvim

;; Macro -- initialize packer.nvim
;; @... -- takes standard packer.nvim list
(fn plugInit [...]
  "Macro -- Initialize packer.nvim"
  `(do
     ((. (require :packer) :startup) (fn []
                                      (do
                                        ,...)))))

;; Macro -- use 'Plug' instead of 'use' for packer.nvim
;; @plugin -- standard packer.nvim list
(fn Plug [plugin]
  "Macro -- call plugin with 'Plug'"
  `(use ,plugin))

{
 :Plug Plug
 :plugInit plugInit}

