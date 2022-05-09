;;; Macros for color management

;; Macro -- set colorscheme
;; @scheme -- a string of the colorscheme desired
(fn col- [scheme]
  "Macro -- set colorscheme"
  (let [scheme# (.. "colorscheme " scheme)]
   `(vim.cmd ,scheme#)))

{
 :col- col-}

