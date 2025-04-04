#!/bin/sh

# This file must be in: /etc/profile.d/
# Must be sourced from ~/.bashrc

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

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# Set vi as the default editor for all apps that check this.
# N.B: do not use set -o vi, it breaks the console hotkeys!
export EDITOR=vi

#export JAVA_HOME='/usr/lib/jvm/java-17-openjdk-amd64'
#export M2_HOME='/opt/apache-maven-3.6.3'
#export M2=$M2_HOME/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/OpenBLAS/lib/

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
#PATH=$PATH:/usr/local/go/bin
#PATH=$PATH:$JAVA_HOME
#PATH=$PATH:$M2
#PATH=$PATH:$HOME/.cargo/bin
#PATH=$PATH:$HOME/.nimble/bin
export PATH

alias l='ls -CF --color=auto --group-directories-first'
alias ls='ls --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -Alh --color=auto --group-directories-first'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias vi='vim'
alias cl='clear'
alias py='python3'
alias smallhash='md5sum'

alias trash-list='gio list trash://'
alias resetFilesPerm='find . -type d -exec chmod 0755 {} \; && find . -type f -exec chmod 0644 {} \;'
alias clear_history="cat /dev/null > ~/.bash_history && history -c && exit"

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
alias yt-dlp-mp3='yt-dlp -x --embed-thumbnail --audio-format mp3'

# Specific to my system:
alias cheat='cd ~/git/files_utilities/'
alias texx='cd ~/git/TeXdrawer/'
alias vect='cd ~/git/vect_bench/'
alias bench='sh ~/git/vect_bench/benchmark.sh'
alias markd='open ~/git/markdown-editor/index.html'
alias updateConfig='sudo cp ~/git/files_utilities/bashconfig/myconfig.sh /etc/profile.d/ && . ~/.bashrc'
alias classify='hwrt serve'
# alias eclipse='~/eclipse/java-2020-09/eclipse/eclipse </dev/null &>/dev/null &'

# Forcing 'du' to sort its outputs in a readable fashion:
du() {
	if [ $# -eq 0 ]; then
		command du -h . | sort -h
	else
		command du -h $1 | sort -h
	fi
}

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

# Prints the size of a remote file without downloading it:
checksize() {
	foundSizes=$(curl -s -L -I $1 | grep -i "Content-Length" | cut -d ' ' -f2 | tr -d '\r')
	if [ -z "$foundSizes" ]; then
		echo "Remote file not found."
		return
	fi
	for bytesize in $foundSizes; do
		if [ "$bytesize" -ne 0 ]; then
			echo "$bytesize" | numfmt --to="iec" --suffix="iB" --format="Size: %.1f"
		fi
	done
}

# Useful to convert an image format to another, supporting jpg, png, bmp, webp...
convertimage() {
	ffmpeg -loglevel error -y -i $1 $2
}

# Creates a directory and goes inside:
mkdin() {
	mkdir $1 && cd $1
}

# Note to unset a function, use: unset -f functioname
