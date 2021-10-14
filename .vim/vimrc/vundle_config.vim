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
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'aonemd/kuroi.vim'
" }}}
Plugin 'junegunn/limelight.vim'
" }}}

" File system Plugins {{{
Plugin 'scrooloose/nerdtree'
" Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'stsewd/fzf-checkout.vim'
" }}}

" Sessions Plugins {{{
Plugin 'tpope/vim-obsession'
" TODO: Try to understand why it doesn't work and fix it {{{
" The auto-completion of this plugins doesn't work from some reason (some plugin
" that is related to adding git branches to the names of the sessions). I should
" understand what is the problem and try to fix it, it doesn't look like a big
" overhead.
Plugin 'dhruvasagar/vim-prosession'
" }}}
" }}}

" Language Plugins {{{
" Comment Plugins {{{
Plugin 'scrooloose/nerdcommenter'
Plugin 'kkoomen/vim-doge'
Plugin 'vim-scripts/DoxygenToolkit.vim' " vim-doge is better
" }}}
" C Plugins {{{
Plugin 'hari-rangarajan/cctree'
Plugin 'apalmer1377/factorus' " TODO: Open an issue, try to talk with the plugin writer and find out if I can write it for him.
" }}}
" CPP Plugins {{{
Plugin 'bfrg/vim-cpp-modern'
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
Plugin 'mzlogin/vim-markdown-toc'
" }}}
" Vim-script Plugins {{{
" Code writing Plugins. TODO: Read full docs {{{
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
" Code writing Plugins. }}}
Plugin 'google/vimdoc'
Plugin 'LucHermitte/lh-vim-lib'
" }}}
" Spelling Plugins {{{
Plugin 'tpope/vim-abolish'
" }}}
" English Text Plugins {{{
Plugin 'reedes/vim-pencil'
" }}}
" Cmake Plugins {{{
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'vhdirk/vim-cmake'
" }}}
" Kotlin Plugins {{{
Plugin 'udalov/kotlin-vim'
" }}}
" }}}

" Movement Plugins {{{
Plugin 'easymotion/vim-easymotion'
Plugin 'unblevable/quick-scope'
" Searching {{{
" Plugin 'haya14busa/incsearch.vim'
" Plugin 'haya14busa/incsearch-fuzzy.vim'
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
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'justinmk/vim-ipmotion'
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
Plugin 'junegunn/gv.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-rhubarb'
Plugin 'whiteinge/diffconflicts'
Plugin 'rbong/vim-flog'
Plugin 'rhysd/committia.vim'
Plugin 'sodapopcan/vim-twiggy'
" gitlab Plugins {{{
Plugin 'omrisarig13/vim-mr-interface'
" gitlab Plugins }}}
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
Plugin 'omrisarig13/marvim'
Plugin 'tpope/vim-repeat'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'zhimsel/vim-stay'
Plugin 'christoomey/vim-system-copy'
" Plugin 'chaoren/vim-wordmotion'
Plugin 'markonm/traces.vim'
" Plugin 'junegunn/vim-peekaboo'
" YankRing {{{
" TODO: Read the full documentation and understand how to best use this plugin.
" Plugin 'vim-scripts/YankRing.vim'
" }}}
Plugin 'AndrewRadev/sideways.vim'
Plugin 'Lenovsky/nuake'
Plugin 'chrisbra/NrrwRgn'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-unimpaired'
Plugin 'ntpeters/vim-better-whitespace'
" Plugin 'soywod/kronos.vim'
Plugin 'omrisarig13/vim-auto-abbrev'
Plugin 'metakirby5/codi.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'tpope/vim-eunuch'

Plugin 'kana/vim-operator-user'
Plugin 'mwgkgk/vim-operator-insert'
Plugin 'mwgkgk/vim-operator-append'
Plugin 'inkarkat/vim-ReplaceWithRegister'
Plugin 'inkarkat/vim-ReplaceWithSameIndentRegister'
Plugin 'svermeulen/vim-subversive'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'rhysd/reply.vim'
" }}}

" Application Plugins {{{
Plugin 'itchyny/calendar.vim'
Plugin 'vim/killersheep'
" }}}

" Keep to last {{{
Plugin 'honza/vim-snippets'
if has('nvim')
    " Plugin 'Shougo/deoplete.nvim'
else
    Plugin 'scrooloose/syntastic'
endif
" Plugin 'dense-analysis/ale'
Plugin 'valloric/youcompleteme'
"Plugin 'rdnetto/YCM-Generator'
"Plugin 'davits/dyevim'
" TODO: Understand why it is not working and try to fix it.
Plugin 'SirVer/ultisnips'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
Plugin 'kana/vim-textobj-user'
Plugin 'glts/vim-textobj-comment'
Plugin 'sgur/vim-textobj-parameter'
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
" }}}

" To Add {{{
" To Check {{{
" Plugin 'tpope/vim-dispatch'
" Plugin 'Shadowsith/kotlincomplete.vim'
" Plugin 'hsanson/vim-android'
" Plugin 'ludovicchabant/vim-gutentags'
" Plugin 'dense-analysis/ale'
" Plugin 'vim-volt/volt'
" Plugin 'Jorengarenar/fauxClip'
" Plugin 'arzg/vim-rust-syntax-ext'
" Plugin 'skywind3000/asynctasks.vim'
" Plugin 'rbong/vim-crystalline'
" Plugin 'mg979/vim-xtabline'
" }}}
" Small Issues {{{
" Plugin 'zef/vim-cycle' - Check how much it affects the regular action of c-a, c-x (doing this at the start of the line, for example).
" Plugin 'justinmk/vim-sneak' - Runs over s command, decide if this is really wanted.
" Plugin 'MHordecki/vim-subword' - Could not run without python provider.
" Plugin 'kana/vim-textobj-line' - Collide with targets.vim, needs to see if this is actually wanted, and if so, change the default mapping of it.
" Plugin 'tpope/vim-tbone' - Not really needed now, maybe in the future.
" }}}
" }}}

" To check out {{{
" Plugin 'justinmk/vim-gtfo'
" Plugin 'bbchung/clighter8'
" Plugin 'LucHermitte/clang_complete'
" Plugin 'LucHermitte/vim-clang'
" Plugin 'LucHermitte/vim-compil-hints'
" Plugin 'LucHermitte/vim-refactor'
" Plugin 'LucHermitte/lh-cmake'
" Plugin 'LucHermitte/vim-system-tools'
" Plugin 'LucHermitte/VimFold4C'
" Plugin 'LucHermitte/vim-UT'
" Plugin 'LucHermitte/valgrind.vim'
" Plugin 'LucHermitte/SearchInRuntimet'
" Plugin 'LucHermitte/GOD.vim'
" Plugin 'LucHermitte/vim-jira-complete'
" Plugin 'Andersbakken/rtags'
" Plugin 'pechorin/any-jump.vim'
" Plugin 'tomasiser/vim-code-dark'
" Plugin 'ianding1/leetcode.vim'
" Plugin 'ajmwagar/vim-deus'
" Plugin 'Konfekt/vim-office'
" Plugin 'chiphogg/vim-vtd'
" Plugin 'vim-test/vim-test'
" Plugin 'editorconfig/editorconfig-vim'
" Plugin 'fmoralesc/vim-tutor-mode'
" Plugin 'mipmip/vim-scimark' Watch out - there are prerequirments that should
" be installed as well.
" Plugin 'rhysd/git-messenger.vim'
" Plugin 'Konfekt/vim-CtrlXA'
" Plugin 'AlphaMycelium/pathfinder.vim'
" Plugin 'wvanlint/twf'
" Plugin 'stefandtw/quickfix-reflector.vim'
" Plugin 'lervag/vimtex'
" Plugin 'wellle/context.vim'
" Plugin 'fredkschott/covim'
" Plugin 'guns/vim-sexp'
" Plugin 'wsdjeg/vim-fetch'
" Plugin 'kamykn/spelunker.vim'
" Plugin 'ntpeters/vim-better-whitespace'
" Plugin 'FooSoft/vim-argwrap'
" Plugin 'arcticicestudio/nord-vim'
" Plugin 'junegunn/vim-easy-align'
" Plugin 'RRethy/vim-hexokinase'
" Plugin 'lervag/vimtex'
" Plugin 'embark-theme/vim'
" Plugin 'lpinilla/vim-codepainter'
" Plugin 'kyazdani42/nvim-tree.lua'
" Plugin 'ms-jpq/chadtree'
" Plugin 'weirongxu/coc-explorer'
" Plugin 'scr1pt0r/crease.vim'
" Plugin 'vim-add-ons/clavichord-omni-completion'
" Plugin 'bignimbus/you-are-here.vim'
" Plugin 'mg979/docgen.vim'
" Plugin 'michaelb/sniprun'
" Plugin 'Yggdroot/indentLine'
" Plugin 'rhysd/clever-f.vim'
" Plugin 'VsVim/VsVim'
" Plugin 'MattesGroeger/vim-bookmarks'
" Plugin 'michaelb/vim-tips'
" Plugin 'tommcdo/vim-exchange'
" Plugin 'voldikss/vim-floaterm'
" Plugin 'ledesmablt/vim-run'
" Plugin 'romainl/vim-qf'
" Plugin 'tpope/vim-unimpaired'
" Plugin 'gsiano/vmux-clipboard'
" Plugin 'svermeulen/vim-easyclip'
" Plugin 'KenN7/vim-arsync'
" Plugin ''
Plugin 'puremourning/vimspector'
if has('nvim')
    Plugin 'glacambre/firenvim' " Amazing!!!!
endif
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
"   https://github.com/LucHermitte/local_vimrc
"   https://github.com/dbarnett/dotfiles
"
"   https://github.com/zdcthomas/dmux
"   https://github.com/lotabout/skim
"   https://github.com/tmuxinator/tmuxinator
"   https://github.com/mhinz/vim-galore
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
" linnne a good plugin. - from some reason it always take over the c-n mapping.
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
" Plugin 'LucHermitte/lh-vim-lib' - Folding doesn't work good enough.
" Plugin 'LucHermitte/VimFold4C' - Folding doesn't work good enough.
" Plugin 'rbtnn/vim-popup_signature' - This feature is now part of YouCompleteMe
" Plugin 'kien/ctrlp.vim' - Replaced with fzf
" Plugin 'FelikZ/ctrlp-py-matcher' - ctrlp Replaced with fzf
" Plugin 'octref/rootignore' - ctrlp Replaced with fzf
" Plugin 'vim-scripts/DoxygenToolkit.vim' - vim-doge is better
" Plugin 'brookhong/cscope.vim' - The built-in support of cscope, with cscope script are good enough.
" Plugin 'rhysd/vim-clang-format' - Not needed since vim has support for this now.
" Plugin 'Ron89/thesaurus_query.vim' - Not used, so there is no reason to keep it in the config.
" Plugin 'liuchengxu/vim-clap' - FZF is working better.
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
call glaive#Install() " TODO: Understand what it does and move from here.
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

Glaive codefmt plugin[mappings]
Glaive codefmt google_java_executable="java -jar /usr/local/java/google-java-format-1.7-all-deps.jar"

" vim:nospell
