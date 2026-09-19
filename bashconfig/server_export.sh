#!/bin/sh

# This file must be in: /etc/profile.d/
# And then be sourced from ~/.bashrc

# To clear all previously defined aliases:
unalias -a

# To clear a previously defined function:
# unset -f broken_function

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f /etc/profile.d/bash_completion.sh ]; then
	source /etc/profile.d/bash_completion.sh
fi

# Load default uv completion
if command -v uv &>/dev/null; then
	eval "$(uv generate-shell-completion bash 2>/dev/null)"
fi

##########################################
# General aliases, suitable for export:

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Setting the locale. This sorts better (e.g. w/ ls) than LC_ALL=C:
export LC_ALL=en_GB.utf8

# Set vi as the default editor for all apps that check this.
# N.B: do not use set -o vi, it breaks the console hotkeys!
export EDITOR=vi

alias l='ls -CF --color=auto --group-directories-first'
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -Alh --color=auto --group-directories-first'

alias grep='grep --color=auto'

alias vi='vim'
alias cl='clear'
alias py='python3'
alias bat='batcat -p'
alias smallhash='md5sum'
alias realpath='command realpath -e'
alias clear_history="cat /dev/null > ~/.bash_history && history -c && exit"

##########################################
# Docker aliases:

alias dc='sudo docker-compose'
alias composeup='sudo docker-compose up -d'
alias dockershow='sudo docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias dockerrestart='sudo systemctl restart docker'
alias cleancontainers='sudo docker rm -f $(sudo docker ps -aq)'
alias cleanimages='sudo docker rmi -f $(sudo docker images -aq --filter "dangling=true" --no-trunc)'
alias dockercleanup='sudo docker system prune'

##########################################
# General functions, suitable for export:

_dir() {
	if [ $# -eq 0 ]; then echo "."; else echo "$@"; fi
}

# Creates a directory and goes inside:
mkdin() {
	mkdir "$1" && cd "$1"
}

# Forcing 'du' to sort its outputs in a readable fashion:
du() {
	command du -h "$(_dir $1)" | sort -h
}

# Activating a Python virtual env:
complete -d activate # set completion for directories.
activate() {
	if [ $# -le 1 ]; then venv=".venv"; else venv="$2"; fi
	. "$(_dir $1)/$venv/bin/activate"
}

# Setting files and directories to standard permission levels:
resetFilesPerm() {
	find "$(_dir $1)" -type d -exec chmod 0755 {} \; && find "$(_dir $1)" -type f -exec chmod 0644 {} \;
}

# Printing a json file with color:
jsonprint() { # needs the jq package.
	if [ ! -f "$1" ]; then # file exist check
		echo "'$1': No such file"
	elif [ ! -z "$1" ]; then
		jq -C "." "$1" | less -R
	fi
}

complete -f cdiff # set completion for filenames.
cdiff() { # needs the colordiff package.
	if [ $# -ne 2 ]; then
		echo "Please provide 2 valid files to compare."
	elif [ ! -f "$1" ]; then # file exist check
		echo "'$1': No such file"
	elif [ ! -f "$2" ]; then
		echo "'$2': No such file"
	else
		h1=$(sha256sum "$1" | cut -d' ' -f1) # hash w/o filename
		h2=$(sha256sum "$2" | cut -d' ' -f1)
		if [ "$h1" = "$h2" ]; then # string equality check (POSIX compliant)
			echo "Identical files."
		else
			diff -u -r "$1" "$2" | colordiff | less -R
			# wdiff -n "$1" "$2" | colordiff | less -R
		fi
	fi
}

# Note to unset a function, use: unset -f <function_name>
