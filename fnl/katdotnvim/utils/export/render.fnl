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
(defn- render-file []
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

(defn- render-color [name source-colors]
       (write.override-file! (json.encode source-colors) name))

(defn override [source source-colors]
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
          (match source
            :plugin (render-color :plugin source-colors)
            _ (render-color source source-colors)
            nil (print "WHAT"))))
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
