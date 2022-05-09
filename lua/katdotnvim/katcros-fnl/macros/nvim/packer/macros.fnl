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

