(module katdotnvim.utils.message.errors-test
  {autoload {errors katdotnvim.utils.message.errors}})

(deftest message$
  (t.= "kat.nvim E1: This is a test!"
       (errors.message$ 1 "This is a test!" true)
       "Present an error message to user"))
