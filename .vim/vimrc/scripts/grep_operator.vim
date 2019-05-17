nnoremap <leader>sg :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>sg :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
	let saved_unnamed_register = @@

	if a:type ==# 'v'
		execute "normal! `<v`>y"
	elseif a:type ==# 'char'
		execute "normal! `[y`]"
	else
		return
	endif

	silent execute "grep! -R " . shellescape(@@) . " ."
	copen
	redraw!

	let @@ = saved_unnamed_register
endfunction
