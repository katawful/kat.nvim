; general vim.cmd functions
(fn cmd [string]
  `(vim.cmd ,string))

; convert to string)
(fn sym-tostring [x]
  `,(tostring x))

; nvim_api_command
; for Ex commands/user commands
(fn com- [function ...]
  (let [function (sym-tostring function)
        args [...]]
    (var output function)
    (each [k v (pairs args)]
      (set output (.. output " " (sym-tostring v))))
    `(vim.api.nvim_command ,output)))

; define a user command
(fn command- [name attributes vimscript]
  (let [name (.. (sym-tostring name) " ")
        attributes attributes
        vimscript vimscript]
    ; TODO - think about having bang be optional
    (var output "command! ")
    ; parse each value in the attribute table
    ; most are just true/false values so they don't need an argument
    (each [k v (pairs attributes)]
      (match k
        :buffer (set output (.. output "-buffer "))
        :bang (set output (.. output "-bang "))
        :bar (set output (.. output "-bar "))
        :register (set output (.. output "-register "))
        :complete (set output (.. output "-complete=" (sym-tostring v) " "))
        :nargs (set output (.. output "-nargs=" (sym-tostring v) " "))
        :range (do
                 (if (= v true)
                   (set output (.. output "-range "))
                   (set output (.. output "-range=" (sym-tostring v) " "))))
        :addr (set output (.. output "-nargs=" (sym-tostring v)))))
    (set output (.. output name vimscript))
    `(do
       (vim.api.nvim_command ,output))))

; require configs
; lua options really, i find the table lookup syntax to be garbage
(fn opt- [tableOrigin lookupValue ...]
  (let [tableOrigin (sym-tostring tableOrigin)
        lookupValue (sym-tostring lookupValue)
        output [...]]
       `(do
          ((. (require ,tableOrigin) ,lookupValue)
           ,...))))

; get the scope of an option (global, window, or buffer)
(fn get-scope [opt]
  (if (pcall vim.api.nvim_get_option_info opt)
    (. (vim.api.nvim_get_option_info opt) :scope)
    false))

; passed function used to actually set options
(fn set-option [option value scope]
  (match scope
    :global `(vim.api.nvim_set_option ,option ,value)
    :win `(vim.api.nvim_win_set_option 0 ,option ,value)
    :buf `(vim.api.nvim_buf_set_option 0 ,option ,value)))

; set global
(fn setg- [option value]
  (let [option (sym-tostring option)
        value value
        scope :buf]
    `(tset vim.opt_global ,option ,value)))

; set local
(fn setl- [option value]
  (let [option (sym-tostring option)
        value value
        scope :buf]
    `(tset vim.opt_local ,option ,value)))

; set vim options
; i didn't use vim.opt for this
; i wanted it to be as thorough as possible
(fn set- [option value]
  (let [option (sym-tostring option)
        value value
        scope (get-scope option)]
    (set-option option value scope)))

; set append
(fn seta- [option value]
  (let [option  (sym-tostring option)
        value (sym-tostring value)]
    `(tset vim.opt ,option (+ (. vim.opt ,option) ,value))))

; set prepend
(fn setp- [option value]
  (let [option (sym-tostring option)
        value value]
    `(tset vim.opt ,option (^ (. vim.opt ,option) ,value))))

; set remove
(fn setr- [option value]
  (let [option (sym-tostring option)
        value value]
    `(tset vim.opt ,option (- (. vim.opt ,option) ,value))))

; set colorscheme
(fn col- [scheme]
  (let [scheme (.. "colorscheme " (sym-tostring scheme))]
  (cmd scheme)))

; augroup
(fn aug- [group ...]
  ; set up augroup group autocmd!
  (let [group (.. "augroup " (sym-tostring group) "\nautocmd!")]
    `(do
       (cmd ,group)
       ; do the autocmd
       (do
         ,...)
       ; close the autocmd group
       (cmd "augroup END"))))
; autocmd
(fn auc- [event filetype command]
  (let [event (sym-tostring event)
        filetype (sym-tostring filetype)
        command command]
    ; execute the autocmd
    ; i saw other macros that were much more robust, is this needed?
    ; proper lua support will come eventually anyways so this macro seems EOL
    `(do
      ,(cmd (string.format "autocmd %s %s %s" event filetype command)))))

; let
(fn let- [scope obj ...]
  (let [scope (sym-tostring scope)
       obj (sym-tostring obj)
       output []
       value []]
    (var output [...])
    (var value [])
    ; if number of operands is 1
    (if (= (length output) 1
      (each [key val (pairs output)]
        ; set the output to just the value of the operands
        (set value  val)))
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

; highlight function
; structure for me is:
; hi- group flag fg bg variarg
; variarg for most
(fn higui- [group fg bg ...]
  (let [group (tostring group)
        fg fg
        bg bg
        args [...]]
    (var variarg "")
    (if (> (length args) 0)
      (each [k v (pairs args)]
        (set variarg (.. variarg (tostring v)))))
    (var output (.. "highlight " group " guifg=" fg " guibg=" bg " " variarg))
    `(vim.cmd ,output)))

; nnoremap
(fn nno- [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is true
    (tset tab :noremap true)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :n ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :n ,left ,right ,tab)))))

; inoremap
(fn ino- [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is true
    (tset tab :noremap true)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :i ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :i ,left ,right ,tab)))))

; vnoremap
(fn vno- [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is true
    (tset tab :noremap true)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :v ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :v ,left ,right ,tab)))))

; tnoremap
(fn tno- [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is true
    (tset tab :noremap true)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :t ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :t ,left ,right ,tab)))))

; cnoremap
(fn cno- [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is true
    (tset tab :noremap true)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :c ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :c ,left ,right ,tab)))))

; nmap
(fn nm- [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is false
    (tset tab :noremap false)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :n ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :n ,left ,right ,tab)))))

; vmap
(fn vm- [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is false
    (tset tab :noremap false)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :v ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :v ,left ,right ,tab)))))

; imap
(fn im- [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is false
    (tset tab :noremap false)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :i ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :i ,left ,right ,tab)))))

; tmap
(fn tm- [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is false
    (tset tab :noremap false)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :t ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :t ,left ,right ,tab)))))

; cmap
(fn cm- [left right ...]
  (let [left left
        right right
        output []
        tab []]
    (var isBuffer false) ; so we don't have to specify not in a buffer
    ; set that noremap is false
    (tset tab :noremap false)
    ; set each option to be true
    (each [key val (ipairs [...])]
      ; buffer isn't an option for nvim_set_keymap
      ; if we see buffer, set flag
      ; else just set the option to true
      (if (= val :buffer)
        (do (set isBuffer true))
        (do (tset tab val true))))
    ; if buffer is set, use a buffer map
    (if (= isBuffer true)
      (do
        `(vim.api.nvim_buf_set_keymap 0 :c ,left ,right ,tab))
      (do
        `(vim.api.nvim_set_keymap :c ,left ,right ,tab)))))

{
 :ino- ino-
 :im- im-
 :vno- vno-
 :vm- vm-
 :tno- tno-
 :tm- tm-
 :cno- cno-
 :cm- cm-
 :nno- nno-
 :nm- nm-
 :let- let-
 :set- set-
 :setl- setl-
 :setg- setg-
 :seta- seta-
 :setp- setp-
 :setr- setr-
 :col- col-
 :cmd cmd
 :aug- aug-
 :auc- auc-
 :opt- opt-
 :com- com-
 :command- command-
}
