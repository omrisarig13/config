" This is a script file that would add some more mapping to the operation mode,
" to enable more complicated features of it.
"
" The current main feature that this file would add is to run a command on the
" next and last value of some kind. Those commands would be like text objects
" commands, but they would change the given next/last text object, not the one 
" you are currently on.
"
" Those features would be useful mainly to avoid going to the wanted text object
" before changing it, you could do it directly from the place you are in the
" file.
"
" As well as regular text objects, this script would add some more next/last
" operators for some common types in common files format.

" Change In the next commands for all the important text objects. {{{
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in) :<c-u>normal! f(vi(<cr>

onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in} :<c-u>normal! f{vi{<cr>

onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap in] :<c-u>normal! f[vi[<cr>

onoremap in< :<c-u>normal! f<vi<<cr>
onoremap in> :<c-u>normal! f<vi<<cr>

onoremap in" :<c-u>normal! f"vi"<cr>

onoremap in' :<c-u>normal! f'vi'<cr>
" }}}

" Change In the last commands for all the important text objects. {{{
onoremap il( :<c-u>normal! F)vi)<cr>
onoremap il) :<c-u>normal! F)vi)<cr>

onoremap il{ :<c-u>normal! F}vi}<cr>
onoremap il} :<c-u>normal! F}vi}<cr>

onoremap il[ :<c-u>normal! F]vi]<cr>
onoremap il] :<c-u>normal! F]vi]<cr>

onoremap il< :<c-u>normal! F>vi><cr>
onoremap il> :<c-u>normal! F>vi><cr>

onoremap il" :<c-u>normal! F"vi"<cr>

onoremap il' :<c-u>normal! F'vi'<cr>
" }}}

" Change Around the next commands for all the important text objects. {{{
onoremap an( :<c-u>normal! f(va(<cr>
onoremap an) :<c-u>normal! f(va(<cr>

onoremap an{ :<c-u>normal! f{va{<cr>
onoremap an} :<c-u>normal! f{va{<cr>

onoremap an[ :<c-u>normal! f[va[<cr>
onoremap an] :<c-u>normal! f[va[<cr>

onoremap an< :<c-u>normal! f<va<<cr>
onoremap an> :<c-u>normal! f<va<<cr>

onoremap an" :<c-u>normal! f"va"<cr>

onoremap an' :<c-u>normal! f'va'<cr>
" }}}

" Change Around the last commands for all the important text objects. {{{
onoremap al( :<c-u>normal! F)va)<cr>
onoremap al) :<c-u>normal! F)va)<cr>

onoremap al{ :<c-u>normal! F}va}<cr>
onoremap al} :<c-u>normal! F}va}<cr>

onoremap al[ :<c-u>normal! F]va]<cr>
onoremap al] :<c-u>normal! F]va]<cr>

onoremap al< :<c-u>normal! F>va><cr>
onoremap al> :<c-u>normal! F>va><cr>

onoremap al" :<c-u>normal! F"va"<cr>

onoremap al' :<c-u>normal! F'va'<cr>
" }}}

" Change In and Around the last and next email address {{{
onoremap in@ :<c-u>execute "normal! /\\v\\@[a-zA-Z]+\\.\rhvB"<cr>
onoremap il@ :<c-u>execute "normal! ?\\v\\@[a-zA-Z]+\\.\rhvB"<cr>
onoremap an@ :<c-u>execute "normal! /\\v\\@[a-zA-Z]+\\.\rhviW"<cr>
onoremap al@ :<c-u>execute "normal! ?\\v\\@[a-zA-Z]+\\.\rhviW"<cr>
" }}}

" Find headers of Markdown files. {{{
augroup markdown_headers
    autocmd!
    autocmd FileType markdown onoremap <buffer> anh :<c-u>execute "normal! /\\v^[\\=,-][\\=,-]+$\r:nohlsearch\rg_vk0"<cr>
    autocmd FileType markdown onoremap <buffer> aph :<c-u>execute "normal! ?\\v^[\\=,-][\\=,-]+$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}

" TODO: Add some more common functions here (like functions in c/cpp/python
" files, and documentation parts in them.
