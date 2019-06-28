
" NERDTree Config. {{{
nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <leader><F2> :NERDTreeTabsToggle<CR>
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
" noremap <leader>pe :CtrlPCurFile<CR>
" noremap <leader>pro :CtrlPRoot<CR>
" noremap <leader>pd :CtrlPDir<CR>
" noremap <leader>prt :CtrlPRTS<CR>
" noremap <leader>pm :CtrlPMixed<CR>
let g:ctrlp_switch_buffer = 'T'
let g:ctrlp_show_hidden = 1
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_extensions = ['quickfix', 'dir', 'rtscript', 'undo', 'mixed', 'bookmarkdir']
" Set delay to prevent extra search
let g:ctrlp_lazy_update = 350

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
let g:ctrlp_clear_cache_on_exit = 0

" Set no file limit, we are building a big project
let g:ctrlp_max_files = 0

" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g ""'
endif
" }}}

" Colorscheme Config {{{
function! SetSolarized()
    let g:solarized_termcolors=256
    set background=dark
    colorscheme solarized
endfunction
command! ColorSolarized call SetSolarized()
command! ColorTheMeInABox colorscheme themeinabox
command! ColorSpringNight colorscheme spring-night
command! ColorSpaceCamp colorscheme spacecamp_lite
" }}}

" MultipleCursor Config {{{
nnoremap <C-d> <Nop>
let g:multi_cursor_use_default_mapping   = 0
let g:multi_cursor_start_key             = '<C-d>'
let g:multi_cursor_start_word_key        = '<C-d>'
let g:multi_cursor_next_key              = '<C-n>'
let g:multi_cursor_prev_key              = '<C-p>'
let g:multi_cursor_skip_key              = '<C-x>'
let g:multi_cursor_quit_key              = '<esc>'
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

" CCTree Config {{{
let g:CCTreeKeyTraceForwardTree = '-cct>'
let g:CCTreeKeyTraceReverseTree = '-cct<'
let g:CCTreeKeyToggleWindow = '-cctt'
let g:CCTreeKeyHilightTree = '<C-l>'        " Static highlighting
let g:CCTreeKeySaveWindow = '-ccty'
let g:CCTreeKeyCompressTree = 'zs'     " Compress call-tree
let g:CCTreeKeyDepthPlus = '-cct='
let g:CCTreeKeyDepthMinus = '-cct-'
" }}}

" Factorus Config {{{
" Notes to self about the plugin:
"   * Use manly the functions of
"      *  FExtractMethod
"      *  FRenameArg - Works, but does the changes only locally to the function
"                      (If doesn't change the header file, for example).
"   * Check if those functions works as wanted:
"      * FRenameType
"      * FRenameMacro
"      * FRenameField
"   * TODO:
"      * Check how this plugin handles python files.
let g:factorus_ignored_files = ['cscope.out', '.ycm_extra_conf.py', '*.o', '*.a']
let g:factorus_ignored_dirs = ['.git', 'bin', 'build']
let g:factorus_line_length = 80
let g:factorus_add_default = 1
" }}}

" GitGutter Config {{{
augroup GitGutterConfig
    autocmd!
    autocmd BufWritePost * GitGutter
augroup END
" }}}

" Incsearch Config {{{
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
" }}}

" Incsearch-Fuzzy Config {{{
function! s:config_fuzzyall(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzy#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))
" }}}

" Mundo Config {{{
nnoremap <leader>gu :MundoToggle<CR>
let g:mundo_preview_bottom=1
" }}}

" WinResizer Config {{{
" TODO: Add the option to ignore the start key in the plugin at github.
" let g:winresizer_start_key = ''
let g:winresizer_enable_start_key = 0
noremap <leader>wr :WinResizerStartResize<CR>
noremap <leader>wm :WinResizerStartMove<CR>
" }}}

" Pymatcher Config. {{{
if !has('python')
    echo 'In order to use pymatcher plugin, you need +python compiled vim'
else
    let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endif
" }}}

" Grepper Config {{{
nmap <leader>gs  <plug>(GrepperOperator)
xmap <leader>gs  <plug>(GrepperOperator)
nnoremap <leader>gg :Grepper<cr>
let g:grepper = {'side' : 1}
" }}}

" ShowMarks Config {{{
let g:showmarks_enable = 0
let g:showmarks_auto_toggle = ['cursor_hold', 'current_buffer']
" }}}

" Anyfold Config {{{
autocmd Filetype python,text AnyFoldActivate
set foldlevel=0
set foldlevelstart=20
" }}}

" Which-key Config {{{
nnoremap <silent> <leader> :WhichKey '-'<CR>
let g:which_key_map =  {}
call which_key#register('-', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '-'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '-'<CR>

let g:which_key_map.p = {'name' : '+ctrlp'}
let g:which_key_map.f = {'name' : '+easymotion'}
let g:which_key_map.c = {'name' : '+commenter'}
let g:which_key_map.n = {'name' : '+cscope'}
let g:which_key_map.w = {'name' : '+winresizer'}
let g:which_key_map.g = {'name' : '+grepper'}
let g:which_key_map.m = {'name' : '+ShowMarks,Marvim'}
let g:which_key_map.s = {'name' : '+self'}
" }}}

" Marvim Config {{{
let g:marvim_store = '/home/omri/.vim/marvim'
let g:marvim_find_key = '-mf'
let g:marvim_store_key = '-ms'
"}}}

" Prosession Config {{{
let g:prosession_tmux_title = 1
let g:prosession_per_branch = 1
" Create a command to close the current session and close vim together.
command! PQ execute "normal! :ProsessionDelete\<cr>:qa\<cr>"
" }}}

" Plantuml syntax config {{{
let g:plantuml_executable_script = "/home/omri/.vim/scripts/plantuml.sh"
" }}}

" vim-move Config {{{
let g:move_map_keys = 0
vmap <c-j> <Plug>MoveBlockDown
vmap <c-k> <Plug>MoveBlockUp
vmap <c-h> <Plug>MoveBlockLeft
vmap <c-l> <Plug>MoveBlockRight
nmap <c-j> <Plug>MoveLineDown
nmap <c-k> <Plug>MoveLineUp
nmap <c-h> <Plug>MoveCharLeft
nmap <c-l> <Plug>MoveCharRight
" }}}

" vim-markdown Config {{{
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1

augroup MarkdownSyntax
    autocmd!
    autocmd FileType markdown setlocal conceallevel=2
augroup END
" }}}

" Markdown Preview Config {{{
nmap <leader>mps <Plug>MarkdownPreview
nmap <leader>mpe <Plug>MarkdownPreviewStop
" }}}

" Fzf Config {{{
let g:fzf_history_dir = '~/.vim/fzf_history'
let g:fzf_buffers_jump = 1
nnoremap <leader>efb :Files<cr>
nnoremap <leader>efc :execute "Files " . expand("%:p:h")<cr>
nnoremap <leader>efr :execute "Files " . FindRootDirectory()<cr>
nnoremap <leader>egf :GFiles<cr>
nnoremap <leader>egs :GFiles?<cr>
nnoremap <leader>eb :Buffers<cr>
nnoremap <leader>el :Lines<CR>
nnoremap <leader>ebl :BLines<cr>
nnoremap <leader>et :Tags<cr>
nnoremap <leader>ebt :BTags<cr>
nnoremap <leader>em :Marks<cr>
nnoremap <leader>ew :Windowns<cr>
nnoremap <leader>es :Snippets<cr>
nnoremap <leader>ec :Commits<cr>
nnoremap <leader>ebc :BCommits<cr>
nnoremap <leader>eco :Commands<cr>
nnoremap <leader>ema :Maps<cr>
nnoremap <leader>eft :Filetypes<cr>
" }}}

" Fugitive Config {{{
nnoremap <leader>Gs :Gstatus<CR>
nnoremap <leader>Gl :Git log<CR>
nnoremap <leader>Gc :Gcommit<CR>
nnoremap <leader>Gw :Gwrite<CR>
" }}}

" Stay Config {{{
set viewoptions=cursor,folds,slash,unix
" }}}

" Rooter Config {{{
let g:rooter_manual_only = 1
let g:rooter_patterns = ['Makefile', '.git/', '.hg/']
let g:rooter_use_lcd = 1
" }}}

" vim-system-copy Config {{{
" Use nmap and not nnoremap, since we want to actually run the functionality of
" the newly mapped cv.
nmap cvv aa<esc>cvl
" }}}

" Twiggy Config {{{
let g:twiggy_adapt_columns = 1
" }}}

" Yankring Config {{{
let g:yankring_replace_n_pkey = ''
let g:yankring_replace_n_nkey = ''
nnoremap <silent> <leader>yr :YRShow<CR>
" }}}

" Thesaurus Query Config {{{
let g:tq_map_keys=0
nnoremap <Leader>tq :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap <Leader>tq "ky:ThesaurusQueryReplace <C-r>k<CR>
let g:tq_enabled_backends = ["datamuse_com", "mthesaur_txt"]
let g:tq_online_backends_timeout = 0.5
" }}}

" Ferret Config {{{
let g:FerretMap = 0
nmap <leader>rw <Plug>(FerretAckWord)
nmap <leader>rs <Plug>(FerretAcks)
" }}}

" Nuake Config {{{
nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>
" }}}

" Vim calander {{{
let g:calendar_google_calendar = 1
let g:calendar_view = "week"
let g:calendar_google_task = 1
let g:calendar_cyclic_view = 1
" }}}

" TODO: Move on those values when the plugins are added. {{{
"
"        " Syntastic config
"        let g:syntastic_always_populate_loc_list = 1
"        let g:syntastic_auto_loc_list = 1
"        let g:syntastic_check_on_open = 1
"        let g:syntastic_check_on_wq = 0
"        let g:syntastic_c_checkers = ['gcc', 'clang_check', 'clang_tidy', 'cppclean', 'make']
"
"
"
"        " General plugins config
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
" }}}

" vim:nospell
