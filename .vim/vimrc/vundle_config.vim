" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end. {{{
" File system plugins {{{
Plugin 'scrooloose/nerdtree'
" }}}

" Language plugins {{{
" Comment Plugins {{{
Plugin 'scrooloose/nerdcommenter'
" }}}
" }}}

"Plugin 'honza/vim-snippets'
"Plugin 'scrooloose/syntastic'
"Plugin 'valloric/youcompleteme'
"Plugin 'tpope/vim-fugitive'
"Plugin 'kien/ctrlp.vim'
"Plugin 'altercation/vim-colors-solarized'
"Plugin 'easymotion/vim-easymotion'
"Plugin 'terryma/vim-multiple-cursors'
"Plugin 'brookhong/cscope.vim'
"Plugin 'hari-rangarajan/cctree'
"Plugin 'davits/dyevim'
"Plugin 'jeaye/color_coded'
"Plugin 'SirVer/ultisnips'
"Plugin 'apalmer1377/factorus'
"Plugin 'luchermitte/vim-refactor'
"Plugin 'renamec.vim'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'haya14busa/incsearch.vim'
"Plugin 'haya14busa/incsearch-fuzzy.vim'
"Plugin 'dominikduda/vim_current_word'
"Plugin 'google/vim-searchindex'
"Plugin 'sjl/gundo.vim'
"Plugin 'octref/rootignore'
"Plugin 'klen/python-mode'
"Plugin 'simeji/winresizer'
"Plugin 'FelikZ/ctrlp-py-matcher'
"Plugin 'mhinz/vim-grepper'
"Plugin 'jacquesbh/vim-showmarks'
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
