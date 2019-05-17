" Toggle the foldcolumn option {{{
nnoremap <leader>f :call <SID>FoldColumnToggle()<cr>

function! s:FoldColumnToggle()
	if &foldcolumn
		setlocal foldcolumn=0
	else
		setlocal foldcolumn=4
	endif
endfunction
" }}}

" Toggle the Quickfix window {{{
nnoremap <leader>q :call <SID>QuickFixToggle()<cr>

let g:quickfix_is_open = 0
let g:quickfix_last_window = 0

function! s:QuickFixToggle()
	if g:quickfix_is_open
		cclose
		let g:quickfix_is_open = 0
		execute g:quickfix_last_window . "wincmd w"
	else
		let g:quickfix_last_window = winnr()
		copen
		let g:quickfix_is_open = 1
	endif
endfunction

" }}}
