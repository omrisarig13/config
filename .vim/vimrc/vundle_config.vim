" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end. {{{

" Colorschemes Plugins {{{
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
" }}}

" File system Plugins {{{
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'octref/rootignore'
" }}}

" Language Plugins {{{
" Comment Plugins {{{
Plugin 'scrooloose/nerdcommenter'
" }}}
" C Plugins {{{
Plugin 'brookhong/cscope.vim'
Plugin 'hari-rangarajan/cctree'
Plugin 'apalmer1377/factorus'
" }}}
" }}}

" Movement Plugins {{{
Plugin 'easymotion/vim-easymotion'
" Searching {{{
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'mhinz/vim-grepper'
" }}}
" }}}

" Windows Plugins {{{
" Plugin 'simeji/winresizer'
" TODO: Revert to the old win-reasizer once the pull request is approved.
Plugin 'omrisarig13/winresizer'
" }}}

" Source Control Plugins {{{
" Git Plugins {{{
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" }}}
" }}}

" Feature Plugins {{{
Plugin 'terryma/vim-multiple-cursors'
Plugin 'dominikduda/vim_current_word'
" vim-searchindex {{{
Plugin 'google/vim-searchindex'
" }}}
Plugin 'sjl/gundo.vim'
" TODO: Revert to the original version if the pull request would be approved.
" Plugin 'bootleq/ShowMarks'
Plugin 'omrisarig13/ShowMarks'
" }}}

" Keep to last {{{
"Plugin 'honza/vim-snippets'
"Plugin 'scrooloose/syntastic'
"Plugin 'valloric/youcompleteme'
"Plugin 'davits/dyevim'
"Plugin 'SirVer/ultisnips'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'klen/python-mode'
" }}}

" To un-comment, one at a time {{{
"Plugin 'pseewald/vim-anyfold'
"Plugin 'w0rp/ale'
"Plugin 'godlygeek/tabular'
"Plugin 'rdnetto/YCM-Generator'
"Plugin 'liuchengxu/vim-which-key'
"Plugin 'arthurxavierx/vim-caser'
"Plugin 'tpope/vim-surround'
"Plugin 'vim-scripts/marvim'
"Plugin 'aklt/plantuml-syntax'
"Plugin 'scrooloose/vim-slumlord'
"Plugin 'tpope/vim-obsession'
"Plugin 'dhruvasagar/vim-prosession'
"Plugin 'gikmx/vim-ctrlposession'
"Plugin 'kracejic/themeinabox.vim'
"Plugin 'bronson/vim-visual-star-search'
"Plugin 'unblevable/quick-scope'
"Plugin 'matze/vim-move'
"Plugin 'kana/vim-textobj-lastpat'
"Plugin 'vim-scripts/textobj-fatpack'
"Plugin 'tpope/vim-repeat'
"Plugin 'vcscommand.vim'
"Plugin 'exUtility'
"Plugin 'CRefVim'
"Plugin 'osyo-manga/vim-over'
"Plugin 't9md/vim-smalls'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'iamcco/markdown-preview.nvim'
"Plugin 'junegunn/limelight.vim'
"Plugin 'junegunn/goyo.vim'
"Plugin 'tpope/vim-rhubarb'
"Plugin 'dbakker/vim-projectroot'
"Plugin 'felixhummel/setcolors.vim'
"Plugin 'haya14busa/vim-asterisk'
"Plugin 'janko/vim-test'
"Plugin 'stefandtw/quickfix-reflector.vim'
" zoomwin {{{
"TODO: Find a fork with bug fixes, since it seems like this version is old and
"doesn't update.
"Plugin 'vim-scripts/ZoomWin'
"}}}
"Plugin 'romainl/vim-qf'
"Plugin 'yssl/QFEnter'
"Plugin 'jistr/vim-nerdtree-tabs'
"Plugin 'tpope/vim-vinegar'
"Plugin 'vim-scripts/LustyExplorer'
"Plugin 'jaredgorski/SpaceCamp'
"Plugin 'nelstrom/vim-qargs'
"Plugin 'junegunn/fzf.vim'
"Plugin 'tpope/vim-abolish'
"Plugin 'jeffkreeftmeijer/vim-numbertoggle'
" }}}

" Not working {{{
" Have a compiled component, but it doesn't compile on the system.
" Plugin 'jeaye/color_coded'
" }}}
" }}}

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
