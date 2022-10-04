(module katdotnvim.utils.highlight.get-test
        {autoload {get katdotnvim.utils.highlight.get s aniseed.string}})

(def- high-table {:group :Test
                  :fg "#111111"
                  :bg "#eeeeee"
                  :ctermfg 7
                  :ctermbg 0
                  :bold true
                  :italic true
                  :underline true
                  :underlineline true
                  :sp "#444444"
                  :blend 3})

(deftest group (t.= :Test (get.group high-table)
                    "Get the group name of a highlight group"))

(deftest gui-fg
         (t.= "#111111" (get.gui-fg high-table)
              "Get the gui foreground of a highlight group"))

(deftest gui-bg
         (t.= "#eeeeee" (get.gui-bg high-table)
              "Get the gui background of a highlight group"))

(deftest term-fg
         (t.= 7 (get.term-fg high-table)
              "Get the term foreground of a highlight group"))

(deftest term-bg
         (t.= 0 (get.term-bg high-table)
              "Get the term background of a highlight group"))

(deftest special
         (t.= "#444444" (get.special high-table)
              "Get the special colors of a highlight group"))

(deftest blend (t.= 3 (get.blend high-table)
                    "Get the blend of a highlight group"))

