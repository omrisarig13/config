" This is the general config file. In this file, I would save all the general
" configuration of vim (like setting of global flags). Any small configuration
" might be here as well, but big vimscript code would be in their own scripts.


" TODO {{{
" Fix the grep script to ignore unimportant files (and have a version which
"  would not ignore those files).
" Add visual search for the visually selected text (just validate that the
"  * plugin works as needed).
" Add better Windo action from here: https://vi.stackexchange.com/questions/4827/what-is-a-better-way-to-use-windo-without-changing-of-window
" Decide what to do with the statusline after adding the airline (?) plugin.
" Add an automatic script for adding abbreviations
" }}}

" General {{{
set nocompatible " Allow vim to behave differently from Vi, to use more features of it
set hidden " Allow hidden buffers
set ttyfast " Tell vim that the terminal is fast.
set laststatus=2 "Always show the status bar.
set showmode " Show the mode of Vim
set showcmd  " Show the commands that is being run.
set nowrap " don't wrap lines
set undofile " Maintain undo history between sessions
set lazyredraw " Don't redraw the screen when it is not needed.
set timeoutlen=500 " Set the timeout to be half a second.
filetype plugin indent on " Make vim understand the different file types.
syntax on " Make vim understand the different syntax for the different file types
let g:load_doxygen_syntax=1
set wildignore+=*/.git/*,*/.hg/* " Ignore hg and git directory when working on files.
set updatetime=100 " Set the update time to be very fast, instead of vim's 4 second default.
set number " Set the line numbers to show.
set relativenumber " Set the lines number to be relative as well.
" }}}

" Set the splitting of new files to be below and right to the current file. {{{
set splitright
set nosplitbelow
" }}}

" Stop vim from giving annoying messages (with beeping or blinking) {{{
set vb t_vb=
" }}}

" Encoding {{{
set encoding=utf-8
" }}}

" Text Width {{{
set textwidth=80
augroup TextWidth
    autocmd!
    autocmd FileType python,c,markdown,uml,cpp setlocal textwidth=80
    autocmd FileType txt,csv setlocal textwidth=0
    autocmd BufReadPre *.csv setlocal textwidth=0
augroup END
set colorcolumn=-0
" }}}

" Set the format options {{{
set formatoptions=
set formatoptions+=t " Auto wrap text by text width value
set formatoptions+=c " Auto wrap comments.
set formatoptions+=o " When creating a new line, add a comment leader when appropriate.
set formatoptions+=q " Allow formatting of comments with gq
set formatoptions+=r " Auto add comment leader after pressing Enter.
set formatoptions+=n " Recognize numbered lists when formatting text.
set formatoptions+=1 " Don't break a line after one character word.
set formatoptions+=j " When joining lines, remove the comment leader when it makes sense.
set formatoptions+=p " Don't break lines at single spaces that follow periods.
" }}}

" Tab options {{{
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set shiftround
set list
set listchars=

" When the tabs are in a code file, make them visible (to distinguish between
" them and spaces).
augroup CodeVisibleTab
    autocmd!
    autocmd FileType c,cpp,h,python,vim setlocal listchars=tab:>-
augroup END
" }}}

" Cursor motion {{{
set scrolloff=2
" Allow backspace to run over indents, line breaks and insert start.
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs of <>
" }}}

" Searching {{{
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
" }}}

" Allow terminal full 256 colors, and set the background to be dark. {{{
set t_Co=256
set background=dark
" }}}

" English spell checks {{{
set spell
set spelllang=en_us

augroup SyntaxSpell
    autocmd!
    autocmd FileType * syntax spell toplevel
    autocmd FileType c,cpp set spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/c.utf-8.add
    autocmd FileType markdown set spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/md.utf-8.add
    autocmd FileType python set spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/py.utf-8.add
    autocmd FileType plantuml set spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/puml.utf-8.add
    autocmd FileType vim,help set spellfile=~/.vim/spell/en.utf-8.add,~/.vim/spell/vim.utf-8.add
augroup END
" }}}

" Set vim to save the undo files and the swap files in a dedicated place. {{{
set undodir=~/.vim/undodir
set dir=~/.vim/swapdir
" }}}

" Open files more easily. {{{
nnoremap <C-w>fv :vertical wincmd f<CR>
nnoremap <C-w>ft :execute "tabnew " . expand("<cfile>")<CR>
" }}}

" basic compile and run for some file types {{{
augroup CCompile
    autocmd!
    autocmd FileType c,cpp,h command! -buffer Make make "%:t:r"
    autocmd FileType c,cpp,h command! -buffer Run !"./%:t:r"
    autocmd FileType c,cpp,h command! -buffer Clean !rm "%:t:r"
augroup END
augroup PythonCompile
    autocmd!
    autocmd FileType python command! -buffer Make
    autocmd FileType python command! -buffer Run !python ./%:t:r
    autocmd FileType python command! -buffer Clean
augroup END
augroup UmlCompile
    autocmd!
    autocmd BufReadPre *.uml command! -buffer Make !/usr/bin/java -jar /home/omri/.vim/bundle/vim-slumlord/plantuml.jar -tsvg %
    autocmd BufReadPre *.uml command! -buffer Run !viewnior %:t:r.svg &
    autocmd BufReadPre *.uml command! -buffer Clean
augroup END

" Add mapping for making and runnig.
nnoremap gc :make<cr>
nnoremap gC :Make<cr>
nnoremap <leader>sr :Run<cr>
" }}}

" Set the color scheme to be a random from given range of colors. {{{
function! RandomColorScheme()
  let mycolors = split(globpath("~/.vim/colors","*"),"\n")
  execute 'source ' . mycolors[localtime() % len(mycolors)]
  unlet mycolors
endfunction

function! RemoveColor()
    " Remove the current color from the list of colors.
    silent execute "!rm ~/.vim/colors/" . g:colors_name . ".vim"

    " Get a new color.
    call RandomColorScheme()
endfunction

call RandomColorScheme()

command! RemoveColor call RemoveColor()
command! NewColor call RandomColorScheme()
" }}}

" Make aa capture the full content of the current file. {{{
onoremap <silent> aa :<C-U>normal! ggvG<CR>
vnoremap <silent> aa :<C-U>normal! ggvG<CR>
" }}}

" Add debugging for c and cpp programs. {{{
augroup CDebug
    autocmd!
    autocmd FileType c,cpp,h packadd termdebug
augroup END
" }}}

" Create and move between tabs. {{{
noremap <C-t> :tabnew<CR>
noremap <C-n> :tabn<CR>
noremap <C-p> :tabp<CR>
" }}}

" Make the command c-p and c-n act better. {{{
cnoremap <c-p> <Up>
cnoremap <c-n> <Down>
" }}}

" Add the man plugin, and change the action of K to use it by default. {{{
runtime! ftplugin/man.vim
nnoremap K :execute "Man " . expand("<cword>")<cr>
" }}}

" Set the commands mode completion to be ideal. {{{
set wildmode=longest,list,full
set wildmenu
" }}}

" Add Capital letters commands for saving and exiting. {{{
command! W :windo w
command! Q :windo q
command! WQ :windo wq
command! Wq :wq
" }}}

" Map the escape in insert mode, to avoid moving the fingers. {{{
inoremap hh <Esc>
inoremap hhh h<Esc>
inoremap jk <Esc>
" }}}

" Open and edit the different vimrc files. {{{
nnoremap <leader>ssv :source $MYVIMRC<cr>
nnoremap <leader>serv :tabnew $MYVIMRC<cr>
nnoremap <leader>sepv :tabnew $HOME/.vim/vimrc/personal.vim<cr>
nnoremap <leader>seav :tabnew $HOME/.vim/vimrc/abbrev.vim<cr>
nnoremap <leader>sesv :tabnew $HOME/.vim/vimrc/scripts_config.vim<cr>
nnoremap <leader>selv :tabnew $HOME/.vim/vimrc/plugins_config.vim<cr>
nnoremap <leader>sevv :tabnew $HOME/.vim/vimrc/vundle_config.vim<cr>

" Source the current file (mainly for development tests and changes).
nnoremap <leader>ssc :source %<cr>
" }}}

" Create a new line above and below the cursor position. {{{
noremap <leader>sj o<Esc>k
noremap <leader>sk O<Esc>j
" }}}

" Skeletons for new files creation. {{{
" TODO: Try to change it and use the actual skeleton mechanism instead.
function! CheckHFile()
    let filename = expand("%:t:r")
    if (getline("1") !~ '#ifndef _'.filename)
        execute "normal! ggO#IFNDEF __" . filename . "__"
        execute "normal! o#DEFINE __" . filename . "__"
        execute "normal! 3o"
        execute "normal! o#ENDIF /* __" . filename . "__ */"
        execute "normal! ggg~GGdd"
        execute "normal! ggOfh"
        execute ":1"
    endif
endfunction

function! CheckCppFile()
    let filename = expand("%:t")
    execute "normal! ggO// " . filename . " -- "
endfunction

function! CheckPyFile()
    if (getline("1") !~ "if '__main__' == __name__:")
    normal!ggOif '__main__' == __name__:
    normal!o    main()
    endif
endfunction

augroup LoadSkeleton
    autocmd!
    autocmd BufNewFile *.h  :call CheckHFile()
    autocmd BufNewFile *.hpp  :call CheckHFile()
    autocmd BufNewFile *.py :call CheckPyFile()
    autocmd BufNewFile *.cpp :call CheckCppFile()
augroup END
" }}}

" Stop the insert command once you are there too much time without action. {{{
augroup stop_insert_group
    autocmd!
    autocmd FocusLost * stopinsert
augroup END
" }}}

" Set the foldings of some common files. {{{
set foldtext=foldtext()
augroup folding
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType markdown setlocal foldmethod=indent
    autocmd FileType c,cpp setlocal foldmethod=syntax
    autocmd FileType diff setlocal foldmethod=diff
    autocmd FileType python setlocal foldmethod=indent
    autocmd FileType xml setlocal foldmethod=syntax
augroup END
let python_highlight_all = 1
let g:vimsyn_folding='afP'
let g:xml_syntax_folding = 1
let g:sh_fold_enabled= 7
" }}}

" Matching for all files and special files. {{{
" General Matching
highlight TrailingSpaces ctermbg=red
nnoremap <leader>srts :execute "normal!:" . '%s/\v\s+$//eg' . "\<lt>cr>``" <cr>
highlight TODO ctermbg=yellow
highlight CR ctermbg=lightred
" Trailing spaces
call matchadd('TrailingSpaces', '\v\s+$')
" C mapping
augroup c_matching
    autocmd!
    autocmd FileType c,cpp call matchadd('TODO', '\v(\/\*.*TODO:.*\*\/$)|(\/\/.*TODO:.*$)')
    autocmd FileType c,cpp call matchadd('CR', '\v(\/\*.*CR.*:.*\*\/$)|(\/\/.*CR.*:.*$)')
augroup end
" Python matching
augroup python_matching
    autocmd!
    autocmd FileType python call matchadd('TODO', '\v#.*TODO:.*$')
    autocmd FileType python call matchadd('CR', '\v#*.*CR.*:.*$')
augroup end
" }}}

" Set the status line {{{
" TODO: Refactor it after adding airline.
set statusline=%f                       " Filename of current file.
set statusline+=\ -\                    " Separator
set statusline+=%y                      " The type of the current file.
set statusline+=\ -\                    " Separator
set statusline+=%{getcwd()}             " The path of vim.
set statusline+=\ -\                    " Separator
set statusline+=%{FugitiveStatusline()} " Add the git branch name.
set statusline+=%=                      " Move the rest of the line to the left side.
set statusline+=%l                      " Current line number
set statusline+=/                       " Separator
set statusline+=%L                      " Total numbers in file.
" }}}

" Temp mapping, to create a better muscle memory. {{{
nnoremap <leader>h OSTOP USING THE <LEADER>H KEYS!!!!<Esc>
" }}}

" Diff format {{{
set diffopt=filler,internal,algorithm:histogram,indent-heuristic
" Diff format }}}
