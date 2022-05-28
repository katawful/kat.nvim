(module katdotnvim.utils.warning
        {require-macros [katdotnvim.katcros-fnl.macros.nvim.api.options.macros]})

;; Handles warning management

;; FN -- create a warning message
;; @error-type -- the specified error type for easier troubleshooting, a number
;; @message -- a string message
(defn message$ [error-type message test]
      "Send a Neovim error message via vim.notify"
      (let [error-type (tostring error-type)
            message (tostring message)]
        (let [output (string.format "kat.nvim W%s: %s" error-type message)]
          (when (and (= test nil))
            (vim.notify output vim.log.levels.WARN))
          output)))
