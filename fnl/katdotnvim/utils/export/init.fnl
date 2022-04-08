(module katdotnvim.utils.export.init
  {autoload {hsl externals.hsluv
             ucolors katdotnvim.utils.color
             colors katdotnvim.color
             groups katdotnvim.highlights.main
             main katdotnvim.main
             kitty katdotnvim.utils.export.kitty
             alacritty katdotnvim.utils.export.alacritty
             rxvt katdotnvim.utils.export.rxvt
             a aniseed.core}
   require-macros [katdotnvim.utils.macros]})

(def- comment-type {})

;; FN -- iterate over a table of colors and mutate a needed string
;; This isn't very functional atm, but its the cleanest way to return a string that respects
;; order and nesting for configuration files that need it
;; @key -- key from nested table
;; @value -- value from nested table
(var color-string "")
(defn- iterate-nested-colors [key value]
  (match (type value)
    :string (do (set color-string (string.format "%s%s %s\n"
                                                 color-string
                                                 key
                                                 value)))
    :table (do (each [sub-key sub-val (pairs value)]
                 (if (= (type sub-val) :table)
                   (do
                     (set color-string (string.format "%s%s\n"
                                                      color-string
                                                      sub-key))
                     (iterate-nested-colors sub-key sub-val))
                   (do 
                     (set color-string (string.format "%s%s %s\n"
                                                      color-string
                                                      sub-key
                                                      sub-val))))))))

; FN -- generate the string necessary from the kittyColors output
; @colors -- table of color values generated
; @terminal -- the terminal we want to generate the string for
; $output -- a string formatted for kitty colorscheme format
(defn generateString [colors terminal]
  (set color-string "")
  (set color-string (string.format "%s %s terminal theme generated by kat.nvim\n%s Generated using %s colorscheme with background set to %s\n\n"
                                   (. comment-type 1)
                                   terminal
                                   (. comment-type 1)
                                   (tostring vim.g.colors_name)
                                   (tostring vim.o.background)))
  ; note that we iterate over a plain table or a nested color table here
  (each [key value (pairs colors)]
    (if (= (type value) :table)
      (do (set color-string (string.format "%s%s\n"
                                               color-string
                                               key))
        (iterate-nested-colors key value))
      (do (set color-string (string.format "%s%s %s\n"
                                           color-string
                                           key
                                           value)))))
  color-string)

; FN -- notify the user that a terminal theme was generated for said colorscheme
(defn userExportNotify [terminal]
  (vim.notify (string.format "kat.nvim: %s color file generated at cwd using %s colorscheme with %s background"
                             terminal
                             (tostring vim.g.colors_name)
                             (tostring vim.o.background))
              vim.log.levels.INFO))

; FN -- wrap terminal generation for a single function
(defn generateTerminalColors [terminal]
  (match (tostring terminal)
    :kitty (do 
             (tset comment-type 1 kitty.comment-type)
             (kitty.generateKittyTheme))
    :alacritty (do 
                 (tset comment-type 1 alacritty.comment-type)
                 (alacritty.output))
    :rxvt-unicode (do
                    (tset comment-type 1 rxvt.comment-type)
                    (rxvt.output))
    :urxvt (do
            (tset comment-type 1 rxvt.comment-type)
            (rxvt.output))))

; create user command for terminal color generation
(command- KatGenTermTheme {:nargs 1}
          "lua require('katdotnvim.utils.export.init').generateTerminalColors(<args>)")
