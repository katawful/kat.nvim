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

{
 :com- com-
 :command- command-}

