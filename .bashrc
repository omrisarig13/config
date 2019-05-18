#
# ~/.bashrc
#
export VISUAL=vim
export EDITOR="$VISUAL"

alias ll="ls -la"
alias l="ls -b"
alias ..="cd ../"
alias ...="cd ../../"
alias remove_exes="find . -perm -1 -type f -maxdepth 1 2>/dev/null | xargs rm"
alias ivm="vim"

alias :e="vim"
alias :q="exit"
alias :qa="exit"
alias :w=
alias :wa=

alias potion="~/Projects/vim/potion/bin/potion"

# Some custom commands
alias learn_vim="vim -u ~/Projects/vim/vimrc"

export PATH="${PATH}:/home/omri/bin"
export PATH="${PATH}:/home/omri/.gem/ruby/2.5.0/bin"

[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}
r
[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

# Add git data
source ~/.config/git/completion.bash

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\[\033[36m\]\$(parse_git_branch)\033[00m\] $ "
fortune | cowsay -f $(ls /usr/share/cows | shuf -n1)

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
set -o vi
bind -m vi-insert "\C-l":clear-screen
bind '"hh":vi-movement-mode'

expor=/usr/share/doc/python2/html/
