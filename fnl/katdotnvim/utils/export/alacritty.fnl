(module katdotnvim.utils.export.alacritty
  {autoload {hsl externals.hsluv
             ucolors katdotnvim.utils.color
             colors katdotnvim.color
             groups katdotnvim.highlights.main
             main katdotnvim.main
             exports katdotnvim.utils.export.init
             errors katdotnvim.utils.errors
             a aniseed.core}
   require-macros [katdotnvim.utils.macros]})

;; Exports 16 colors for alacritty terminal

(def- loop vim.loop)

(def comment-type "#")

;; FN -- generates a table of colors for kitty colors
;; $output -- table of colors where the key is the string for the alacritty group
(defn gen-colors []
  ; check if kat.nvim/kat.nwim is used
  (if (and (not= vim.g.colors_name :kat.nvim)
           (not= vim.g.colors_name :kat.nwim))
    (do (errors.errMessage 1 "Not a kat.nvim colorscheme, theme won't compile"))
    (do
      (local white (if (= vim.o.background :light)
                       (.. "'" (. (colors.background) 1) "'")
                       (.. "'" (. (colors.foreground) 1) "'")))
      (local black (if (= vim.o.background :light)
                       (.. "'" (. (colors.foreground) 1) "'")
                       (.. "'" (. (colors.background) 1) "'")))
      (local cyan (.. "'" (ucolors.brighten (. (groups.selectionBG) 1) 0.3) "'"))
      (if (and (not= vim.g.colors_name :kat.nvim)
               (not= vim.g.colors_name :kat.nwim))
          (do (errors.errMessage 1 "Not a kat.nvim colorscheme, theme won't compile"))

          (do (let [output 
                    {"colors:"
                     {" primary:"
                      {
                       "  background:" (.. "'" (. (groups.mainBG) 1) "'")
                       "  foreground:" (.. "'" (. (groups.mainFG) 1) "'")
                       "  dim_foreground:" (.. "'" (. (groups.umbraFG) 1) "'")
                       "  bright_foreground:" (.. "'" (. (groups.meldFG) 1) "'")
                       "  dim_background:" (.. "'" (. (groups.umbraBG) 1) "'")
                       "  bright_background:" (.. "'" (. (groups.meldBG) 1) "'")}
                      " cursor:"
                      {
                       "  text:" (.. "'" (. (groups.mainBG) 1) "'")
                       "  cursor:" (.. "'" (. (groups.mainFG) 1) "'")}
                      " normal:"
                      {
                       "  black:" black
                       "  red:" (.. "'" (. (colors.normal-colors) :red) "'")
                       "  blue:" (.. "'" (. (colors.normal-colors) :blue) "'")
                       "  green:" (.. "'" (. (colors.normal-colors) :green) "'")
                       "  yellow:" (.. "'" (. (colors.normal-colors) :orange) "'")
                       "  cyan:" (.. "'" (. (colors.normal-colors) :purple) "'")
                       "  magenta:" (.. "'" (. (colors.normal-colors) :pink) "'")
                       "  white:" white}
                      " bright:"
                      (if (= vim.o.background :light)
                        (do {}
                            "  black:" (.. "'" (. (groups.umbraFG) 1) "'")
                            "  red:" (.. "'" (ucolors.darken (. (colors.normal-colors) :red) 0.2) "'")
                            "  green:" (.. "'" (ucolors.darken (. (colors.normal-colors) :green) 0.2) "'")
                            "  yellow:" (.. "'" (ucolors.darken (. (colors.normal-colors) :orange) 0.2) "'")
                            "  blue:" (.. "'" (ucolors.darken (. (colors.normal-colors) :blue) 0.2) "'")
                            "  magenta:" (.. "'" (ucolors.darken (. (colors.normal-colors) :pink) 0.2) "'")
                            "  cyan:" (.. "'" (ucolors.darken (. (colors.normal-colors) :purple) 0.2) "'")
                            "  white:" (.. "'" (. (groups.umbraBG) 1) "'"))
                        (do {
                             "  black:" (.. "'" (. (groups.umbraBG) 1) "'")
                             "  red:"  (.. "'" (ucolors.brighten (. (colors.normal-colors) :red) 0.2) "'")
                             "  green:" (.. "'" (ucolors.brighten (. (colors.normal-colors) :green) 0.2) "'")
                             "  yellow:" (.. "'" (ucolors.brighten (. (colors.normal-colors) :orange) 0.2) "'")
                             "  blue:" (.. "'" (ucolors.brighten (. (colors.normal-colors) :blue) 0.2) "'")
                             "  magenta:" (.. "'" (ucolors.brighten (. (colors.normal-colors) :pink) 0.2) "'")
                             "  cyan:" (.. "'" (ucolors.brighten (. (colors.normal-colors) :purple) 0.2) "'")
                             "  white:" (.. "'" (. (groups.umbraFG) 1) "'")}))
                      " dim:"
                      (if (= vim.o.background :dark)
                        (do {
                             "  black:" (.. "'" (. (groups.meldFG) 1) "'")
                             "  red:" (.. "'" (ucolors.darken (. (colors.normal-colors) :red) 0.2) "'")
                             "  green:" (.. "'" (ucolors.darken (. (colors.normal-colors) :green) 0.2) "'")
                             "  yellow:" (.. "'" (ucolors.darken (. (colors.normal-colors) :orange) 0.2) "'")
                             "  blue:" (.. "'" (ucolors.darken (. (colors.normal-colors) :blue) 0.2) "'")
                             "  magenta:" (.. "'" (ucolors.darken (. (colors.normal-colors) :pink) 0.2) "'")
                             "  cyan:" (.. "'" (ucolors.darken (. (colors.normal-colors) :purple) 0.2) "'")
                             "  white:" (.. "'" (. (groups.meldBG) 1) "'")})
                        (do {
                             "  black:" (.. "'" (. (groups.meldBG) 1) "'")
                             "  red:"  (.. "'" (ucolors.brighten (. (colors.normal-colors) :red) 0.2) "'")
                             "  green:" (.. "'" (ucolors.brighten (. (colors.normal-colors) :green) 0.2) "'")
                             "  yellow:" (.. "'" (ucolors.brighten (. (colors.normal-colors) :orange) 0.2) "'")
                             "  blue:" (.. "'" (ucolors.brighten (. (colors.normal-colors) :blue) 0.2) "'")
                             "  magenta:" (.. "'" (ucolors.brighten (. (colors.normal-colors) :pink) 0.2) "'")
                             "  cyan:" (.. "'" (ucolors.brighten (. (colors.normal-colors) :purple) 0.2) "'")
                             "  white:" (.. "'" (.. "'" (. (groups.meldFG) 1) "'"))}))
                      " selection:"
                      {
                       "  text:" :CellBackground
                       "  background:" (.. "'" (. (groups.selectionBG) 1) "'")}}}]
                output))))))

; FN -- output alacritty string to a file at the current working directory
(defn output []
  (local openMode (+ loop.constants.O_CREAT
                     loop.constants.O_WRONLY
                     loop.constants.O_TRUNC))
  (local fileName (string.format "alacritty-%s-%s.yml"
                                 (tostring vim.g.colors_name)
                                 (tostring vim.o.background)))
  ; open file object
  (local fd (assert (loop.fs_open fileName :w 0)))
  ; make file generally accessible
  (assert (loop.fs_chmod fileName 420))
  (assert (loop.fs_write fd (exports.generateString (gen-colors) :alacritty) 0))
  (exports.userExportNotify :alacritty)
  (assert (loop.fs_close fd)))

