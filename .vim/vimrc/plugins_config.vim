
" NERDTree Config. {{{
nnoremap <F2> :NERDTreeToggle<CR>
" }}}

" NERDCommenter Config. {{{
" Make comment with space around the delimiters.
let NERDSpaceDelims=1
let NERDTrimTrailingWhitespace=1
let NERDUsePlaceHolders=0
" }}}

" EasyMotion Config. {{{
map <leader>f <Plug>(easymotion-prefix)
nmap <leader>fwf <Plug>(easymotion-overwin-f)
nmap <leader>fwj <Plug>(easymotion-overwin-line)
nmap <leader>fww <Plug>(easymotion-overwin-w)
nmap <leader>f_ <Plug>(easymotion-jumptoanywhere)
nmap <leader>f; <Plug>(easymotion-repeat)
" Set the easymotion keys to be more comfortable to my Dvorak keyboard layout.
let g:EasyMotion_keys="asonetpgyfbxmkc.wj,ruh"
" }}}

" Ctrlp Config. {{{
let g:ctrlp_map = '<c-e>'
noremap <leader>pe :CtrlPCurFile<CR>
noremap <leader>pro :CtrlPRoot<CR>
noremap <leader>pd :CtrlPDir<CR>
noremap <leader>prt :CtrlPRTS<CR>
noremap <leader>pm :CtrlPMixed<CR>
let g:ctrlp_switch_buffer = 'T'
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_extensions = ['quickfix', 'dir', 'rtscript', 'undo', 'mixed', 'bookmarkdir']
" }}}

" Solarized Colorscheme Config {{{
function! SetSolarized()
    let g:solarized_termcolors=256
    set background=dark
    colorscheme solarized
endfunction
command! Solarized call SetSolarized()
" }}}

" MultipleCursor Config {{{
nnoremap <C-d> <Nop>
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_key      = '<C-d>'
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<esc>'
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 0
" }}}

" Cscope Config {{{
" TODO: Change the creation of new databases to be in the root directory of the
" project, and not in the current location. Should be done after adding a plugin
" that would find out the base repository project.
" Options {{{
set cscopeprg=/usr/bin/cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
set cscopeverbose
let g:cscope_silent = 1
" }}}
" Load the cscope in the when openning a c file. {{{
function! InitCscope()
    if has("cscope")
        set csto=0
        set cst
        set nocsverb
        " add any database in current directory
        if filereadable("cscope.out")
            cs add cscope.out
        " else add database pointed to by environment
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
        set csverb
    endif
endfunction
augroup CscopeAuto
    autocmd!
    autocmd Filetype c,cpp,h :call InitCscope()
augroup END
" }}}
" Custom commands {{{
" Create a new cscope database, and add it to the current instance of vim. {{{
function! CreateCscope()
    execute "!cscope -b *.c *.h */*.c */*.h */*/*.c */*/*.h /usr/include/*.h /usr/include/*/*.h /usr/include/*/*/*.h /usr/include/*/*/*/*.h /usr/include/*/*/*/*/*.h /usr/include/*/*/*/*/*.h"
    cscope add cscope.out
endfunction
" }}}
" Create a new cscope query, putting the result in a new tab. {{{
function! QueryInTab(type)
    normal mM
    tabnew %
    normal `M
    call CscopeFind(a:type, expand('<cword>'))
endfunction
" }}}
nnoremap <leader>nb :call CreateCscope()<CR>
nnoremap <leader>nn :call CscopeFindInteractive(expand('<cword>'))<CR>
" s: Find this C symbol {{{
nnoremap  <leader>ns :call CscopeFind('s', expand('<cword>'))<CR>
nnoremap  <leader>nvs :vsplit<CR>:call CscopeFind('s', expand('<cword>'))<CR>
nnoremap  <leader>nss :split<CR>:call CscopeFind('s', expand('<cword>'))<CR>
nnoremap  <leader>nts :call QueryInTab('s')<CR>
" }}}
" g: Find this definition {{{
nnoremap  <leader>ng :call CscopeFind('g', expand('<cword>'))<CR>
nnoremap  <leader>nvg :vsplit<CR>:call CscopeFind('g', expand('<cword>'))<CR>
nnoremap  <leader>nsg :split<CR>:call CscopeFind('g', expand('<cword>'))<CR>
nnoremap  <leader>ntg :call QueryInTab('g')<CR>
" }}}
" d: Find functions called by this function {{{
nnoremap  <leader>nd :call CscopeFind('d', expand('<cword>'))<CR>
nnoremap  <leader>nvd :vsplit<CR>:call CscopeFind('d', expand('<cword>'))<CR>
nnoremap  <leader>nsd :split<CR>:call CscopeFind('d', expand('<cword>'))<CR>
nnoremap  <leader>ntd :call QueryInTab('d')<CR>
" }}}
" c: Find functions calling this function {{{
nnoremap  <leader>nc :call CscopeFind('c', expand('<cword>'))<CR>
nnoremap  <leader>nvc :vsplit<CR>:call CscopeFind('c', expand('<cword>'))<CR>
nnoremap  <leader>nsc :split<CR>:call CscopeFind('c', expand('<cword>'))<CR>
nnoremap  <leader>ntc :call QueryInTab('c')<CR>
" }}}
" t: Find this text string {{{
nnoremap  <leader>nt :call CscopeFind('t', expand('<cword>'))<CR>
nnoremap  <leader>nvt :vsplit<CR>:call CscopeFind('t', expand('<cword>'))<CR>
nnoremap  <leader>nst :split<CR>:call CscopeFind('t', expand('<cword>'))<CR>
nnoremap  <leader>ntt :call QueryInTab('t')<CR>
" }}}
" e: Find this egrep pattern {{{
nnoremap  <leader>ne :call CscopeFind('e', expand('<cword>'))<CR>
nnoremap  <leader>nve :vsplit<CR>:call CscopeFind('e', expand('<cword>'))<CR>
nnoremap  <leader>nse :split<CR>:call CscopeFind('e', expand('<cword>'))<CR>
nnoremap  <leader>nte :call QueryInTab('e')<CR>
" }}}
" f: Find this file {{{
nnoremap  <leader>nf :call CscopeFind('f', expand('<cword>'))<CR>
nnoremap  <leader>nvf :vsplit<CR>:call CscopeFind('f', expand('<cword>'))<CR>
nnoremap  <leader>nsf :split<CR>:call CscopeFind('f', expand('<cword>'))<CR>
nnoremap  <leader>ntf :call QueryInTab('f')<CR>
" }}}
" i: Find files #including this file {{{
nnoremap  <leader>ni :call CscopeFind('i', expand('<cword>'))<CR>
nnoremap  <leader>nvi :vsplit<CR>:call CscopeFind('i', expand('<cword>'))<CR>
nnoremap  <leader>nsi :split<CR>:call CscopeFind('i', expand('<cword>'))<CR>
nnoremap  <leader>nti :call QueryInTab('i')<CR>
" }}}
" }}}
" }}}

" TODO: Move on those values when the plugins are added.
"        
"        " Syntastic config
"        let g:syntastic_always_populate_loc_list = 1
"        let g:syntastic_auto_loc_list = 1
"        let g:syntastic_check_on_open = 1
"        let g:syntastic_check_on_wq = 0
"        let g:syntastic_c_checkers = ['gcc', 'clang_check', 'clang_tidy', 'cppclean', 'make']
"        
"        
"        " Default mapping
"        
"        
"        " Git mapping
"        nnoremap <leader>gs :Gstatus<CR>
"        nnoremap <leader>gl :Git log<CR>
"        nnoremap <leader>gc :Gcommit<CR>
"        nnoremap <leader>gw :Gwrite<CR>
"        
"        " General plugins config
"        noremap <leader>gu :GundoToggle<CR>
"        let g:pymode = 1
"        let g:pymode_run = 1
"        let g:pymode_run_bind = '<leader>r'
"        
"        
"        let g:UltiSnipsExpandTrigger="<c-j>"
"        
"        let g:airline_theme='molokai'
"        let g:ycm_server_python_interpreter='/usr/bin/python3'
"        
"        " you complete me (ycm) more config
"        noremap <leader>fix :YcmCompleter FixIt<CR>
"        noremap <leader>nf :YcmDiags<CR> <CR><leader>fix
"        noremap <leader>af :g/^.*$/YcmCompleter FixIt<CR><leader>/
"        "let g:ycm_extra_conf_globlist = ['~/Projects/*']
"        autocmd BufWritePost * GitGutter
"        
"        function! s:config_fuzzyall(...) abort
"          return extend(copy({
"          \   'converters': [
"          \     incsearch#config#fuzzy#converter(),
"          \     incsearch#config#fuzzyspell#converter()
"          \   ],
"          \ }), get(a:, 1, {}))
"        endfunction
"        
"        noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
"        noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
"        noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))
"        
"        hi CurrentWord ctermbg=53
"        hi CurrentWordTwins ctermbg=245
"        
"        " If you want to start window resize mode by `Ctrl+T`
"        let g:winresizer_start_key = '<C-q>'
"        noremap <leader>rw :WinResizerStartResize<CR>
"        
"        nnoremap <leader>as  :Grepper -tool ag -side -query ""
"        nnoremap <leader>ar  :Grepper -tool ag -query ""
"        nnoremap <leader>my :DoShowMarks!<CR>
"        nnoremap <leader>mn :NoShowMarks!<CR>
"        
"        autocmd Filetype * AnyFoldActivate
"        set foldlevel=0
"        
"        nnoremap <silent> <leader> :WhichKey '<leader>'<CR>
"        
"        " Marvim support
"        let marvim_store = '/home/omri/.vim/marvim'
"        let marvim_find_key = '<F4>'
"        let marvim_store_key = '<F5>'
"        
