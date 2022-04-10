(module katdotnvim.utils.export.init
  {autoload {hsl externals.hsluv
             ucolors katdotnvim.utils.color
             colors katdotnvim.color
             groups katdotnvim.highlights.main
             main katdotnvim.main
             errors katdotnvim.utils.errors
             kitty katdotnvim.utils.export.kitty
             alacritty katdotnvim.utils.export.alacritty
             rxvt katdotnvim.utils.export.rxvt
             konsole katdotnvim.utils.export.konsole
             a aniseed.core}
   require-macros [katdotnvim.utils.macros]})

;;; Main file for exporting color files

;; Top level values
(def- comment-type {})

;; FN converts an RGB table to a comma delimited string
;; @rgb -- input rgb
;; $string -- output string
(defn rgb->string [rgb]
  (var string "")
  (set string (string.format
                "%s,%s,%s"
                (* (. rgb 1) 255)
                (* (. rgb 2) 255)
                (* (. rgb 3) 255)))
  string)

;; FN converts a hex color string to a RGB color string
;; @hex -- input hex
;; $string -- output string
(defn hex->rgb-string [hex]
  (local string (rgb->string (hsl.hex_to_rgb hex)))
  string)

;; FN -- iterate over a table of colors and mutate a needed string
;; -- This handles nested color tables for one line color strings
;; TODO -- make a true iterator?
;; @key -- key from nested table
;; @value -- value from nested table
;; $color-string mutated string of colors
(defn- color-nest->one-line-color% [key value input-color]
  "Iterates over a nested color array and returns a one-line color config string"
  (var color-string input-color)
  (match (type value)
    :table (do (each [sub-key sub-val (pairs value)]
                 (match (type sub-val)
                   :table (do
                            (set color-string (string.format "%s%s\n"
                                                             color-string
                                                             sub-key))
                            (set color-string
                                 (color-nest->one-line-color% sub-key sub-val color-string)))
                   :string (do
                            (set color-string (string.format "%s%s %s\n"
                                                             color-string
                                                             sub-key
                                                             sub-val)))))))
  color-string)

;; FN -- takes a nested table of colors and converts it to a nest aware one line string of colors
;; @colors -- the input color table
;; @terminal -- the terminal used
;; $color-string -- string to be put into a file
(defn table->one-line-color [colors terminal]
  "Converts nested table of colors to a one-line color config string"
  (var color-string (string.format
                      "%s %s terminal theme generated by kat.nvim
%s Generated using %s colorscheme with background set to %s\n\n"
                      (. comment-type 1)
                      terminal
                      (. comment-type 1)
                      (tostring vim.g.colors_name)
                      (tostring vim.o.background)))
  (each [key value (pairs colors)]
    (set color-string (string.format "%s%s\n"
                                     color-string
                                     key))
    (set color-string (color-nest->one-line-color% key value color-string)))
  color-string)

;; FN -- takes an unnested table of strings and converts to a string
;; ----- with two lines, the first being the key and the second being the value
;; -- Note: this is a variant, no comment headline is created
;; @color -- input color table
;; @terminal -- terminal used
;; $color-string -- string to be put into a file
(defn string->two-line-color* [colors terminal]
  "Converts a table of strings to a two-line color config string, with no comments"
  (var color-string "")
  (each [key val (pairs colors)]
    (set color-string (string.format "%s%s\n%s\n"
                                     color-string
                                     key
                                     val)))
  color-string)

;; FN -- takes an unnested table of strings and converts it to a string with
;;  one line contains the key and value
;; @colors -- the input color table
;; @terminal -- the terminal used
;; $color-string -- string to be put into a file
(defn string->one-line-color [colors terminal]
  "Converts a table of strings to a one-line color config string"
  (var color-string (string.format
                      "%s %s terminal theme generated by kat.nvim
%s Generated using %s colorscheme with background set to %s\n\n"
                      (. comment-type 1)
                      terminal
                      (. comment-type 1)
                      (tostring vim.g.colors_name)
                      (tostring vim.o.background)))
  (each [key val (pairs colors)]
    (set color-string (string.format "%s%s %s\n"
                                     color-string
                                     key
                                     val)))
  color-string)

;; FN -- notify the user that a terminal theme was generated for said colorscheme
(defn notify$ [terminal]
  "Notifies the user about the generated color file"
  (vim.notify (string.format "kat.nvim: %s color file generated at cwd using %s colorscheme with %s background"
                             terminal
                             (tostring vim.g.colors_name)
                             (tostring vim.o.background))
              vim.log.levels.INFO))

;; FN -- see if we are using a kat.nvim colorscheme
(defn is-colorscheme? []
  "Returns true when we are using a kat.nvim theme"
  (if (and (not= vim.g.colors_name :kat.nvim)
           (not= vim.g.colors_name :kat.nwim))
    (do (errors.errMessage 1 "Not a kat.nvim colorscheme, theme won't compile")
      false)
    (do true)))

;; FN -- wrap terminal generation for a single function
(defn gen_term_colors [terminal]
  "Function for Neovim interaction, determines what terminal is being run"
  (if (= (is-colorscheme?) true)
   (match (tostring terminal)
     :kitty (do (tset comment-type 1 kitty.comment-type)
              (kitty.output!))
     :alacritty (do (tset comment-type 1 alacritty.comment-type)
                  (alacritty.output!))
     :rxvt-unicode (do (tset comment-type 1 rxvt.comment-type)
                     (rxvt.output!))
     :urxvt (do (tset comment-type 1 rxvt.comment-type)
             (rxvt.output!))
     :konsole (do (konsole.output!)))))

;; create user command for terminal color generation
(command- KatGenTermTheme {:nargs 1}
          "lua require('katdotnvim.utils.export.init').gen_term_colors(<args>)")
