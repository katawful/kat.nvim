;;; Macros for Neovim utilities

;; Macro -- call Ex/user commands a bit more cleanly
;; @function -- the function demanded
;; @... -- string for arguments
(fn com- [function ...]
  "Macro -- call Ex/user commands a bit more cleanly"
  (let [function (tostring function)
        args [...]]
    (var output function)
    (each [k v (pairs args)]
      (set output (.. output " " (tostring v))))
    `(vim.api.nvim_command ,output)))

;; Macro -- create a user command
;; Has 3 outputs
;; 1 -- No description, but opts table
;; 2 -- Description and optional opts table
;; 3 -- Just name and command
;; @name -- name for user command, should start with a capital
;; @command -- whatever fennel function desired
;; @desc -- description, or opts table if no description
;; @args -- opts table when description is used
(fn command- [name command desc args]
  (let [opts# {}]
    (if (= (type desc) :table)
      ; no description but opts table
      (do
        `(vim.api.nvim_create_user_command ,name ,command ,desc))
      (= (type desc) :string)
      ; descriptin and optional opts table
      (do
        (tset opts# :desc desc)
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.api.nvim_create_user_command ,name ,command ,opts#))
      ; no additional options or description
      (do
        `(vim.api.nvim_create_user_command ,name ,command ,opts#)))))

;; Macro -- create a user command using vimscript for non-0.7 users
;; @name -- command name
;; @attributes -- a table of user command attributes
;; @vimscript -- whatever vimscript one is running
(fn command*-vim [name attributes vimscript]
   ; TODO - think about having bang be optional
  (var output# "command! ")
  ; parse each value in the attribute table
  ; most are just true/false values so they don't need an argument
  (each [k v (pairs attributes)]
    (match k
      :buffer (set output# (.. output# "-buffer "))
      :bang (set output# (.. output# "-bang "))
      :bar (set output# (.. output# "-bar "))
      :register (set output# (.. output# "-register "))
      :complete (set output# (.. output# "-complete=" (tostring v) " "))
      :nargs (set output# (.. output# "-nargs=" (tostring v) " "))
      :range (do
               (if (= v true)
                 (set output# (.. output# "-range "))
                 (set output# (.. output# "-range=" (tostring v) " "))))
      :addr (set output# (.. output# "-nargs=" (tostring v)))))
  (set output# (.. output# name " " vimscript))
  `(do
     (vim.api.nvim_command ,output#)))

{
 :com- com-
 :command- command-
 :command*-vim command*-vim}
