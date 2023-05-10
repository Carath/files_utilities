#!/bin/sh

# This file must be in: /etc/profile.d/
# Must be sourced from ~/.bashrc

# To clear all previously defined aliases:
unalias -a

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f /etc/profile.d/bash_completion.sh ]; then
	source /etc/profile.d/bash_completion.sh
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64'
export M2_HOME='/opt/apache-maven-3.6.3'
export M2=$M2_HOME/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/OpenBLAS/lib/

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

PATH=
PATH=$PATH:/bin
PATH=$PATH:/sbin
PATH=$PATH:/snap/bin
PATH=$PATH:/usr/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/usr/games
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/local/games
PATH=$PATH:$HOME/bin
PATH=$PATH:$HOME/.local/bin
# Custom:
PATH=$PATH:/usr/local/go/bin
PATH=$PATH:$JAVA_HOME
PATH=$PATH:$M2
PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:$HOME/.nimble/bin
export PATH

alias l='ls -CF --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -Alh --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias vi='vim'
alias cl='clear'
alias py='python3'

alias trash-list='gio list trash://'
alias resetFilesPerm='find . -type d -exec chmod 0755 {} \; && find . -type f -exec chmod 0644 {} \;'

# Docker:
alias dc='sudo docker-compose'
alias composeup='sudo docker-compose up -d'
alias dockershow='sudo docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"'
alias dockerrestart='sudo systemctl restart docker'
alias cleancontainers='sudo docker rm -f $(sudo docker ps -aq)'
alias cleanimages='sudo docker rmi -f $(sudo docker images -aq --filter "dangling=true" --no-trunc)'
alias dockercleanup='sudo docker system prune'

# WSL:
alias wslcleanup='find . -name "*Zone.Identifier" -type f -delete'

# User packages:
alias calc='qalc'
alias calculate='qalculate'
alias bat='batcat -p'

# Specific to my system:
alias cheat='cd ~/git/files_utilities/'
alias mdview="open ~/git/markdown-editor/index.html"
alias eclipse='~/eclipse/java-2020-09/eclipse/eclipse </dev/null &>/dev/null &'
alias classify='hwrt serve'
alias texx='cd ~/git/TeXdrawer/'
alias vect='cd ~/git/vect_bench/'
alias bench='sh ~/git/vect_bench/benchmark.sh'

# Asking yes/no confirmation:
_confirm() {
	read -p "Continue (y/n)? " answer
	firstChar=$(expr substr $answer 1 1)
	firstChar=$(echo "$firstChar" | sed -e 's/\(.*\)/\L\1/') # to lowercase
	if [ "$firstChar" = "y" ]; then
		return "1"
	fi
	return "0"
}

# Emptying the trash:
trash-empty() {
	_confirm
	retval=$?
	if [ "$retval" -eq 1 ]; then
		gio trash --empty
		echo "Trash emptied."
	fi
}

# Moving files to the trash.
rm() {
	for arg in $@; do
		firstChar=$(expr substr $arg 1 1)
		if [ "$firstChar" != "-" ]; then
			if [ ! -e $arg ]; then
				echo "Cannot remove '$arg': No such file or directory"
			fi
			gio trash -f $arg
		fi
	done
}

_open() {
	if [ -e $1 ]; then
		gio open $1 >/dev/null 2>&1
	else
		echo "open: cannot access '$1': No such file or directory"
	fi
}

# Opens files or directories:
open() {
	if [ $# -eq 0 ]; then
		_open .
	fi
	for arg in $@; do
		_open $arg
	done
}

rmwindowscarriagereturn() {
	for arg in $@; do
		sed -i "s/\r$//g" $arg
	done
}

# Removes Windows carriage returns and non utf-8 symbols.
# This also resets files permission to default values.
cleanfile() {
	for arg in $@; do
		if [ -e $arg ]; then
			if [ -d $arg ]; then
				echo "Cannot process the input '$arg': Is a directory"
			else
				sed -i "s/\r$//g" $arg
				iconv -f utf-8 -t utf-8 -c $arg > "$arg"_temp
				mv "$arg"_temp $arg
			fi
		else
			echo "'$arg': No such file"
		fi
	done
}

# Printing a json file with color, using jq:
jsonprint() {
	if [ ! -e $1 ]; then
		echo "'$1': No such file or directory"
	elif [ ! -z "$1" ]; then
		jq -C "." $1 | less -R
	fi
}
