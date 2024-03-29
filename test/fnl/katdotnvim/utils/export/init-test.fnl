(module katdotnvim.utils.export.init-test
        {autoload {export katdotnvim.utils.export.init
                   main katdotnvim.main
                   s aniseed.string}
         require-macros [katcros-fnl.macros.nvim.api.utils.macros]})

(deftest rgb->string
         (t.= "127,127,127" (export.rgb->string [0.5 0.5 0.5])
              "Converts decimal rgb tuple to 256 RGB string"))

(deftest hex->rgb-string
         (t.= "127,127,127" (export.hex->rgb-string "#7f7f7f")
              "Converts hex color to 256 RGB string"))

;; fnlfmt: skip
(deftest string->one-line-color
         (do-ex colorscheme :kat.nvim)
         (local expected (s.split (string.format
                                    "nil kitty terminal theme generated by kat.nvim
nil Generated using %s colorscheme with background set to %s\n
color 1\nkey1 value1\n"
                                    vim.g.colors_name
                                    (. main.background-mut 1))
                                  "\n"))
         (set export.comment-type nil)
         (local result (s.split (export.string->one-line-color {:color :1
                                                                :key1 :value1}
                                                               :kitty) "\n"))
         (table.sort expected)
         (table.sort result)
         (t.ok? (vim.deep_equal expected result)
                "Takes a table of strings and convests to a one-line string"))

;; fnlfmt: skip
(deftest table->one-line-color
         (do-ex colorscheme :kat.nvim)
         (local expected (s.split (string.format
                                    "nil alacritty terminal theme generated by kat.nvim
nil Generated using %s colorscheme with background set to %s\n
color\nkey1 value1\nkey2\nkey3 value3\nkey4 value4\n"
                                    vim.g.colors_name
                                    (. main.background-mut 1))
                                  "\n"))
         (set export.comment-type nil)
         (local result
           (s.split (export.table->one-line-color {:color {:key1 :value1
                                                           :key2 {:key3 :value3}
                                                           :key4 :value4}}
                                                  :alacritty) "\n"))
         (table.sort expected)
         (table.sort result)
         (t.ok? (vim.deep_equal expected result)
                "Take a nested table of colors and return a one line string of colors"))

;; fnlfmt: skip
(deftest color-nest->one-line-color%
         (local expected (s.split
                           (string.format "color1\nkey1 value1\nkey2\nkey3 value3\nkey4 value4\n")
                           "\n"))
         (set export.comment-type nil)
         (local result (s.split
                         (export.color-nest->one-line-color%
                           :color1 {:key1 :value1
                                    :key2 {:key3 :value3}
                                    :key4 :value4}
                           "color1\n")
                         "\n"))
         (table.sort expected)
         (table.sort result) (t.ok? (vim.deep_equal expected result)))

; (deftest notify$
;   (t.= (string.format 
;          "kat.nvim: kitty color file generated at cwd using %s colorscheme with %s background"
;          vim.g.colors_name
;          vim.o.background)
;        (export.notify$ :kitty true)))
