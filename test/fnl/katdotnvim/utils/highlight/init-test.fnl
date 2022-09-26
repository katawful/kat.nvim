(module katdotnvim.utils.highlight.init-test
        {autoload {apply katdotnvim.utils.highlight.init
                   get katdotnvim.utils.highlight.get
                   utils katdotnvim.utils.highlight.utils}
         require-macros [katcros-fnl.macros.nvim.api.utils.macros]})

(defonce group-name :KatNvimTestHLGroup)

; test would complain if this was private

(defonce- high-table {:group group-name
                      :fg "#111111"
                      :bg "#eeeeee"
                      :ctermfg 7
                      :ctermbg 0
                      :bold true
                      :italic true
                      :underline true
                      :undercurl true
                      :sp "#444444"
                      :blend 3})

(deftest get-existing (apply.highlight$ high-table)
         (print (vim.inspect (apply.get-existing group-name)))
         (let [expected {:group group-name
                         :fg "#111111"
                         :bg "#eeeeee"
                         :ctermfg 7
                         :ctermbg 0
                         :bold true
                         :italic true
                         :underline true
                         :undercurl true
                         :special "#444444"
                         :blend 3}]
           (t.ok? (vim.deep_equal expected (apply.get-existing group-name))
                  "Get's all of the existing hl attributes for a hl-group")
           (do-ex "silent! highlight clear" group-name)))
