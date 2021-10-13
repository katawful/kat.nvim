vim.cmd("highlight clear")
if (vim.fn.exists("syntax_on") == true) then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "katdotnvim"
return (require("katdotnvim.main")).init()
