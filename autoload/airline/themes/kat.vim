let g:airline#themes#kat#palette = {}
"noremap <buffer> <leader>s :source %<CR>
function! airline#themes#kat#refresh()

	" lua require('katdotnvim.highlights.integrations.airline').init()
	let g:airline#themes#kat#palette = {}
  let M0 = airline#themes#get_highlight('Identifier')
  let accents_group = airline#themes#get_highlight('Special')
  let modified_group = [M0[1], '', M0[2], '', '']
  let modified_group_norm = luaeval('require("katdotnvim.highlights.integrations.airline").modifiedC("normal")')
  let modified_group_inactive = luaeval('require("katdotnvim.highlights.integrations.airline").modifiedC("inactive")')
  let warning_group = luaeval('require("katdotnvim.highlights.integrations.airline").warningGroup()')
  let error_group = luaeval('require("katdotnvim.highlights.integrations.airline").errorGroup()')

  let s:N1 = luaeval('require("katdotnvim.highlights.integrations.airline").normalMode_a()')
  let s:N2 = luaeval('require("katdotnvim.highlights.integrations.airline").normalMode_b()')
  let s:N3 = luaeval('require("katdotnvim.highlights.integrations.airline").normalMode_c()')

  let g:airline#themes#kat#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
  let g:airline#themes#kat#palette.normal_modified = { 'airline_c': modified_group_norm }
  let g:airline#themes#kat#palette.normal.airline_warning = warning_group
  let g:airline#themes#kat#palette.normal_modified.airline_warning = warning_group
  let g:airline#themes#kat#palette.normal.airline_error = error_group
  let g:airline#themes#kat#palette.normal_modified.airline_error = error_group

  let s:I1 = luaeval('require("katdotnvim.highlights.integrations.airline").insertMode_a()')
  let s:I2 = luaeval('require("katdotnvim.highlights.integrations.airline").insertMode_b()')
  let s:I3 = luaeval('require("katdotnvim.highlights.integrations.airline").insertMode_c()')
  let g:airline#themes#kat#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
  let g:airline#themes#kat#palette.insert_modified = g:airline#themes#kat#palette.normal_modified
  let g:airline#themes#kat#palette.insert.airline_warning = g:airline#themes#kat#palette.normal.airline_warning
  let g:airline#themes#kat#palette.insert_modified.airline_warning = g:airline#themes#kat#palette.normal_modified.airline_warning
  let g:airline#themes#kat#palette.insert.airline_error = g:airline#themes#kat#palette.normal.airline_error
  let g:airline#themes#kat#palette.insert_modified.airline_error = g:airline#themes#kat#palette.normal_modified.airline_error

  let s:R1 = luaeval('require("katdotnvim.highlights.integrations.airline").replaceMode_a()')
  let s:R2 = luaeval('require("katdotnvim.highlights.integrations.airline").replaceMode_b()')
  let s:R3 = luaeval('require("katdotnvim.highlights.integrations.airline").replaceMode_c()')
  let g:airline#themes#kat#palette.replace = airline#themes#generate_color_map(s:R1, s:R2, s:R3)
  let g:airline#themes#kat#palette.replace_modified = g:airline#themes#kat#palette.normal_modified
  let g:airline#themes#kat#palette.replace.airline_warning = g:airline#themes#kat#palette.normal.airline_warning
  let g:airline#themes#kat#palette.replace_modified.airline_warning = g:airline#themes#kat#palette.normal_modified.airline_warning
  let g:airline#themes#kat#palette.replace.airline_error = g:airline#themes#kat#palette.normal.airline_error
  let g:airline#themes#kat#palette.replace_modified.airline_error = g:airline#themes#kat#palette.normal_modified.airline_error

  let s:V1 = luaeval('require("katdotnvim.highlights.integrations.airline").visualMode_a()')
  let s:V2 = luaeval('require("katdotnvim.highlights.integrations.airline").visualMode_b()')
  let s:V3 = luaeval('require("katdotnvim.highlights.integrations.airline").visualMode_c()')
  let g:airline#themes#kat#palette.visual = airline#themes#generate_color_map(s:V1, s:V2, s:V3)
  let g:airline#themes#kat#palette.visual_modified = { 'airline_c': [ s:V3[0], '', s:V3[2], '', '' ] }
  let g:airline#themes#kat#palette.visual.airline_warning = g:airline#themes#kat#palette.normal.airline_warning
  let g:airline#themes#kat#palette.visual_modified.airline_warning = g:airline#themes#kat#palette.normal_modified.airline_warning
  let g:airline#themes#kat#palette.visual.airline_error = g:airline#themes#kat#palette.normal.airline_error
  let g:airline#themes#kat#palette.visual_modified.airline_error = g:airline#themes#kat#palette.normal_modified.airline_error

  let s:IA = luaeval('require("katdotnvim.highlights.integrations.airline").inactiveGroup()')
  let g:airline#themes#kat#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
  let g:airline#themes#kat#palette.inactive_modified = { 'airline_c': modified_group_inactive }

  let g:airline#themes#kat#palette.accents = { 'red': accents_group }

  let s:T1 = luaeval('require("katdotnvim.highlights.integrations.airline").terminalMode_a()')
  let s:T2 = luaeval('require("katdotnvim.highlights.integrations.airline").terminalMode_b()')
  let s:T3 = luaeval('require("katdotnvim.highlights.integrations.airline").terminalMode_c()')
	let g:airline#themes#kat#palette.terminal = airline#themes#generate_color_map(s:T1, s:T2, s:T3)
	let g:airline#themes#kat#palette.normal.airline_term = s:N1
	let g:airline#themes#kat#palette.terminal.airline_term = s:T1
	let g:airline#themes#kat#palette.visual.airline_term = s:V1

  let g:airline#themes#kat#palette.tabline = {
    \ 'airline_tab':  s:N1,
    \ 'airline_tabsel':  s:I1,
    \ 'airline_tabtype':  s:N1,
    \ 'airline_tabfill':  s:N3,
    \ 'airline_tabhid':  s:I3,
    \ 'airline_tabmod':  s:I1
    \ }

endfunction

call airline#themes#kat#refresh()
