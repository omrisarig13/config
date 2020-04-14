" Map the leader characters. {{{
let mapleader = "-"
let maplocalleadr = "_"
" }}}

" Load all the plugins to vim using Vundle.
source $HOME/.vim/vimrc/vundle_config.vim

" Set all the plugin's specific config.
source $HOME/.vim/vimrc/plugins_config.vim

" Load all the personal vim files.
source $HOME/.vim/vimrc/scripts_config.vim

" Load the abbreviate file.
source $HOME/.vim/vimrc/abbrev.vim

" Load the actual vimrc file.
source $HOME/.vim/vimrc/personal.vim

if has('nvim')
    source $HOME/.vim/vimrc/nvim_specific.vim
else
    source $HOME/.vim/vimrc/vim_specific.vim
endif
