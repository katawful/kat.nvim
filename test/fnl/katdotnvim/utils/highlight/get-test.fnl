(module katdotnvim.utils.highlight.get-test
        {autoload {get katdotnvim.utils.highlight.get
                   s aniseed.string
                   a aniseed.core}})

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

; (deftest all-attr->table)

(deftest all-attr->table (let [test-08 "bold,italic,underline,underdouble"
                               test-07 "bold,italic,underline,underlineline"
                               old-version vim.g.kat_nvim_max_version
                               expected-08 (do (set vim.g.kat_nvim_max_version :0.8)
                                               (a.keys (get.all-attr->table high-table)))
                               expected-07 (do (set vim.g.kat_nvim_max_version :0.7)
                                               (a.keys (get.all-attr->table high-table)))
                               split-test-08 (s.split test-08 ",")
                               split-test-07 (s.split test-07 ",")]
                           (set vim.g.kat_nvim_max_version old-version)
                           (table.sort split-test-08)
                           (table.sort split-test-07)
                           (table.sort expected-08)
                           (table.sort expected-07)
                           (t.ok? (vim.deep_equal split-test-08 expected-08)
                                  "Use 0.8 attribute names to add all to table")
                           (t.ok? (vim.deep_equal split-test-07 expected-07)
                                  "Use 0.7 attribute names to add all to table")))
