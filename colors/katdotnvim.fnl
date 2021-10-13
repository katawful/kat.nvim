; This sets up colors using vim standards for easy management

(vim.cmd "highlight clear")
(if (= (vim.fn.exists :syntax_on) true)
  (vim.cmd "syntax reset"))
(set vim.g.colors_name :katdotnvim)

((. (require :katdotnvim.main) :init))
