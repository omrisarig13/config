#
# ~/.bashrc
#
export VISUAL=vim
export EDITOR="$VISUAL"

alias ls="ls --color"
alias ll="ls -la --color"
alias l="ls -b --color"
alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"
alias .......="cd ../../../../../../"
alias ........="cd ../../../../../../../"
alias .........="cd ../../../../../../../../"
alias ..........="cd ../../../../../../../../../"
alias ...........="cd ../../../../../../../../../../"
alias ............="cd ../../../../../../../../../../../"
alias .............="cd ../../../../../../../../../../../../"
alias ..............="cd ../../../../../../../../../../../../../"
alias ...............="cd ../../../../../../../../../../../../../../"
alias ................="cd ../../../../../../../../../../../../../../../"
alias .................="cd ../../../../../../../../../../../../../../../../"
alias ..................="cd ../../../../../../../../../../../../../../../../../"
alias ...................="cd ../../../../../../../../../../../../../../../../../../"
alias remove_exes="find . -perm -1 -type f -maxdepth 1 2>/dev/null | xargs rm"
alias ivm="vim"

alias :e="vim"
alias :q="exit"
alias :qa="exit"
alias :w=
alias :wa=

alias potion="~/Projects/vim/potion/bin/potion"

alias python=python3
alias pip=pip3

# Some custom commands
alias learn_vim="vim -u ~/Projects/vim/vimrc"
alias cmak="cmake"
alias camke="cmake"
alias amke="make"

# alias wgit="git.exe"

[[ $- != *i* ]] && return

PS1="\[\033[1;34m\]\D{} \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\] $ "
fortune | cowsay
