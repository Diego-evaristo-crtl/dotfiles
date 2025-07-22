#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#alias web='lynx -connect_timout=10 https://lite.duckduckgo.com/lite'

# modified by me
alias py='python'
alias vim='nvim'
export MANPAGER='nvim +Man!'
export HISTSIZE=10000

CWD_LAST2=""

# makes CWD_LAST2 the current directory's and it's parent's basename
# $1 should be the cwd
__get_cwdlast2() {
	if [[ "$1" = "$HOME" ]]; then
		CWD_LAST2="~"
		return 0;
	fi

	DIR2="$(basename $1)"
	DIR1="$(dirname $1)"
	if [[ "$DIR1" = "$HOME" ]];then
		DIR1="~"
	else
		DIR1="$(basename $DIR1)"
	fi
	
	if [[ "$DIR1" = "/" && "$DIR2" = "/" ]]; then
		CWD_LAST2="/"
	elif [[ "$DIR1" = "/" ]]; then
		CWD_LAST2="/$DIR2"
	else
		CWD_LAST2="$DIR1/$DIR2"
	fi
}

# called every time the prompt is to be displayed
export PROMPT_COMMAND=__prompt_command_func
__prompt_command_func() {
        # last command status code
        local STATUS="$?"
        PS1=""

        # colors
        local black="\[\033[0;30m\]"
        local red="\[\033[1;31m\]"
        local green="\[\033[1;32m\]"
        local brown="\[\033[0;33m\]"
        local blue="\[\033[0;34m\]"
        local purple="\[\033[0;35m\]"
        local cyan="\[\033[0;36m\]"
        local white="\[\033[0;37m\]"
 
        #decides how will prompt be displayed based on $STATUS and $PWD
	__get_cwdlast2 $(pwd)
	if [[ $STATUS -eq 0 ]]; then
		PS1="($green$STATUS$white) [$CWD_LAST2] \$ "
	else
		PS1="($red$STATUS$white) [$CWD_LAST2] \$ "
	fi

}

# enviroment variables
export DOTLINK_ROOT="$HOME/dotfiles"
export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/go/bin:$HOME/.cargo/bin"

# typos:
alias sl=" ls --color=auto"
alias ckear=" clear"
alias cçear=" clear"
alias got="git"
alias sudoi="sudo"
alias sudi="sudo"
alias nvum="nvim"
alias mktep=" mktemp"
