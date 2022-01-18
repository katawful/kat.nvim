![image](https://raw.githubusercontent.com/katawful/RandomAssets/main/colors-new-2022.png)

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
" kat.nvim
Plug 'katawful/kat.nvim'
```

# Example:
![example](https://raw.githubusercontent.com/katawful/RandomAssets/main/example-2022.png)

# Options
There are only 2 colorscheme files provided: `kat.nvim` and `kat.nwim`.
The former is a harder contrast, the latter is a softer contrast (the name being shortened from kat.nvim-owo).
To set between dark and light schemes, the `:set background` method is used.
Simply set the contrast to whichever you prefer, and set your background in your NeoVim configs.

See the examples above for the differences.

There are currently 4 options: `g:kat_nvim_commentStyle`, `g:kat_nvim_integrations`, `g:kat_nvim_filetype`, and `g:kat_nvim_stupidFeatures`.
The following is a table explaining how these variables work, and what values they can take.

| Variable | Function | Options | Default |
|---|---|---|---|
| `g:kat_nvim_commentStyle` | affects how comments are styled | any valid `gui` string |  `'italic'` |
| `g:kat_nvim_integrations`| what plugins colors are loaded | a list of strings, see below for current integrations | all are enabled |
| `g:kat_nvim_filetype` | what filetype colors are loaded | a list of strings, see below for current filetypes | all are enabled |
| `g:kat_nvim_stupidFeatures` | features that work but probably shouldn't be used | boolean | `v:false` |

# Integrations
| Plugin | Option Name |
| --- | --- |
| [Native LSP](https://github.com/neovim/nvim-lspconfig) | 'lsp' |
| [tree-sitter](https://github.com/nvim-treesitter/nvim-treesitter) | 'treesitter' |
| [Startify](https://github.com/mhinz/vim-startify) | 'startify' |
| [TS Rainbow](https://github.com/p00f/nvim-ts-rainbow) | 'ts_rainbow' |
| [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) | 'indent_blankline' |
| [coc.nvim](https://github.com/neoclide/coc.nvim) | 'coc' |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | 'cmp' |
| [bufferline](https://github.com/akinsho/bufferline.nvim) | Note: not enabled by default 'bufferline' |
| [lightline](https://github.com/itchyny/lightline.vim) | Use plugin settings: 'kat' |
| [Airline](https://github.com/vim-airline/vim-airline) | Use plugin settings: 'kat' |
| [Lualine](https://github.com/nvim-lualine/lualine.nvim) | Use plugin settings: 'kat' |
| [Fugitive](https://github.com/tpope/vim-fugitive) | 'fugitive' |

# Filetypes
|Filetypes| Option Name |
|---| --- |
|Vimscript| 'vim' |
|Markdown| 'markdown' |
|Vimwiki| 'vimwiki' |

# Stupid Features
Due to the magic speed of Lua, in addition to the wonderful NeoVim API, I was given the ability to add in features unheard of for VimL based colorschemes.
Currently the only feature is color fading for the `Function` highlight group. See the following image for an example. More features will be added in the future as I think of them.

![image](https://raw.githubusercontent.com/katawful/RandomAssets/main/flashy.GIF)

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
```

For colors that use one of the `katdotnvim.utils.color` functions, you must define a variable to return. Otherwise the function will be passed to internal functions, breaking the colorscheme:
```clojure
(defn newColorVariable []
  (def output (katdotnvim.utils.color.function ...))
	output)
(defn newColorVariable []
  (def output (plainColorFunction))
	output)
```

## Compiling
You need a local build of [fennel](https://github.com/bakpakin/Fennel/blob/main/setup.md#downloading-fennel) in the root directory of this repo.
This is to compile the fennel files in `colors/`.
These files are what Vim will use to let us change the colorscheme between it's various types.
Thus running make will fail if you try to compile this repo without the local fennel script.

## File Structure
Pretty self explanatory, plugin integrations go in `katdotnvim/highlights/integrations`, filetype additions in the other folder.

## Adding Options
Make sure you add the necessary option to the default function in `katdotnvim/utils/error.fnl`.

# License
While most of this project is my code, some of it is copyright from others

* `lua/externals/hsluv.lua`
* Aniseed

hsluv is provided as free to use, being able to be integrated into this project provided it's copyright statement is kept in place. For convenience it is placed below as well:
```
Lua implementation of HSLuv and HPLuv color spaces
Homepage: http://www.hsluv.org/
Copyright (C) 2019 Alexei Boronine
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
associated documentation files (the "Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial
portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
Aniseed is provided into the public domain, and free to use for integration under the [unlicense](https://unlicense.org/) license. [See](https://github.com/Olical/aniseed) the full project for full licensing details.

The rest of the code is published under the GPL v3 license, see LICENSE.txt for details
