" Terminal and debugger options {{{
tnoremap <Esc> <C-\><C-n>
tnoremap <expr> <C-R><C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
" Terminal and debugger options }}}

" TODO: Move it from here.{{{
" call deoplete#custom#option('sources', {
" \ '_': ['ale'],
" \})
let g:ale_fixers = {
            \    'c': ['clang-format', 'clangtidy', 'uncrustify'],
            \    'python': ['add_blank_lines_for_python_control_statements', 'autopep8', 'black' ,'isort' ,'reorder-python-imports', 'yapf'],
            \    '*': ['remove_trailing_lines', 'trim_whitespace']
            \  }

" let g:ale_open_list = 1
let g:ale_c_clangformat_options = '--style=file'
" TODO: Move it from here.}}}

" Unused providers {{{
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
" Unused providers }}}

" Unwanted key mappings {{{
" We use inkarkat/vim-ReplaceWithRegister and prefer to use the `gr<inside>`
" motion.
nunmap gri
" Unwanted key mappings }}}
