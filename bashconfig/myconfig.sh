# This file must be: /etc/profile.d/myconfig.sh
# Must be sourced from .bashrc

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

export JAVA_HOME='/usr/lib/jvm/java-8-openjdk-amd64'
export M2_HOME='/opt/apache-maven-3.6.3'
export M2=$M2_HOME/bin

PATH=$PATH:/usr/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/bin
PATH=$PATH:/sbin
PATH=$PATH:/snap/bin
PATH=$PATH:/$HOME/bin
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:/usr/games
PATH=$PATH:/usr/local/games
PATH=$PATH:$JAVA_HOME
PATH=$PATH:$M2

export PATH

if [ -f /etc/profile.d/bash_completion.sh ]; then
	source /etc/profile.d/bash_completion.sh
fi

alias ls='ls --color=auto'
alias ll='ls -alF --color=auto'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias cl='clear'
alias py='python3'
alias compose='docker-compose up -d'
alias proj='cd ~/Documents/PROJECTS/'
alias cheat='cd ~/Documents/PROJECTS/files_utilities/'
alias eclipse='~/eclipse/java-2020-09/eclipse/eclipse </dev/null &>/dev/null &'
alias opendir='xdg-open'
