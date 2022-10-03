(module katdotnvim.utils.export.init
        {autoload {hsl externals.hsluv
                   color-table katdotnvim.color
                   s aniseed.string
                   message katdotnvim.utils.message.init
                   main katdotnvim.main
                   kitty katdotnvim.utils.export.kitty
                   alacritty katdotnvim.utils.export.alacritty
                   rxvt katdotnvim.utils.export.rxvt
                   konsole katdotnvim.utils.export.konsole}
         require-macros [katcros-fnl.macros.nvim.api.utils.macros]})

;;; Main file for exporting color files

;; Top level values
(def comment-type {})
(def- file-header "%s %s terminal theme generated by kat.nvim
%s Generated using %s colorscheme with background set to %s

")

(def terminals [:kitty :alacritty :konsole :urxvt :rxvt-unicode])

;; FN converts an RGB table to a comma delimited string
;; @rgb -- input rgb
;; $string -- output string

;; fnlfmt: skip
(defn rgb->string [rgb] "Converts decimal rgb table to a 256 color string
@rgb -- a seq table with 3 values, decimal rgb values
Returns a rgb color string"
      (let [string (string.format "%s,%s,%s"
                                  (math.floor (* (. rgb 1) 255))
                                  (math.floor (* (. rgb 2) 255))
                                  (math.floor (* (. rgb 3) 255)))]
        string))

;; FN converts a hex color string to a RGB color string
;; @hex -- input hex
;; $string -- output string
(defn hex->rgb-string [hex] "Converts a hex color to a 256 rgb string
@hex -- a hex string
Returns a color rgb string"
      (let [string (rgb->string (hsl.hex_to_rgb hex))]
        string))

;; FN -- iterate over a table of colors and mutate a needed string
;; -- This handles nested color tables for one line color strings
;; TODO -- make a true iterator?
;; @key -- key from nested table
;; @value -- value from nested table
;; $color-string mutated string of colors
(defn color-nest->one-line-color% [key value input-color]
      "Iterates over a nested color array and returns a one-line color config string
@key -- key from nested table
@value -- value from nested table
@input-color -- input hex color
Returns a new colorstring" (var color-string input-color)
      (match (type value)
        :table (do
                 (each [sub-key sub-val (pairs value)]
                   (match (type sub-val)
                     :table (do
                              (set color-string
                                   (string.format "%s%s\n" color-string sub-key))
                              (set color-string
                                   (color-nest->one-line-color% sub-key sub-val
                                                                color-string)))
                     :string (do
                               (set color-string
                                    (string.format "%s%s %s\n" color-string
                                                   sub-key sub-val)))))))
      color-string)

;; FN -- takes a nested table of colors and converts it to a nest aware one line string of colors
;; @colors -- the input color table
;; @terminal -- the terminal used
;; $color-string -- string to be put into a file
(defn table->one-line-color [colors terminal] "Converts nested table of colors to a one-line color config string
@colors -- input color table
@terminal -- string of terminal used
Returns a color string"
      (var color-string
           (string.format file-header (. comment-type 1) terminal
                          (. comment-type 1)
                          (tostring (. main.colors-name-mut 1))
                          (tostring (. main.background-mut 1))))
      (each [key value (pairs colors)]
        (set color-string (string.format "%s%s\n" color-string key))
        (set color-string (color-nest->one-line-color% key value color-string)))
      color-string)

;; FN -- takes an unnested table of strings and converts to a string
;; ----- with two lines, the first being the key and the second being the value
;; -- Note: this is a variant, no comment headline is created
;; @color -- input color table
;; @terminal -- terminal used
;; $color-string -- string to be put into a file
(defn string->two-line-color* [colors terminal] "Converts a table of strings to a two-line color config string, with no comments
@colors -- input color table
@terminal -- string of terminal used
Returns a color string"
      (let [color-string (s.join (let [tbl []]
                                   (each [key val (pairs colors)]
                                     (table.insert tbl
                                                   (string.format "%s\n%s\n"
                                                                  key val)))
                                   tbl))]
        color-string))

;; FN -- takes an unnested table of strings and converts it to a string with
;;  one line contains the key and value
;; @colors -- the input color table
;; @terminal -- the terminal used
;; $color-string -- string to be put into a file
(defn string->one-line-color [colors terminal] "Converts a table of strings to a one-line color config string
@colors -- input color table
@terminal -- string of terminal used
Returns a color string"
      (let [color-string (s.join (let [tbl []]
                                   (table.insert tbl
                                                 (string.format file-header
                                                                (. comment-type
                                                                   1)
                                                                terminal
                                                                (. comment-type
                                                                   1)
                                                                (tostring (. main.colors-name-mut
                                                                             1))
                                                                (tostring (. main.background-mut
                                                                             1))))
                                   (each [key val (pairs colors)]
                                     (table.insert tbl
                                                   (string.format "%s %s\n" key
                                                                  val)))
                                   tbl))]
        color-string))

;; FN -- notify the user that a terminal theme was generated for said colorscheme
(defn notify$ [terminal] "Small wrapper around utils.message.init
@terminal -- string of terminal desired
Outputs a message on vim.notify"
      (message.info$ (string.format (message.<-table :utils.export.init
                                                     :term-theme-generated)
                                    terminal (. main.colors-name-mut 1)
                                    (. main.background-mut 1))))

;; FN -- see if we are using a kat.nvim colorscheme
(defn is-colorscheme? [] "Returns true when we are using a kat.nvim theme"
      (if (and (not= (. main.colors-name-mut 1) :kat.nvim)
               (not= (. main.colors-name-mut 1) :kat.nwim))
          (do
            (message.error$ (message.<-table :utils.export.init
                                             :not-colorscheme))
            false)
          (do
            true)))

(defn generate-term-colors [terminal] "Runs terminal colorscheme generation
@terminal -- string of terminal"
      (if (= (is-colorscheme?) true)
          (match (tostring terminal)
            :kitty (do
                     (tset comment-type 1 kitty.comment-type)
                     (kitty.output!))
            :alacritty (do
                         (tset comment-type 1 alacritty.comment-type)
                         (alacritty.output!))
            :rxvt-unicode (do
                            (tset comment-type 1 rxvt.comment-type)
                            (rxvt.output!))
            :urxvt (do
                     (tset comment-type 1 rxvt.comment-type)
                     (rxvt.output!))
            :konsole (do
                       (konsole.output!))
            _ (do
                (message.error$ (string.format (message.<-table :utils.export.init
                                                                :invalid-arg)
                                               terminal))))))

;; FN -- wrap terminal generation for a single function
(defn gen_term_colors [terminal all?] "Function for Neovim interaction, determines what terminal is being run
@terminal -- string of terminal used"
      (if all?
          (match all?
            :all (let [colors [[:light :soft :kat.nwim]
                               [:light :hard :kat.nvim]
                               [:dark :soft :kat.nwim]
                               [:dark :hard :kat.nvim]]
                       old-contrast (. main.contrast-mut 1)
                       old-background (. main.background-mut 1)
                       old-colors-name (. main.colors-name-mut 1)]
                   (each [_ v (ipairs colors)]
                     (tset main.background-mut 1 (. v 1))
                     (tset main.contrast-mut 1 (. v 2))
                     (tset main.colors-name-mut 1 (. v 3))
                     (color-table.update)
                     (generate-term-colors terminal))
                   (tset main.background-mut 1 old-background)
                   (tset main.contrast-mut 1 old-contrast)
                   (tset main.colors-name-mut 1 old-colors-name))
            _ (do
                (message.error$ (string.format (message.<-table :utils.export.init
                                                                :invalid-arg)
                                               all?))))
          (generate-term-colors terminal)))

(defn command-completion [_ cmd-line] "Completion for ':KatGenTermTheme'"
      (let [command (cmd-line:gsub "^%w*" "")
            split-cmd (s.split command " ")
            output []]
        ;; (. split-cmd 1) is empty, start with 2
        (when (?. split-cmd 2)
          ;; First arg will always be preceded by space
          ;; If second character of arg is a word
          (if (string.match (command:sub 2 2) "%w")
              ;; Add matching completions to output
              (let [completion (command:sub 2 -1)]
                (each [_ terminal (ipairs terminals)]
                  (if (string.match terminal (.. "^" completion))
                      (table.insert output terminal))))
              ;; Else output all completions available
              (each [_ terminal (ipairs terminals)]
                (table.insert output terminal))))
        ;; This only ever contains 'all' as an arg
        (when (?. split-cmd 3)
          (do
            (table.insert output :all)))
        output))

;; create user command for terminal color generation
(cre-command :KatGenTermTheme
             (fn [args]
               (gen_term_colors (. args.fargs 1) (. args.fargs 2)))
             {:nargs "+" :complete command-completion})
