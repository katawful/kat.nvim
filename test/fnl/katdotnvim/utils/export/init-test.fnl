(module katdotnvim.utils.export.init-test
  {autoload {export katdotnvim.utils.export.init}})

(deftest rgb->string
  (t.= "127,127,127" (export.rgb->string [0.5 0.5 0.5])
       "Converts decimal rgb tuple to 256 RGB string"))

(deftest hex->rgb-string
  (t.= "127,127,127" (export.hex->rgb-string "#7f7f7f")
       "Converts hex color to 256 RGB string"))
