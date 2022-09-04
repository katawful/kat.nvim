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
       (let [colors [{:light :soft}
                     {:light :hard}
                     {:dark :soft}
                     {:dark :hard}]
             old-contrast (. main.contrast-mut 1)
             old-background (. main.background-mut 1)
             old-dontRender vim.g.kat_nvim_dontRender
             old-version vim.g.kat_nvim_max_version]
         (set-var g :kat_nvim_dontRender true)
         (each [_ v (ipairs colors)]
           (each [back contrast (pairs v)]
             (tset main.background-mut 1 back)
             (tset main.contrast-mut 1 contrast)
             (color-table.update)
             (each [_ file (ipairs json.files)]
               (write.file! file))))
         (set-vars g {:kat_nvim_max_version old-version
                      :kat_nvim_dontRender old-dontRender})
         (tset main.background-mut 1 old-background)
         (tset main.contrast-mut 1 old-contrast)))

(defn- render-color [args mutations] "Render color for a variation"
       (tset main.background-mut 1 (. mutations 1))
       (tset main.contrast-mut 1 (. mutations 2))
       (color-table.update)
       (write.override-file! (json.encode (. args 2)) (. args 1) (. args 3)))

(defn- render-color* [args] "Render for all color variants"
       (let [colors [[:light :soft :kat.nwim]
                     [:light :hard :kat.nvim]
                     [:dark :soft :kat.nwim]
                     [:dark :hard :kat.nvim]]]
         (each [_ mutator (pairs colors)]
           (tset main.background-mut 1 (. mutator 1))
           (tset main.contrast-mut 1 (. mutator 2))
           (color-table.update)
           (write.override-file! (json.encode (. args 2)) (. args 1) (. mutator 3)))))

(defn override [args] "Override groups of colors"
    (let [old-contrast (. main.contrast-mut 1)
          old-background (. main.background-mut 1)
          old-dontRender vim.g.kat_nvim_dontRender
          old-version vim.g.kat_nvim_max_version]
      (set-var g :kat_nvim_dontRender true)
      (if (?. args :light_hard)
        (render-color [args.source args.light_hard :kat.nvim] [:light :hard]))
      (if (?. args :light_soft)
       (render-color [args.source args.light_soft :kat.nwim] [:light :soft]))
      (if (?. args :dark_hard)
        (render-color [args.source args.dark_hard :kat.nvim] [:dark :hard]))
      (if (?. args :dark_soft)
        (render-color [args.source args.dark_soft :kat.nwim] [:dark :soft]))
      (set-vars g {:kat_nvim_max_version old-version
                   :kat_nvim_dontRender old-dontRender})
      (tset main.background-mut 1 old-background)
      (tset main.contrast-mut 1 old-contrast)))

(defn override_all [args] "Override all possible colors with no variation"
    (let [old-contrast (. main.contrast-mut 1)
          old-background (. main.background-mut 1)
          old-dontRender vim.g.kat_nvim_dontRender
          old-version vim.g.kat_nvim_max_version]
      (set-var g :kat_nvim_dontRender true)
      (render-color* [args.source (. args 1)])
      (set-vars g {:kat_nvim_max_version old-version
                   :kat_nvim_dontRender old-dontRender})
      (tset main.background-mut 1 old-background)
      (tset main.contrast-mut 1 old-contrast)))

;; init functions, very dirty and not a great implementation
(defn init [] (if (= vim.g.kat_nvim_max_version :0.6)
                  (do
                    (command*-vim :KatNvimRenderFiles {:nargs 0}
                                  "lua require('katdotnvim.utils.export.render').render-file()"))
                  (do
                    (command- :KatNvimRenderFiles
                              (fn []
                                (render-file))
                              "render colorscheme file"))))
