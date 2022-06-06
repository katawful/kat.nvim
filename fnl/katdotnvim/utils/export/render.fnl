(module katdotnvim.utils.export.render
        {autoload {groups katdotnvim.highlights.main
                   a aniseed.core
                   message katdotnvim.utils.message.init}
         require-macros [katcros-fnl.macros.nvim.api.utils.macros
                         katcros-fnl.macros.nvim.api.options.macros]})

;;; This module handles exporting the current color scheme to a set of predefined colors

;; FN -- get the groups from a color file as a string
;; @source -- the file in question
;; $output-string -- the string of groups
(defn get-groups [source] (var output-string "")
      (each [_ v (pairs ((. (require source.path) :high-colors)))]
        (if (= (type v) :function)
            (let [current [(v)]]
              (set output-string
                   (string.format "%s\n  %s\n" output-string (a.pr-str current))))
            (set output-string
                 (string.format "%s\n  %s\n" output-string (a.str v)))))
      output-string)

;; FN -- constructs the internal string
;; -- makes sure to keep versioning in check

;; fnlfmt: skip
(defn internal-string [source]
      (let [old-version vim.g.kat_nvim_max_version]
        (var output-string "") ; if version is not empty
        (if (not= (?. source :version) nil)
            (do
              (let- :g :kat_nvim_max_version
                    source.version)
              (set output-string
                   (string.format 
                     "(if (= vim.g.kat_nvim_max_version \"%s\")
      (values
        %s
        )"
                     source.version
                     (get-groups source)))
              (let- :g :kat_nvim_max_version old-version)
              (set output-string
                   (string.format 
                     "%s
      (values
        %s
        ))"
                     output-string
                     (get-groups source)))
              (set output-string (get-groups source))))
        output-string))

;; FN -- output a file string to the appropriate file
;; -- destructive
;; @file -- file string
;; @source -- source information
(defn file-string->file! [file source] "Outputs a file as a string to a file"
      (let [file-name (if (= source.types :none)
                          (.. :fnl/katdotnvim/exported/ source.name "-"
                              source.background "-" source.contrast :.fnl)
                          (.. :fnl/katdotnvim/exported/ source.types "/"
                              source.name "-" source.background "-"
                              source.contrast :.fnl))]
        (a.spit file-name file)))

;; FN -- build the string and output it to the necessary file
;; @source -- the source file
;; @color -- current colorscheme
;; @back -- current background

;; fnlfmt: skip
(defn build-string->file! [source color back]
      (let [source source
            contrast (if (= color :kat.nwim) :soft :hard)
            shade back
            output-string (if (= source.types :none)
                              (string.format 
                               "(module katdotnvim.exported.%s-%s-%s
  {autoload {run katdotnvim.utils.highlight.run}})
(defn render []
 [%s])
(defn init [] (run.highlight$<-table (render)))"
                               source.name shade contrast
                               (internal-string source))

                              (string.format 
                               "(module katdotnvim.exported.%s.%s-%s-%s
  {autoload {run katdotnvim.utils.highlight.run}})
(defn render []
 [%s])
(defn init [] (run.highlight$<-table (render)))"
                               source.types source.name shade
                               contrast (internal-string source)))]
        (tset source :contrast contrast)
        (tset source :background shade)
        (file-string->file! output-string source)))

;; FN -- deal with rendering the groups needed
(defn start-group []
      (let [files [{:name :main :path :katdotnvim.highlights.main :types :none}
                   {:name :syntax
                    :path :katdotnvim.highlights.syntax
                    :types :none}
                   {:name :cmp
                    :path :katdotnvim.highlights.integrations.cmp
                    :types :integrations}
                   {:name :coc
                    :path :katdotnvim.highlights.integrations.coc
                    :types :integrations}
                   {:name :fugitive
                    :path :katdotnvim.highlights.integrations.fugitive
                    :types :integrations}
                   {:name :indent_blankline
                    :path :katdotnvim.highlights.integrations.indent_blankline
                    :types :integrations}
                   {:name :lsp
                    :path :katdotnvim.highlights.integrations.lsp
                    :types :integrations
                    :version :0.6}
                   {:name :startify
                    :path :katdotnvim.highlights.integrations.startify
                    :types :integrations}
                   {:name :treesitter
                    :path :katdotnvim.highlights.integrations.treesitter
                    :types :integrations}
                   {:name :ts_rainbow
                    :path :katdotnvim.highlights.integrations.ts_rainbow
                    :types :integrations}
                   {:name :markdown
                    :path :katdotnvim.highlights.filetype.markdown
                    :types :filetype}
                   {:name :vim
                    :path :katdotnvim.highlights.filetype.vim
                    :types :filetype}
                   {:name :vimwiki
                    :path :katdotnvim.highlights.filetype.vimwiki
                    :types :filetype}]
            colors [{:light :kat.nwim}
                    {:light :kat.nvim}
                    {:dark :kat.nwim}
                    {:dark :kat.nvim}]
            old-color vim.g.colors_name
            old-background vim.o.background
            old-dontRender vim.g.kat_nvim_dontRender
            old-version vim.g.kat_nvim_max_version]
        (let- :g :kat_nvim_dontRender true)
        (each [_ v (ipairs colors)]
          (each [back color (pairs v)]
            (let- :g :colors_name color)
            (set- background back)
            (each [_ v1 (ipairs files)]
              (build-string->file! v1 color back))))
        (let- :g :kat_nvim_max_version old-version)
        (let- :g :colors_name old-color)
        (set- background old-background)
        (let- :g :kat_nvim_dontRender old-dontRender)))

;; init functions, very dirty and not a great implementation
(defn init [] (if (= vim.g.kat_nvim_compile_enable true)
                  (do
                    (message.warn$ (message.<-table :utils.export.render
                                                    "compilation-dev"))
                    (if (= vim.g.kat_nvim_max_version :0.6)
                        (command*-vim :KatNvimRenderFiles {:nargs 0}
                                      "lua require('katdotnvim.utils.export.render').start_group()")
                        (command- :KatNvimRenderFiles
                                  (fn []
                                    (start-group))
                                  "render colorscheme file")))))
