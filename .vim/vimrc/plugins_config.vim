
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

" Solarized Colorscheme config {{{
let g:solarized_termcolors=256
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
"        noremap <C-d> <Nop>
"        let g:multi_cursor_use_default_mapping = 0
"        let g:multi_cursor_start_key           = '<C-d>'
"        let g:multi_cursor_start_word_key      = '<C-d>'
"        let g:multi_cursor_next_key            = '<C-n>'
"        let g:multi_cursor_prev_key            = '<C-p>'
"        let g:multi_cursor_skip_key            = '<C-x>'
"        let g:multi_cursor_quit_key            = '`'
"        
"        " Cscope vim config
"        nnoremap <leader>bc :!cscope -b *.c *.h */*.c */*.h */*/*.c */*/*.h /usr/include/*.h /usr/include/*/*.h /usr/include/*/*/*.h /usr/include/*/*/*/*.h /usr/include/*/*/*/*/*.h /usr/include/*/*/*/*/*.h<CR>
"        nnoremap <leader>hn :call CscopeFindInteractive(expand('<cword>'))<CR>
"        nnoremap <leader>l :call ToggleLocationList()<CR>
"        " s: Find this C symbol
"        nnoremap  <leader>ns :vsplit<CR>:call CscopeFind('s', expand('<cword>'))<CR>
"        " g: Find this definition
"        nnoremap  <leader>ng :vsplit<CR>:call CscopeFind('g', expand('<cword>'))<CR>
"        " d: Find functions called by this function
"        nnoremap  <leader>nd :vsplit<CR>:call CscopeFind('d', expand('<cword>'))<CR>
"        " c: Find functions calling this function
"        nnoremap  <leader>nc :vsplit<CR>:call CscopeFind('c', expand('<cword>'))<CR>
"        " t: Find this text string
"        nnoremap  <leader>nt :vsplit<CR>:call CscopeFind('t', expand('<cword>'))<CR>
"        " e: Find this egrep pattern
"        nnoremap  <leader>ne :vsplit<CR>:call CscopeFind('e', expand('<cword>'))<CR>
"        " f: Find this file
"        nnoremap  <leader>nf :vsplit<CR>:call CscopeFind('f', expand('<cword>'))<CR>
"        " i: Find files #including this file
"        nnoremap  <leader>ni :vsplit<CR>:call CscopeFind('i', expand('<cword>'))<CR>
"        let g:cscope_silent = 1
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
