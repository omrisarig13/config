" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end. {{{

" Colorschemes Plugins {{{
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kracejic/themeinabox.vim'
Plugin 'rhysd/vim-color-spring-night'
" }}}

" File system Plugins {{{
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'octref/rootignore'
" }}}

" Sessions Plugins {{{
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
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
" Plant Uml Plugins {{{
Plugin 'aklt/plantuml-syntax'
Plugin 'scrooloose/vim-slumlord'
" }}}
" }}}

" Movement Plugins {{{
Plugin 'easymotion/vim-easymotion'
" Searching {{{
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'mhinz/vim-grepper'
" }}}
Plugin 'pseewald/vim-anyfold'
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
" ShowMarks {{{
Plugin 'bootleq/ShowMarks'
" }}}
Plugin 'godlygeek/tabular'
Plugin 'liuchengxu/vim-which-key'
Plugin 'arthurxavierx/vim-caser'
Plugin 'tpope/vim-surround'
" TODO: Change this to be Chamindra plugin back once the development and the
" pull request would be done.
Plugin 'omrisarig13/marvim'
" }}}

" Keep to last {{{
"Plugin 'honza/vim-snippets'
"Plugin 'scrooloose/syntastic'
"Plugin 'valloric/youcompleteme'
"Plugin 'rdnetto/YCM-Generator'
"Plugin 'davits/dyevim'
"Plugin 'SirVer/ultisnips'
"Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
"Plugin 'klen/python-mode'
"Plugin 'w0rp/ale'
" }}}

" To un-comment, one at a time {{{
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
"Plugin 'rbtnn/vim-popup_signature'
"Plugin 'kana/vim-textobj-user'
"Plugin 'machakann/vim-sandwich'
"Plugin 'tomtom/tcomment_vim'
"Plugin 'AndrewRadev/switch.vim'
"Plugin 'zhimsel/vim-stay'
"Plugin 'dhruvasagar/vim-zoom'
"Plugin 'tpope/vim-apathy'
"Plugin 'AndrewRadev/splitjoin.vim'
"Plugin 'vim-advent-calendar/vimways.org'
"Plugin 'rhysd/clever-f.vim'
"Plugin 'google/vimdoc'
"Plugin 'justinmk/vim-dirvish'
"Plugin 'whiteinge/diffconflicts'
"Plugin 'airblade/vim-rooter'
"Plugin 'thaerkh/vim-workspace'
"Plugin 'tpope/vim-tbone'
"Plugin 'kshenoy/vim-signature'
"Plugin 'srstevenson/vim-picker'
"Plugin 'christoomey/vim-system-copy'
"Plugin 'TaDaa/vimade'
"Plugin 'paroxayte/vwm.vim'
"Plugin 'chaoren/vim-wordmotion'
"Plugin 'markonm/traces.vim'
"Plugin 'LucHermitte/lh-cpp'
"Plugin 'rbong/vim-flog'
"Plugin 'samoshkin/vim-mergetool'
"Plugin 'vim-ctrlspace/vim-ctrlspace'
"Plugin 'rhysd/committia.vim'
"Plugin 'simnalamburt/vim-mundo'
"Plugin 'tpope/vim-abolish'
"Plugin 'thaerkh/vim-indentguides'
"Plugin 'osyo-manga/vim-over'
"Plugin 'thinca/vim-themis'
"Plugin 'sodapopcan/vim-twiggy'
"Plugin 'junegunn/vim-peekaboo'
"Plugin 'romainl/vim-qf'
"Plugin 'romainl/vim-cool'
"Plugin 'justinmk/vim-gtfo'
"Plugin 'vim-scripts/YankRing.vim'
"Plugin 'junegunn/vim-slash'
"Plugin 'AndrewRadev/sideways.vim'
"Plugin 'trevordmiller/nova-vim'
"Plugin 'bfrg/vim-cpp-modern'
"Plugin 'trevordmiller/nova-vim'
"Plugin 'Ron89/thesaurus_query.vim'
"Plugin 'wincent/ferret'
"Plugin 'Konfekt/FastFold'
"Plugin 'lambdalisue/gina.vim'
"Plugin 'Lenovsky/nuake'
"Plugin 'chrisbra/NrrwRgn'
"Plugin 'zefei/vim-wintab'
"Plugin 'machakann/vim-swap'
"Plugin 'embear/vim-localvimrc'
"Plugin 'wellle/tmux-complete.vim'
"Plugin 'vim-scripts/DoxygenToolkit.vim'
"Plugin 'Shougo/denite.nvim'
" To check out:
"   https://github.com/tpope?tab=repositories
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
