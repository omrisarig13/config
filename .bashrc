#!/bin/bash
#
# ~/.bashrc
#
alias mvim="vim"
alias vimm="vim"
# alias vi="knvim"
export VISUAL='nvim'
export EDITOR="$VISUAL"

export NIX_PATH="nixpkgs=https://nixos.org/channels/nixpkgs-unstable/nixexprs.tar.xz"
# export NIX_PATH="nixpkgs=https://github.com/NixOS/nixpkgs/archive/refs/heads/release-25.11.tar.gz"
export PATH="$HOME/.nix-profile/bin:$PATH"
# export NIX_CACHE_HOME="/scratch/nix/cache"

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

alias python=python3
alias pip=pip3

# Some custom commands
alias learn_vim="mvim -u \$HOME/Projects/mvim/vimrc"
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

[[ -f "$HOME/.extend.bashrc" ]] && . "$HOME/.extend.bashrc"

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

# Function to source a file with optional warning
source_if_exists() {
    local file="$1"
    local description="$2"

    if [[ -f "$file" ]]; then
        . "$file"
    else
        echo "Warning: No $description configured"
    fi
}

# Add git data
source_if_exists "$HOME/.config/git/git-prompt.sh" "git prompt"
source_if_exists "$HOME/.config/personal/bin/bashmarks.sh" "bashmarks"
export PATH="${PATH}:$HOME/.config/git/git-extra-commands/bin"

# Timer for command execution
timer_start() {
    timer=${timer:-$(date +%s)}
}

timer_stop() {
    local end_time
    local elapsed
    end_time=$(date +%s)
    elapsed=$((end_time - timer))
    timer_show=$(printf "%d" $elapsed)
    unset timer
}

trap 'timer_start' DEBUG

export GIT_PS1_SHOWCONFLICTSTATE="yes"
export GIT_PS1_DESCRIBE_STYLE="branch"
PROMPT_COMMAND='timer_stop'
PS1='\[\033[1;31m\][${timer_show}] \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[35m\]\w\[\033[m\]\[\033[36m\]$(__git_ps1 " (%s)")\[\033[00m\] \n$ '

bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
set -o vi
bind -m vi-insert "\C-l":clear-screen
bind '"hh":vi-movement-mode'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export LIBGPHOTO2_INSTALL_PATH=$HOME/.local

shopt -s cdspell

fortune | cowsay -f tux

export PATH="${PATH}:/home/omsi/Programs/nvim-0.11.5/bin"
export PATH="${PATH}:/home/omsi/Programs/ripgrep-14.1.1-x86_64-unknown-linux-musl/"
# I did not run make install on that, maybe worth doing at some point later.
export PATH="${PATH}:/home/omsi/Programs/gettext-0.25/gettext-tools/src/"
export PATH="/home/omsi/Programs/:${PATH}"
export PATH="/home/omsi/Programs/jdk-24.0.1/bin/:${PATH}"
export PATH="${PATH}:/home/omsi/.cargo/bin"
alias knvim='NVIM_APPNAME="nvim-kickstart" nvim'
alias tvim='NVIM_APPNAME="nvim-v012" nvim'
alias nvim-ai='NVIM_APPNAME="nvim-copilot" nvim'
alias knvimf='NVIM_APPNAME="nvim-kickstart" nvim $(fzf)'

alias groot='cd "$(git rev-parse --show-toplevel)"'
alias groot2='groot ; cd .. ; groot'
alias groot3='groot ; cd .. ; groot ; cd .. ; groot'

export PATH="$HOME/.local/bin:$PATH"
export NOTES_DIR=/home/omsi/Projects/notes

# [ -f "$HOME/.fzf.bash" ] && source "$HOME/.fzf.bash"

# MANPATH is being later on overridden by CHEN scripts - so instead of fighting
# with this script, simply override the `man` command to prefix it with my own
# manpath
man() {
    MANPATH="$MY_MANPATH:$MANPATH" command man "$@"
}

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" "\e[\${value};...;\${value}m"
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

eval $(ssh-agent -s) >/dev/null
ssh-add $HOME/.ssh/id_rsa >/dev/null 2>/dev/null
ssh-add $HOME/.ssh/id_ed25519 >/dev/null 2>/dev/null

eval $(oh-my-posh init bash --config ~/.config/personal/oh-my-posh.json)

# vim: ft=bash
