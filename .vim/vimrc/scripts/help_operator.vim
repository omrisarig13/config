nnoremap <leader>sh :help <c-r><c-w><cr>
vnoremap <leader>sh :<c-u>call <SID>HelpOperator(visualmode())<cr>

function! s:HelpOperator(type)
	let saved_unnamed_register = @@

	if a:type ==# 'v'
		execute "normal! `<v`>y"
	elseif a:type ==# 'char'
		execute "normal! `[y`]"
	else
		return
	endif

	execute "help " . @@

	let @@ = saved_unnamed_register
endfunction
