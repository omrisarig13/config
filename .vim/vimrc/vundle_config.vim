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
" This plugin being messed by vim-searchindex. For now, the search-index is more
" important to, so I commented out those plugins. Hopefully,
" google/vim-searchindex plugin would add enable/disable function to it shortly,
" and than I would be able to use both of those plugins at once.
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
" }}}
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
" TODO: Restore this plugin to be google one's, once the pull request is
" resolved.
" Plugin 'google/vim-searchindex'
Plugin 'omrisarig13/vim-searchindex'
" }}}

" Keep to last {{{
"Plugin 'honza/vim-snippets'
"Plugin 'scrooloose/syntastic'
"Plugin 'valloric/youcompleteme'
"Plugin 'davits/dyevim'
"Plugin 'SirVer/ultisnips'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
" }}}

" To un-comment, one at a time {{{
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
