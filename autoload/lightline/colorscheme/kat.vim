" define color dictionary {{{
let s:kat = {}

  let s:kat.fg = ['#daf6ff',
        \'#b5d5df',
        \'#8dbcca',
        \'#699faf',
        \'#4f7e8c',
        \'#325049'
        \]

  let s:kat.bg = ['#121c2d',
        \'#1c2e4a',
        \'#2c466e',
        \'#46689c',
        \'#6690d0',
        \'#78adff',
        \]

  " order: normal, contrast, dull
  let s:kat.red = ['#eb4949', '#ff5a5a', '#9c3636']
  let s:kat.green = ['#8ceba9', '#9dffd2', '#60b77a']
  let s:kat.orange = ['#f2b15c', '#ffe861', '#ce8b33']
  let s:kat.pink = ['#f29cb1', '#ffaed5', '#a73953']
  let s:kat.purple = ['#c8a5f1', '#f9b5ff', '#7a53a8']
  let s:kat.blue = ['#7bb7c9', '#8af9ff', '#388ba4']


let g:lightline = {
      \ 'colorscheme': 'kat'
      \ }
  let s:N1 = luaeval('require("katdotnvim.highlights.integrations.lightline").normalMode_a()')
  let s:N2 = luaeval('require("katdotnvim.highlights.integrations.lightline").normalMode_b()')
  let s:N3 = luaeval('require("katdotnvim.highlights.integrations.lightline").normalMode_c()')
  let s:I1 = luaeval('require("katdotnvim.highlights.integrations.lightline").insertMode_a()')
  let s:I2 = luaeval('require("katdotnvim.highlights.integrations.lightline").insertMode_b()')
  let s:I3 = luaeval('require("katdotnvim.highlights.integrations.lightline").insertMode_c()')
  let s:R1 = luaeval('require("katdotnvim.highlights.integrations.lightline").replaceMode_a()')
  let s:R2 = luaeval('require("katdotnvim.highlights.integrations.lightline").replaceMode_b()')
  let s:R3 = luaeval('require("katdotnvim.highlights.integrations.lightline").replaceMode_c()')
  let s:V1 = luaeval('require("katdotnvim.highlights.integrations.lightline").visualMode_a()')
  let s:V2 = luaeval('require("katdotnvim.highlights.integrations.lightline").visualMode_b()')
  let s:V3 = luaeval('require("katdotnvim.highlights.integrations.lightline").visualMode_c()')
  let s:IA = luaeval('require("katdotnvim.highlights.integrations.lightline").inactiveGroup()')
  let s:T1 = luaeval('require("katdotnvim.highlights.integrations.lightline").terminalMode_a()')
  let s:T2 = luaeval('require("katdotnvim.highlights.integrations.lightline").terminalMode_b()')
  let s:T3 = luaeval('require("katdotnvim.highlights.integrations.lightline").terminalMode_c()')

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

" Color options {{{
" Normal: {{{
let s:p.normal.left = [ s:N1, s:N2 ]
let s:p.normal.middle = [ s:N3 ]
let s:p.normal.right = [ s:N1, s:N2 ]
" }}}
" Inactive: {{{
let s:p.inactive.left = [ s:IA, s:IA ]
let s:p.inactive.middle = [ s:IA ]
let s:p.inactive.right = [ s:IA, s:IA ]
" }}}
" Insert: {{{
let s:p.insert.left = [ s:I1, s:I2 ]
let s:p.insert.middle = [ s:I3 ]
let s:p.insert.right = [ s:I1, s:I2 ]
" }}}
" Replace: {{{
let s:p.replace.left = [ s:R1, s:R2 ]
let s:p.replace.middle = [ s:R3 ]
let s:p.replace.right = [ s:R1, s:R2 ]
" }}}
" Visual: {{{
let s:p.visual.left = [ s:V1, s:V2 ]
let s:p.visual.middle = [ s:V3 ]
let s:p.visual.right = [ s:V1, s:V2 ]
" }}}
" Tabline: {{{
let s:p.tabline.left = [ s:N1, s:V2 ]
let s:p.tabline.middle = [ s:V3 ]
let s:p.tabline.right = [ s:V1, s:V2 ]
let s:p.tabline.tab_sel = [ s:I1 ]
" }}}
" }}}

let g:lightline#colorscheme#kat#palette = s:p

