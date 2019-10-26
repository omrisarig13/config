" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end. {{{

" Color Plugins {{{
" Colorschemes Plugins {{{
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kracejic/themeinabox.vim'
Plugin 'rhysd/vim-color-spring-night'
Plugin 'jaredgorski/SpaceCamp'
Plugin 'sainnhe/vim-color-desert-night'
Plugin 'NLKNguyen/papercolor-theme'
" }}}
Plugin 'junegunn/limelight.vim'
" }}}

" File system Plugins {{{
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'octref/rootignore'
Plugin 'junegunn/fzf.vim'
" }}}

" Sessions Plugins {{{
Plugin 'tpope/vim-obsession'
Plugin 'dhruvasagar/vim-prosession'
" }}}

" Language Plugins {{{
" Comment Plugins {{{
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/DoxygenToolkit.vim'
" Documentation Plugins {{{
Plugin 'kkoomen/vim-doge'
" Documentation Plugins }}}
" }}}
" C Plugins {{{
Plugin 'brookhong/cscope.vim'
Plugin 'hari-rangarajan/cctree'
Plugin 'apalmer1377/factorus'
" }}}
" CPP Plugins {{{
Plugin 'bfrg/vim-cpp-modern'
" vim-clang-format {{{
" TODO: Move over all the formatting option and customize them better for my
" taste.
Plugin 'rhysd/vim-clang-format'
" vim-clang-format }}}
" }}}
" Plant Uml Plugins {{{
Plugin 'aklt/plantuml-syntax'
Plugin 'scrooloose/vim-slumlord'
" }}}
" Markdown Plugins {{{
" tabular must precede vim-markdown.
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/markdown-preview.nvim'
" }}}
" Vim-script Plugins {{{
" Plugin 'rbtnn/vim-popup_signature'
Plugin 'google/vimdoc'
" }}}
" Spelling Plugins {{{
Plugin 'tpope/vim-abolish'
" }}}
" English Text Plugins {{{
Plugin 'Ron89/thesaurus_query.vim'
Plugin 'reedes/vim-pencil'
" }}}
" Cmake Plugins {{{
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'vhdirk/vim-cmake'
" }}}
" }}}

" Movement Plugins {{{
Plugin 'easymotion/vim-easymotion'
Plugin 'unblevable/quick-scope'
" Searching {{{
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'bronson/vim-visual-star-search'
Plugin 'mhinz/vim-grepper'
Plugin 'wincent/ferret'
Plugin 'google/vim-searchindex'
Plugin 'brooth/far.vim'
" }}}
" Folding {{{
Plugin 'Konfekt/FastFold'
Plugin 'pseewald/vim-anyfold'
" }}}
Plugin 'matze/vim-move'
Plugin 'wellle/targets.vim'
" }}}

" Windows Plugins {{{
" Plugin 'simeji/winresizer'
" TODO: Revert to the old win-reasizer once the pull request is approved.
Plugin 'omrisarig13/winresizer'
Plugin 'dhruvasagar/vim-zoom'
Plugin 't9md/vim-choosewin'
Plugin 'weilbith/nerdtree_choosewin-plugin'
" }}}

" Source Control Plugins {{{
Plugin 'airblade/vim-rooter'
" Git Plugins {{{
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-rhubarb'
Plugin 'whiteinge/diffconflicts'
Plugin 'rbong/vim-flog'
Plugin 'rhysd/committia.vim'
Plugin 'sodapopcan/vim-twiggy'
" }}}
" }}}

" Marks Plugins {{{
Plugin 'bootleq/ShowMarks'
Plugin 'kshenoy/vim-signature'
" }}}

" Quickfix Plugins {{{
Plugin 'yssl/QFEnter'
" }}}

" Auto Completion Plugins {{{
Plugin 'wellle/tmux-complete.vim'
" }}}

" Feature Plugins {{{
Plugin 'terryma/vim-multiple-cursors'
Plugin 'dominikduda/vim_current_word'
Plugin 'simnalamburt/vim-mundo'
Plugin 'liuchengxu/vim-which-key'
Plugin 'arthurxavierx/vim-caser'
Plugin 'tpope/vim-surround'
Plugin 'chamindra/marvim'
Plugin 'tpope/vim-repeat'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'zhimsel/vim-stay'
Plugin 'christoomey/vim-system-copy'
" Plugin 'chaoren/vim-wordmotion'
Plugin 'markonm/traces.vim'
Plugin 'junegunn/vim-peekaboo'
" YankRing {{{
" TODO: Read the full documentation and understand how to best use this suprer
" usefull plugin.
" Plugin 'vim-scripts/YankRing.vim'
" }}}
Plugin 'AndrewRadev/sideways.vim'
Plugin 'Lenovsky/nuake'
Plugin 'chrisbra/NrrwRgn'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-unimpaired'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'soywod/kronos.vim'
Plugin 'omrisarig13/vim-auto-abbrev'
Plugin 'metakirby5/codi.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'tpope/vim-eunuch'

Plugin 'kana/vim-operator-user'
Plugin 'mwgkgk/vim-operator-insert'
Plugin 'mwgkgk/vim-operator-append'
Plugin 'inkarkat/vim-ReplaceWithRegister'
Plugin 'inkarkat/vim-ReplaceWithSameIndentRegister'
" }}}

" Application Plugins {{{
Plugin 'itchyny/calendar.vim'
" }}}

" Keep to last {{{
Plugin 'honza/vim-snippets'
Plugin 'scrooloose/syntastic'
Plugin 'valloric/youcompleteme'
"Plugin 'rdnetto/YCM-Generator'
"Plugin 'davits/dyevim'
Plugin 'SirVer/ultisnips'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
"Plugin 'klen/python-mode'
"Plugin 'w0rp/ale'
"Plugin 'janko/vim-test'
"Plugin 'romainl/vim-qf'
" TODO: Move on the textobjects in the link and add the useful ones. {{{
" Plugin 'kana/vim-textobj-user' }}}
" Plugin 'kana/vim-textobj-lastpat'
" splitjoin {{{
" TODO: Check if it is possible to change the splitting of c files, and if it
" is, than do it and restore this plugin.
" Plugin 'AndrewRadev/splitjoin.vim'
" }}}
" Plugin 'LucHermitte/lh-cpp'
" TODO: Add option to change the flags used for this plugin, so it would be {{{
" able to run with my vim configuration.
" Plugin 'CRefVim'
" }}}
" Plugin 'neoclide/coc.nvim'
" Plugin 'WolfgangMehner/vim-plugins'
" Plugin 'rbong/vim-crystalline' - If airline doesn't work
" Code writing Plugins. {{{
" Plugin 'google/vim-maktaba'
" Plugin 'google/vim-glaive'
" Plugin 'google/vim-codefmt'
" Code writing Plugins. }}}
" }}}

" To Add {{{
" Plugin 'svermeulen/vim-subversive'
" Plugin 'liuchengxu/vim-clap'
" Plugin 'KenN7/vim-arsync'
" }}}

" To check out {{{
"   https://github.com/tpope?tab=repositories
"   https://www.vim.org/scripts/script.php?script_id=2353
"   https://www.vim.org/scripts/script.php?script_id=213
"   https://github.com/dhruvasagar/dotfiles
"   https://github.com/braintreeps/vim_dotfiles
"   https://github.com/Tarptaeya/vim-dotfiles
"   https://github.com/dmitmel/dotfiles
"   https://github.com/wsdjeg/DotFiles
"   https://github.com/huyvohcmc/dotfiles
"   https://github.com/reireias/dotfiles
" }}}

" Not Used {{{
" Not Working {{{
" Have a compiled component, but it doesn't compile on the system.
" Plugin 'jeaye/color_coded'
" Plugin 'vim-scripts/textobj-fatpack'
" Plugin 'exUtility'
" TODO: Try to understand why it doesn't work and fix it, since it looks {{{
" like a good plugin.
" Plugin 'stefandtw/quickfix-reflector.vim' }}}
" TODO: Try to understand why it doesn't work and fix it, since it looks {{{
" like a good plugin.
" Plugin 'sjbach/lustyz' }}}
" TODO: Try to understand why it doesn't work and fix it, since it looks {{{
" like a good plugin. - from some reason it always take over the c-n mapping.
" Plugin 'mg979/vim-visual-multi' }}}
" }}}
" Unnecessary {{{
" Plugin 'vcscommand.vim'
" Plugin 'felixhummel/setcolors.vim'
" Plugin 'osyo-manga/vim-over'
" Plugin 't9md/vim-smalls'
" Plugin 'junegunn/goyo.vim'
" Plugin 'haya14busa/vim-asterisk'
" Plugin 'tpope/vim-vinegar'
" Plugin 'nelstrom/vim-qargs'
" Plugin 'machakann/vim-sandwich' - vim-surround used
" Plugin 'tomtom/tcomment_vim' - NerdCommenter used
" Plugin 'AndrewRadev/switch.vim'
" Plugin 'vim-scripts/ZoomWin' - vim-zoom used
" Plugin 'tpope/vim-apathy'
" Plugin 'rhysd/clever-f.vim'
" Plugin 'justinmk/vim-dirvish'
" Plugin 'dbakker/vim-projectroot' vim-rooter used
" Plugin 'thaerkh/vim-workspace' - Prosession used
" Plugin 'tpope/vim-tbone'
" Plugin 'srstevenson/vim-picker' - FZF used
" Plugin 'TaDaa/vimade'
" Plugin 'paroxayte/vwm.vim'
" Plugin 'vim-ctrlspace/vim-ctrlspace' - fzf is used
" Plugin 'samoshkin/vim-mergetool' - diffconflicts is used
" mundo seems to be the better option even though it is a fork if this plugin.
" Plugin 'sjl/gundo.vim'
" Plugin 'thaerkh/vim-indentguides' - built in listchar is good enough.
" Plugin 'thinca/vim-themis' - It seems that the assert mechanism has changed.
" Plugin 'romainl/vim-cool' - Does unwanted functionality
" Plugin 'justinmk/vim-gtfo' - vim now has terminal feature
" Plugin 'junegunn/vim-slash' - starsearch does good enough job for searching.
" Plugin 'lambdalisue/gina.vim' - Other git plugins work good enough.
" Plugin 'machakann/vim-swap' - vim-sideways is good enough.
" Plugin 'embear/vim-localvimrc'
" Plugin 'kamykn/spelunker.vim'
" Plugin 'Shougo/denite.nvim' - fzf searches good enough.
" Plugin 'svermeulen/vim-easyclip' - YankRing works good enough.
" Plugin 'dan-t/vim-cpp-include' - cscope works good enough.
" Plugin 'neoclide/vim-node-rpc' - Coc seems to be the better option.
" Plugin 'andymass/vim-matchup' - The regular vim behavior is good enough.
" Plugin 'zivyangll/git-blame.vim' - Fugitive has Gblame that is a better option.
" Plugin 'eugen0329/vim-esearch' - Grepper and ferret seems better.
" }}}
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


" vim:nospell
