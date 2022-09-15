# End of Life
Update to tag '1.0a'

![image](https://raw.githubusercontent.com/katawful/RandomAssets/main/colors-new-2022.png)

# kat.nvim
A NeoVim theme with warm blue tones written in Fennel with Aniseed.
Lua files are embedded, no external dependencies are required.

This theme is dynamic with only a few predefined colors.
Almost everything is generated dynamically.
Syntax is built off of groups, all statements inherent the colors of its parent color.

# Installation:
Install with your plugin manager of choice.
Example for vim-plug:
```vim
" kat.nvim
Plug 'katawful/kat.nvim', { 'tag': '1.0' }
```

Current release: `1.0` - 'Rotund Donskoy'

It is recommended to stick with the current tagged release.
`main` branch is mostly tested, but this is generally the latest release and breakages can occur outside of your tag.
`dev` branch is untested and not for end use.
Usage is and will always be considered broken.

# Example:
![gui-color](https://raw.githubusercontent.com/katawful/RandomAssets/main/gui-2022-example.png)
![16-color](https://raw.githubusercontent.com/katawful/RandomAssets/main/16-color-preview.png)

# Usage
There are only 2 colorscheme provided: `kat.nvim` and `kat.nwim`.
The former is a harder contrast, the latter is a softer contrast (the name being shortened from kat.nvim-owo).
To set between dark and light schemes, the `:set background` method is used.
Simply set the contrast to whichever you prefer, and set your background in your NeoVim configs.

See the examples above for the differences.

# Rendering
Colors for this colorscheme can be rendered to system-local JSON files for much faster startup time.
These will render to your Neovim `stdpath('data')`.
For example on Linux:

`/home/user/.local/share/nvim/kat/kat.nvim/json`.

To render all of the base colorscheme files, use the user-command `KatNvimRender`.
This will render out all of the colors for both colorschemes and each background, synchronously, to said data path.

## Overrides

```lua
local render = require('katdotnvim.utils.export.render')
local my_overrides = function ()
    render.override_all({
        source = "kat",
        {
            {group = "Normal", fg = "#ffffff", default = true},
            {group = "Visual", fg = "#ff0000", default = true}}})

    local color = function ()
        if vim.o.background == "light" then
            return "#000000"
        else
            return "#ffffff"
        end
    end

    render.override ({
        source = "kat",
        light_hard = {
            {group = "Normal", fg = color(), default = true},
            {group = "Visual", fg = "#ff0000", default = true}}})
    render.override ({
        source = "kat",
        light_soft = {
            {group = "Normal", fg = color(), default = true},
            {group = "Visual", fg = "#ff0000", default = true}}})
    render.override ({
        source = "kat",
        dark_hard = {
            {group = "Normal", fg = color(), default = true},
            {group = "Visual", fg = "#ff0000", default = true}}})
    render.override ({
        source = "kat",
        dark_soft = {
            {group = "Normal", fg = color(), default = true},
            {group = "Visual", fg = "#ff0000", default = true}}})
end
vim.api.nvim_create_user_command("MyOverrides", my_overrides, {})
```

Overrides can be defined, which will be loaded with the same method as system colors.
There are 2 override functions:

- `override`: Define an override for a single variation of kat.nvim
- `override_all`: Define an override for all variations of kat.nvim

`override_all` cannot change values for the group based upon values like `vim.o.background` or kat.nvim's current contrast.
`override` should be used for that instead.

Both functions take a table with 2 keys: both take a `source` key with a string value corresponding to a name of your desire (like computer username).
For `override_all`, the second key is a unnamed table of highlight groups.
For `override`, the second key must be one of the following:

- 'light_hard'
- 'light_soft'
- 'dark_hard'
- 'dark_soft'

It is recommended to define all 4, but it is not required.

kat.nvim will use all rendered files it finds.
However, for example if you only use 'light_hard' in `override`, if you set your background to `dark` or use the colorscheme `kat.nwim`, your overrides will not display.

Neovim version support also works with this feature, though remember to delete and regenerate if you update to a new version with a breaking change.

### Highlight Table
This colorscheme uses a custom highlight table to consolidate everything.
It is mostly based on the opts table for `nvim_set_hl`, but with added keys:

```lua
{
    group = "hl-group-name, a string",
    fg = "gui-fg, any valid color",
    bg = "gui-bg, any valid color",
    ctermfg = "cterm-fg, a number 0-255",
    ctermbg = "cterm-bg, a number 0-255",
    sp = "gui hl for special highlights, any valid color",
    attr = "one of the possible attributes, true",
    default = "only overwrite values found in this table, true. different from the built in default key. 2nd priority",
    link = "hl group to link to, a string. highest priority",
}
```

While it isn't generally needed for overrides (as you have the 'default' key), all 4 color keys can take `"SKIP"` and `"NONE"` as additional values.
"SKIP" simply does not try to overwrite any value found, while "NONE" directly sets the value to empty.

See [attr-list](https://neovim.io/doc/user/syntax.html#attr-list) for the list of attribute keys possible.

```lua
-- Example highlight table
{
    group = "Normal",
    fg = "#000000",
    bg = "#ffffff",
    ctermfg = 7,
    ctermbg = 0,
    bold = true,
    italic = true,
    undercurl = true,
    sp = "#ff0000",
}

-- Just link a group
{
    group = "TSVariable",
    link = "Variable",
    -- the rest are ignored because of 'link' key
    fg = "#ffffff",
    -- ...
}

-- Only update a group
{
    group = "Visual",
    default = true,
    bold = true,
}
```

# 0.6 Deprecation Warning
As of 2022-08-24, Neovim 0.6 support is now considered deprecated.
Any use of 0.6 features will print warnings, and for the first official release will be removed entirely.
This will be achieved with version 2.0 Exuberant Cornish Rex in October 2022.

Please upgrade.

For Ubuntu users, the [Neovim PPA](https://launchpad.net/~neovim-ppa/+archive/ubuntu/stable) is on 0.7.2 as of this commit.
Fedora and Arch are on 0.7.2 as well.
Debian and other distro users that do not have access to 0.7.2 in their package manager will have to find a way to use the current release.

# Terminal Colors Support
The following terminals can have a 16 color config file generated based on the current in use kat.nvim theme:

| Terminal | Setting |
|---|---|
| kitty | "kitty" |
| alacritty | "alacritty" |
| URxvt | "rxvt-unicode", "urxvt" |
| konsole | "konsole" |

Generate the color file like so:
``` vim
:KatGenTermTheme kitty
```
This will generate "kitty-kat.nvim-dark.conf" at the current working directory when kat.nvim with a dark background is used.

# Options

| Variable | Function | Options | Default |
|---|---|---|---|
| `g:kat_nvim_integrations`| What plugins colors are loaded | a list of strings, see below for current integrations | all are enabled |
| `g:kat_nvim_filetype` | What filetype colors are loaded | a list of strings, see below for current filetypes | all are enabled |
| `g:kat_nvim_stupidFeatures` | **Unstable**. Features that work but probably shouldn't be used | boolean | `v:false` |
| `g:kat_nvim_max_version` | A string of the max supported nvim version | e.g. "0.7" | Sets to max version needed for plugin to work |
| `g:kat_nvim_commentStyle` | **Deprecated**. Use an [override](README.md/#overrides) instead | any valid `gui` string |  `'italic'` |
| `g:kat_nvim_dont_render` | **Deprecated**. Remains unused | boolean | `v:false` |
| `g:kat_nvim_compile_enable` | **Deprecated**. Remains unused | boolean | `v:false` |

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
| [gitsigns](https://github.com/lewis6991/gitsigns.nvim/) | 'gitsigns' |

# Filetypes
|Filetypes| Option Name |
|---| --- |
|Vimscript| 'vim' |
|Markdown| 'markdown' |
|Vimwiki| 'vimwiki' |

# Stupid Features
Note that this feature is subject to changes and is considered unstable.
Please don't expect stability with version releases.

Due to the magic speed of Lua, in addition to the wonderful NeoVim API, I was given the ability to add in features unheard of for VimL based colorschemes.
Currently the only feature is color fading for the `Function` highlight group. See the following image for an example. More features will be added in the future as I think of them.

![image](https://raw.githubusercontent.com/katawful/RandomAssets/main/flashy.GIF)

# Using in Other Plugins
To make integration with other plugins easier, the majority of colors used in this plugin are exported in `katdotnvim.color` in the table named `kat`:
```lua
local kat_colors = require('katdotnvim.color').kat
```
There are 10 tables contained in `kat`:

- pink
- red
- blue
- green
- purple
- orange
- teal
- plum
- fg
- bg

'fg' and 'bg' are the foreground and background colors.
They are generally not mixed with other colors, but rather come from earlier definitions.
The other color tables contain the various mixings used throughout this colorscheme.

Within each color table contains a table of the colors themselves, each with 2 keys:

- 'desc`
- 'color'

'desc' contains a description of the color, while 'color' is the color itself.

The following is a snippet to only get the descriptions of a color table:
```lua
vim.api.nvim_create_user_command("KatColor",
    function(args)
        local output = {}
        for _, color in pairs(args.fargs) do
            local col_table = require("katdotnvim.color").kat[color]
            if col_table then
                output[color] = {}
                for key, value in pairs(col_table) do
                    output[color][key] = value.desc
                end
            end
        end
        table.sort(output)
        print(vim.inspect(output))
    end, {nargs = "+"})
```
Simply input the colors you want from above and it will print the colors to `:messages`.

## Example
```lua
local pink = require("katdotnvim.color").kat.pink

vim.api.nvim_set_hl(0, "Normal", {guifg = pink.base.color})
```
Colors are very simple to use. You can either import just `kat` to get all the colors you need at once, or the sub tables like `kat.pink`. It is entirely up to you.

# Changelog
Versioning: `x.ya adjective cat-breed`

`x` releases are breaking changes. Something is expect to not work when updating.
`y` are feature updates. New features are added, but compatibility with existing usage is kept.
Pure bug fixes that affect functionality add a letter to the end of the tag, starting at 'a'.

Changes to `x` demands a new adjective and cat-breed for the version name, a change to `y` only changes the adjective.

Examples

- 1.0 Large Sphinx
- 1.0a Large Sphinx
- 1.1 Fluffy Sphinx
- 2.0 Observant Tabby

##### 1.0 Rotund Donskoy

- First major release
- Supports Neovim 0.6.1 through 0.8
- Adds JSON color rendering
- Adds easy override support
- Terminal color exporting

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

## fnlfmt
`make format` will format all files with `fnlfmt`. It assumes that is in your $PATH.

## File Structure
Pretty self explanatory, plugin integrations go in `katdotnvim/highlights/integrations`, filetype additions in the other folder.

## Adding Options
Make sure you add the necessary option to the default function in `katdotnvim/utils/error.fnl`.

# License
The following are directories from different, but compatible, licenses

* `lua/externals/hsluv.lua`
* Aniseed - distributed in `lua/katdotnvim/aniseed/`

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

Macros shipped in `lua/katdotnvim/katcros-fnl` is provided under the GPL v3 license. [See](https://github.com/katawful/katcros-fnl).

The rest of the code is published under the GPL v3 license, see LICENSE.txt for details
