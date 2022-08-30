(module katdotnvim.utils.export.render
        {autoload {groups katdotnvim.highlights.main
                   a aniseed.core
                   json katdotnvim.utils.json.init
                   read katdotnvim.utils.json.read
                   write katdotnvim.utils.json.write
                   message katdotnvim.utils.message.init}
         require-macros [katcros-fnl.macros.nvim.api.utils.macros
                         katcros-fnl.macros.nvim.api.options.macros]})

;;; This module handles exporting the current color scheme to a set of predefined colors

;; FN -- deal with rendering the groups needed
(defn- render []
       (let [colors [{:light :kat.nwim}
                     {:light :kat.nvim}
                     {:dark :kat.nwim}
                     {:dark :kat.nvim}]
             old-color vim.g.colors_name
             old-background vim.o.background
             old-dontRender vim.g.kat_nvim_dontRender
             old-version vim.g.kat_nvim_max_version]
         (set-var g :kat_nvim_dontRender true)
         (each [_ v (ipairs colors)]
           (each [back color (pairs v)]
             (set-var g :colors_name color)
             (set-opt background back)
             (each [_ file (ipairs json.files)]
               (write.file! file))))
         (set-vars g {:kat_nvim_max_version old-version
                      :colors_name old-color
                      :kat_nvim_dontRender old-dontRender})
         (set-opt background old-background)))

;; init functions, very dirty and not a great implementation
(defn init [] (if (= vim.g.kat_nvim_compile_enable true)
                  (do
                    (message.warn$ (message.<-table :utils.export.render
                                                    :compilation-dev))
                    (if (= vim.g.kat_nvim_max_version :0.6)
                        (command*-vim :KatNvimRenderFiles {:nargs 0}
                                      "lua require('katdotnvim.utils.export.render').render()")
                        (command- :KatNvimRenderFiles
                                  (fn []
                                    (render))
                                  "render colorscheme file")))))
