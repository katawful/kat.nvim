;;; Macro file for option management

;; Private macros
;; Macro -- get the scope of an option
(fn get-scope [opt]
  "Macro -- get the scope of an option"
  (if (pcall vim.api.nvim_get_option_info opt)
    (. (vim.api.nvim_get_option_info opt) :scope)
    false))
;; Macro set the value of an option based on its scope
(fn set-option [option value scope]
  "Macro set the value of an option based on its scope"
  (match scope
    :global `(vim.api.nvim_set_option ,option ,value)
    :win `(vim.api.nvim_win_set_option 0 ,option ,value)
    :buf `(vim.api.nvim_buf_set_option 0 ,option ,value)))

;; Macro -- set a global option
(fn setg- [option value]
  "Macro -- set a global option"
  (let [option (tostring option)]
    `(tset vim.opt_global ,option ,value)))

;; Macro -- set a local option
(fn setl- [option value]
  "Macro -- set a local option"
  (let [option (tostring option)]
    `(tset vim.opt_local ,option ,value)))

;; Macro -- set a window option
(fn setw- [option value]
  "Macro -- set a window option"
  (let [option (tostring option)]
    (set-option option value :win)))

;; Macro -- set an option generically if possible
(fn set- [option value]
  "Macro -- set an option generically if possible"
  (let [option (tostring option)
        value value
        scope# (get-scope option)]
    (set-option option value scope#)))

;; Macro -- append a value to an option
(fn seta- [option value]
  "Macro -- append a value to an option"
  (let [option  (tostring option)]
    `(tset vim.opt ,option (+ (. vim.opt ,option) ,value))))

;; Macro -- prepend a value to an option
(fn setp- [option value]
  "Macro -- prepend a value to an option"
  (let [option (tostring option)]
    `(tset vim.opt ,option (^ (. vim.opt ,option) ,value))))

;; Macro -- remove a value from an option
(fn setr- [option value]
  "Macro -- remove a value from an option"
  (let [option (tostring option)]
    `(tset vim.opt ,option (- (. vim.opt ,option) ,value))))

;; Macro -- set a variable of some scope
;; @scope -- a character string of the scope
;; @obj -- the variable as a string
;; @... -- the options
(fn let- [scope obj ...]
  "Macro -- set a variable of some scope"
  (let [scope (tostring scope)
        obj (tostring obj)
        output [...]
        value []]
    (var value "")
    ; if number of operands is 1
    (if (= (length output) 1
         (each [key val (pairs output)]
           ; set the output to just the value of the operands
           (set value val)))
      (> (length output) 1
         ; else set the output to the whole table
        (do (set value output))))
    (match scope
      :g `(tset vim.g ,obj ,value)
      :b `(tset vim.b ,obj ,value)
      :w `(tset vim.w ,obj ,value)
      :t `(tset vim.t ,obj ,value)
      :v `(tset vim.v ,obj ,value)
      :env `(tset vim.env ,obj ,value))))

{
 :let- let-
 :set- set-
 :setl- setl-
 :setg- setg-
 :seta- seta-
 :setp- setp-
 :setr- setr-
 :setw- setw-}

