(module katdotnvim.utils.export.render
        {autoload {groups katdotnvim.highlights.main
                   a aniseed.core
                   color-table katdotnvim.color
                   main katdotnvim.main
                   json katdotnvim.utils.json.init
                   view aniseed.view
                   read katdotnvim.utils.json.read
                   write katdotnvim.utils.json.write
                   message katdotnvim.utils.message.init}
         require-macros [katcros-fnl.macros.nvim.api.utils.macros
                         katcros-fnl.macros.nvim.api.options.macros]})

;;; This module handles exporting the current color scheme to a set of predefined colors

;; FN -- deal with rendering the groups needed
(defn- render-file [] "Render to file for built in color files"
       (let [colors [[:light :soft :kat.nwim]
                     [:light :hard :kat.nvim]
                     [:dark :soft :kat.nwim]
                     [:dark :hard :kat.nvim]]
             old-contrast (. main.contrast-mut 1)
             old-background (. main.background-mut 1)
             old-version vim.g.kat_nvim_max_version]
         (each [_ v (ipairs colors)]
           (tset main.background-mut 1 (. v 1))
           (tset main.contrast-mut 1 (. v 2))
           (color-table.update)
           (each [_ file (ipairs json.files)]
             (write.file! file (json.encode (json.file-parse file)) (. v 3))))
         (set-vars g {:kat_nvim_max_version old-version})
         (tset main.background-mut 1 old-background)
         (tset main.contrast-mut 1 old-contrast)))

(defn- render-color [args mutations] "Render color for a variation
@args -- a seq table of arguments
         1. table of highlight tables
         2. source
         3. colors_name
@mutations -- a seq table of mutations to use
              1. background
              2. contrast"
       (tset main.background-mut 1 (. mutations 1))
       (tset main.contrast-mut 1 (. mutations 2)) (color-table.update)
       (write.override-file! (json.encode (. args 2)) (. args 1) (. args 3)))

(defn- render-color* [args] "Render for all color variants
@args -- a seq table of arguments
         1. table of highlight tables
         2. source
         3. colors_name"
       (let [colors [[:light :soft :kat.nwim]
                     [:light :hard :kat.nvim]
                     [:dark :soft :kat.nwim]
                     [:dark :hard :kat.nvim]]]
         (each [_ mutator (pairs colors)]
           (tset main.background-mut 1 (. mutator 1))
           (tset main.contrast-mut 1 (. mutator 2))
           (color-table.update)
           (write.override-file! (json.encode (. args 2)) (. args 1)
                                 (. mutator 3)))))

(defn override [args] "Override groups of colors
Takes a single table, of which contains 2 keys
1. 'source' a string that describes the source this override comes from
  - implies your account name
2. the override type which is used to declare the override
 - can be one of the following
  - 'light_hard'
  - 'dark_hard'
  - 'light_soft'
  - 'dark_soft'
The second key contains a table of highlight tables.
It is best to make an override for each possible 2nd key"
      (let [old-contrast (. main.contrast-mut 1)
            old-background (. main.background-mut 1)
            old-version vim.g.kat_nvim_max_version
            assertion []]
        (each [k _ (pairs args)]
          (table.insert assertion true))
        (assert (= (length assertion) 2) "only 2 arguments allowed")
        (if (?. args :light_hard)
            (render-color [args.source args.light_hard :kat.nvim]
                          [:light :hard]))
        (if (?. args :light_soft)
            (render-color [args.source args.light_soft :kat.nwim]
                          [:light :soft]))
        (if (?. args :dark_hard)
            (render-color [args.source args.dark_hard :kat.nvim] [:dark :hard]))
        (if (?. args :dark_soft)
            (render-color [args.source args.dark_soft :kat.nwim] [:dark :soft]))
        (set-vars g {:kat_nvim_max_version old-version})
        (tset main.background-mut 1 old-background)
        (tset main.contrast-mut 1 old-contrast)))

(defn override_all [args] "Override all possible colors with no variation
Takes a table of 2 values
1. 'source' - a string that describes the source this override comes from
  - implies your account name
2. a table of highlight tables
This is generally recommended if your override doesn't have to change for the variations
of kat.nvim"
      (let [old-contrast (. main.contrast-mut 1)
            old-background (. main.background-mut 1)
            old-version vim.g.kat_nvim_max_version
            assertion []]
        (each [k _ (pairs args)]
          (table.insert assertion true))
        (assert (= (length assertion) 2) "only 2 arguments allowed")
        (render-color* [args.source (. args 1)])
        (set-vars g {:kat_nvim_max_version old-version})
        (tset main.background-mut 1 old-background)
        (tset main.contrast-mut 1 old-contrast)))

;; init functions, very dirty and not a great implementation
(defn init []
      (if (= vim.g.kat_nvim_max_version :0.6)
          (do
            (command*-vim :KatNvimRender {:nargs 0}
                          "lua require('katdotnvim.utils.export.render').render-file()"))
          (do
            (command- :KatNvimRender
                      (fn []
                        (render-file))
                      "Render kat.nvim colorscheme to file"))))
