;;; Macro file for autocommands

;; Macro -- create an augroup to return as a variable
;; @name -- name of group
;; @no-clear -- if true, don't clear out group. opposite of default
(fn def-aug- [name no-clear]
  "Macro -- define an auto group for return"
  (if (= no-clear (or false nil))
    `(vim.api.nvim_create_augroup ,name {:clear true})
    `(vim.api.nvim_create_augroup ,name {:clear false})))

;; Macro -- create autocommand
(fn auc- [events pattern callback desc args]
  "Macro -- create autocommand"
  (let [opts# {}
        call-type# (if (= (type callback) :string)
                     :command
                     :callback)]
    ; if no desc string, just insert that table
    (if (= (type desc) :table)
      (do
        (tset desc call-type# callback)
        (tset desc :pattern pattern)
        `(vim.api.nvim_create_autocmd ,events ,desc))
      ; if a desc string, add them all to the opts table
      (= (type desc) :string)
      (do
        (tset opts# :desc desc)
        (tset opts# call-type# callback)
        (tset opts# :pattern pattern)
        (if (not= args nil)
          (each [key val (pairs args)]
            (tset opts# key val)))
        `(vim.api.nvim_create_autocmd ,events ,opts#))
      ; no additional options or description
      (do
        (tset opts# :pattern pattern)
        (tset opts# call-type# callback)
        `(vim.api.nvim_create_autocmd ,events ,opts#)))))

;; Macro -- use an autogroup
(fn aug- [group ...]
  "Macro -- insert auto group into autocmd calls"
  (let [autocmd# [...]
        out# []]
    (each [key# val# (ipairs autocmd#)]
      ; (assert-compile (list? val#) "expected list for body" val#)
      (assert-compile (if (= (tostring (. val# 1)) "auc-") "auc-")
                      "expected autocmd call" (. val# 1))
      (if (= (tostring (. val# 1)) "auc-")
        (do
          ; see if have table
          (var had-table# false)
          (each [k# v# (pairs val#)]
            ; gotta make sure its an actual table
            ; not a list or symbol
            (if (and (not= k# 2)
                     (= (type v#) :table)
                     (not= (list? v#) v#)
                     (not= (sym? v#) v#))
              (do
                (tset v# :group group)
                (set had-table# true))))
          (if (= had-table# false)
            (do
              (table.insert val# {:group group})))
          (table.insert out# val#))))
    `,out#))

{
 :aug- aug-
 :auc- auc-
 :def-aug- def-aug-}

