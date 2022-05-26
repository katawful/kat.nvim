(module katdotnvim.utils.export.render
  {autoload {groups katdotnvim.highlights.main
             a aniseed.core}
   require-macros [katcros-fnl.macros.nvim.api.utils.macros
                   katcros-fnl.macros.nvim.api.options.macros]})

;;; This module handles exporting the current color scheme to a set of predefined colors

;; FN -- get the groups from a color file as a string
;; @source -- the file in question
;; $output-string -- the string of groups
(defn get-groups [source]
  (var output-string "")
  (each [_ v (pairs ((. (require source.path) :high-colors)))]
    (if (= (type v) :function)
      (set output-string (string.format "%s\n  %s" output-string (a.str (v))))
      (set output-string (string.format "%s\n  %s" output-string (a.str v)))))
  output-string)

;; FN -- reindent a group file
;; -- searches for beginning line that has a ':'
;; @file -- a file string
;; $output -- reindented file string
(defn reindent [file]
  "Reindents a file. Group names get indented so they're at the right indent level"
  (let [output (file:gsub "(^%s+:)" "  %1")]
    output))

;; FN -- output a file string to the appropriate file
;; -- destructive
;; @file -- file string
;; @source -- source information
(defn file-string->file! [file source]
  "Outputs a file as a string to a file"
  (let [file-name (if (= source.types :none)
                    (.. "fnl/katdotnvim/exported/" source.name "-" source.background "-" source.contrast ".fnl")
                    (.. "fnl/katdotnvim/exported/" source.types "/" source.name "-" source.background "-" source.contrast ".fnl"))]
    (a.spit file-name (reindent file))))

;; FN -- build the string and output it to the necessary file
;; @source -- the source file
;; @color -- current colorscheme
;; @back -- current background
(defn build-string->file [source color back]
  (let [source source
        contrast (if (= color "kat.nwim")
                  "soft"
                  "hard")
        shade back
        output-string
        (if (= source.types :none)
          (string.format
            "(module katdotnvim.exported.%s-%s-%s
  {autoload {run katdotnvim.utils.highlight.run}})
(defn render []
 [%s])
(defn init [] (run.highlight$<-table (render)))"
           source.name
           shade
           contrast
           (get-groups source))
          (string.format
            "(module katdotnvim.exported.%s.%s-%s-%s
  {autoload {run katdotnvim.utils.highlight.run}})
(defn render []
 [%s])
(defn init [] (run.highlight$<-table (render)))"
           source.types
           source.name
           shade
           contrast
           (get-groups source)))]
    (tset source :contrast contrast)
    (tset source :background shade)
    (file-string->file! output-string source)))


;; FN -- deal with rendering the groups needed
(defn start-group []
  (let [files [{:name :main :path :katdotnvim.highlights.main :types :none}
               {:name :syntax :path :katdotnvim.highlights.syntax :types :none}
               {:name :cmp :path :katdotnvim.highlights.integrations.cmp :types :integrations}
               {:name :coc :path :katdotnvim.highlights.integrations.coc :types :integrations}
               {:name :fugitive :path :katdotnvim.highlights.integrations.fugitive :types :integrations}
               {:name :indent_blankline :path :katdotnvim.highlights.integrations.indent_blankline :types :integrations}
               {:name :lsp :path :katdotnvim.highlights.integrations.lsp :types :integrations}
               {:name :startify :path :katdotnvim.highlights.integrations.startify :types :integrations}
               {:name :treesitter :path :katdotnvim.highlights.integrations.treesitter :types :integrations}
               {:name :ts_rainbow :path :katdotnvim.highlights.integrations.ts_rainbow :types :integrations}
               {:name :markdown :path :katdotnvim.highlights.filetype.markdown :types :filetype}
               {:name :vim :path :katdotnvim.highlights.filetype.vim :types :filetype}
               {:name :vimwiki :path :katdotnvim.highlights.filetype.vimwiki :types :filetype}]
        colors [{:light :kat.nwim}
                {:light :kat.nvim}
                {:dark :kat.nwim}
                {:dark :kat.nvim}]
        old-color vim.g.colors_name
        old-background vim.o.background
        old-dontRender vim.g.kat_nvim_dontRender]
    (let- :g :kat_nvim_dontRender 1)
    (each [_ v (ipairs colors)]
      (each [back color (pairs v)]
        (let- :g :colors_name color)
        (set- background back)
        (each [_ v1 (ipairs files)]
          (build-string->file v1 color back))))
    (let- :g :colors_name old-color)
    (set- background old-background)
    (let- :g :kat_nvim_dontRender old-dontRender)))

;; init functions, very dirty and not a great implementation
(defn init []
  ; TODO -- add > 0.7 support
  ; needs to be improved, I don't like how this works at all
  (command- :KatRenderFile (fn [] 
                             (start-group))
                           "render colorscheme file"))
