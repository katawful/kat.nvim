(module katdotnvim.utils.json.init-test
        {autoload {json katdotnvim.utils.json.init}})

(defonce lua-table [{:key 1}
                    (fn [] {:key 2})
                    (fn [] [{:key 3}
                            {:key 4}
                            {:key 5}])])

(defonce json-object "[{\"key\":1},{\"key\":2},{\"key\":3},{\"key\":4},{\"key\":5}]")

(deftest encode
         (t.= json-object (json.encode lua-table)
                "Takes an arbitrary nested Lua table and returns a proper JSON"))

(deftest decode
         (t.ok? (vim.deep_equal (json.decode json-object) (json.expand-table lua-table))))
