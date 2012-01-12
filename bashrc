# .bashrc

# User specific aliases and functions

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias grep='grep --color=auto'
alias ls='ls --color=auto -Fh'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='$HOME/local/bin/vim'
alias screen='$HOME/local/bin/tscreen -U'

#export PATH=$PATH:/home/hattori/local/bin
export PATH=$HOME/local/bin:$PATH
export PHPRC=$HOME/local/php.ini-gopear
export LANG=ja_JP.UTF8
umask 000

# svn setting
export SVN_EDITOR="vi"
