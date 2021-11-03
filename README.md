![image](https://raw.githubusercontent.com/katawful/RandomAssets/main/neovim-colors.png)

# kat.nvim
A NeoVim theme with warm blue tones.
This is a Fennel remake of my [kat.vim](https://github.com/katawful/kat.vim) colorscheme, using Aniseed.
Lua is provided, along with an embedded Aniseed environment.

Built with Lua, this them is dynamic with only a few predefined colors.
Almost everything is generated dynamically.
Syntax is built off of groups, all statements inherent the colors of its parent color.

# Installation:
Install with your plugin manager of choice.
Example for vim-plug:
```vim
" kat.vim
Plug 'katawful/kat.nvim'
```

# Examples

kat.nvim   
![fennel dark hard](https://raw.githubusercontent.com/katawful/RandomAssets/main/fennel-dark-hard.png)

kat.nvim-owo   
![fennel dark soft](https://raw.githubusercontent.com/katawful/RandomAssets/main/fennel-dark-soft.png)

kat.lightenvim   
![fennel light hard](https://raw.githubusercontent.com/katawful/RandomAssets/main/fennel-light-hard.png)

kat.lightenvim-owo   
![fennel light soft](https://raw.githubusercontent.com/katawful/RandomAssets/main/fennel-light-soft.png)

# Options
There are currently 4 options: `g:kat_nvim_commentStyle`, `g:kat_nvim_integrations`, `g:kat_nvim_filetype`, and `g:kat_nvim_stupidFeatures`.
The following is a table explaining how these variables work, and what values they can take.

| Variable | Function | Options | Default |
|---|---|---|---|
| `g:kat_nvim_commentStyle` | affects how comments are styled | any valid `gui` string |  `'italic'` |
| `g:kat_nvim_integrations`| what plugins colors are loaded | a list of strings, see below for current integrations | all are enabled |
| `g:kat_nvim_filetype` | what filetype colors are loaded | a list of strings, see below for current filetypes | all are enabled |
| `g:kat_nvim_stupidFeatures` | features that work but probably shouldn't be used | boolean | `v:false` |

# Integrations
| Plugin |
| --- |
| [Native LSP](https://github.com/neovim/nvim-lspconfig) |
| [tree-sitter](https://github.com/nvim-treesitter/nvim-treesitter) |
| [Startify](https://github.com/mhinz/vim-startify) |
| [TS Rainbow](https://github.com/p00f/nvim-ts-rainbow) |
| [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) |

# Filetypes
|Filetypes|
|---|
|Vimscript|
|Markdown|
|Vimwiki|

# Contributing
I am always open to expanding this colorscheme.
This plugin was written in Fennel with Aniseed.
This means there are some peculiar requirements for making a PR, in addition for my design scope.

## Internal Variables
Due to how Aniseed works, and for ease of development, I require you to stick with using Aniseed's function/variable definition keywords.
They get exported much more reliably from the module you write them in (assuming you don't make them private).
If you are adding a new color variable for a module, first check `katdotnvim.colors`, `katdotnvim.highlights.main`, and `katdotnvim.highlights.syntax` for ones similar to it. If there isn't one, you have 2 options. If its local to an addition (say you need to blend a color for a statusline), it is ok to keep it within that module. If it's meant, at all, to do more, put it in `katdotnvim.highlights.main` or `katdotnvim.highlights.syntax` depending on if its a system color or a filetype color. Otherwise its best to not introduce new color variables

### Color functions vs. Color variables
Additionally, in order to keep runtime functionality of `:colorscheme`, you cannot use `def` to define color variables. You must use `defn` to define a function that returns a string. For color variables that just need get the value from another color function, you don't need to define a variable at all:
```clojure
(defn newColorVariable [] (. (colorFunctionWithLookup) :lookup))
(defn newColorVariable [] (plainColorFunction))
```

For colors that use one of the `katdotnvim.utils.color` functions, you must define a variable to return. Otherwise the function will be passed to internal functions, breaking the colorscheme:
```clojure
(defn newColorVariable []
  (def output (katdotnvim.utils.color.function ...))
	output)
```
