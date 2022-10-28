#
# ~/.bashrc
#
alias mvim="VIMRUNTIME=/usr/share/vim/vim90 /home/omsa/Programs/vim/src/vim"
alias vimm="mvim"
export VISUAL=mvim
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
alias ivm="mvim"

alias :e="mvim"
alias :q="exit"
alias :qa="exit"
alias :w=
alias :wa=

alias potion="~/Projects/vim/potion/bin/potion"

alias python=python3
alias pip=pip3

# Some custom commands
alias learn_vim="mvim -u ~/Projects/mvim/vimrc"
alias cmak="cmake"
alias camke="cmake"
alias amke="make"

alias clipboard='xclip -sel clip'
alias ip-scan='sudo nmap -T4 -sP 172.16.6.0/23'
alias ip-scan-rasp='sudo nmap -T4 -sP 172.16.6.0/23 | grep Raspberry -B 2'

alias mount-omsa='sudo mount -o uid=omsa,gid=omsa'

# alias wgit="git.exe"

# export LD_LIBRARY_PATH="${PATH}:/usr/local/lib"

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

[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

# Complete Yocto commands
[[ -f ~/.config/yocto-completion/yocto_completion.sh ]] && . ~/.config/yocto-completion/yocto_completion.sh
[[ -f ~/.config/yocto-completion/yocto_completion.sh ]] || echo "Warning: No yocto-completion configured"

# Add git data
[[ -f ~/.config/git/completion.sh ]] && . ~/.config/git/completion.sh
[[ -f ~/.config/git/completion.sh ]] || echo "Warning: No git completion configured"
export PATH="${PATH}:/home/omsa/.config/git/git-extra-commands/bin"
[[ -f ~/.local/bin/bashmarks.sh ]] && . ~/.local/bin/bashmarks.sh
[[ -f ~/.local/bin/bashmarks.sh ]] || echo "Warning: No bashmarks configured"

export CY_TOOLS_PATHS="/home/omsa/Programs/Cypress/ModusToolbox_2.4.0.5972/tools_2.4"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1="\[\033[1;34m\]\D{} \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[34m\]\w\[\033[m\]\[\033[36m\]\$(parse_git_branch)\[\033[00m\] \n$ "

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
set -o vi
bind -m vi-insert "\C-l":clear-screen
bind '"hh":vi-movement-mode'

expor=/usr/share/doc/python2/html/

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export LIBGPHOTO2_INSTALL_PATH=~/.local

shopt -s cdspell

fortune | cowsay -f tux
export PATH="$PATH:/home/omsa/Downloads/010editor" #ADDED BY 010 EDITOR
