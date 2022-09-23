(module katdotnvim.utils.highlight.init
        {autoload {get katdotnvim.utils.highlight.get}})

;;; Functions for highlighting

(defn get-existing [group] "Get existing highlights for a highlight group
@group -- group name"
      (let [gui (vim.api.nvim_get_hl_by_name group true)
            fg gui.foreground
            bg gui.background
            cterm (vim.api.nvim_get_hl_by_name group false)
            ctermfg cterm.foreground
            ctermbg cterm.background
            bold (?. gui :bold)
            underline (?. gui :undlerline)
            underlineline (?. gui :underlineline)
            undercurl (?. gui :undercurl)
            underdot (?. gui :underdot)
            underdash (?. gui :underdash)
            inverse (?. gui :inverse)
            italic (?. gui :italic)
            standout (?. gui :standout)
            nocombine (?. gui :nocombine)
            strikethrough (?. gui :strikethrough)]
        {: fg
         : bg
         : ctermbg
         : ctermfg
         : bold
         : underline
         : underlineline
         : undercurl
         : underdot
         : underdash
         : inverse
         : italic
         : nocombine
         : standout
         : strikethrough}))

(defn overwrite [opts] "Overwrite the values found for a group without clearing them out
@opts -- highlight table"
      (let [group (get.group opts)
            current-hl (get-existing group)
            output (vim.tbl_extend :force current-hl opts)]
        (tset output :group nil)
        (tset output :default nil)
        output))

;; FN -- generate a highlight with the appropriate hex color inputs and group
;; -- Warning, this is only public for testing, use highlight$ instead
;; -- Uses nvim api for users of Neovim 0.7 and newer
;; -- Has sideffects
;; @opts -- Neovim standard table of highlight values
(defn highlight$ [opts] "Nested highlight function that uses nvim api function to handle
highlighting for Neovim 0.7 and newer users
@opts -- highlight table"
      ;; for now assume that a group that has a link will simply be empty otherwise
      (if (get.link opts)
          (let [group (get.group opts)
                link (get.link opts)
                args {: link}]
            (vim.api.nvim_set_hl 0 group args))
          (get.default opts)
          (let [group (get.group opts)
                args (overwrite opts)]
            (vim.api.nvim_set_hl 0 group args))
          (let [group (get.group opts)
                gui-fore (if (and (not= (get.gui-fg opts) nil)
                                  (not= opts.fg :NONE) (not= opts.fg :SKIP))
                             opts.fg
                             nil)
                gui-back (if (and (not= (get.gui-bg opts) nil)
                                  (not= opts.bg :NONE) (not= opts.bg :SKIP))
                             opts.bg
                             nil)
                c-fore (if (and (not= (get.term-fg opts) nil)
                                (not= opts.ctermfg :NONE)
                                (not= opts.ctermfg :SKIP))
                           opts.ctermfg
                           nil)
                c-back (if (and (not= (get.term-bg opts) nil)
                                (not= opts.ctermbg :NONE)
                                (not= opts.ctermbg :SKIP))
                           opts.ctermbg
                           nil)
                args {:fg gui-fore
                      :bg gui-back
                      :ctermfg c-fore
                      :ctermbg c-back
                      :special (get.special opts)
                      :blend (get.blend opts)}]
            (each [k v (pairs (get.all-attr->table opts))]
              (tset args k v))
            (vim.api.nvim_set_hl 0 group args))))
