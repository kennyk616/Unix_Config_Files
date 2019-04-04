
# enable programmable completion features
if [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi


# Git branch in prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# set prompt
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# set color for terminal
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad

# Avoid successive duplicates in bash command history
export HISTCONTROL=ignoredups

# Append commands to bash command history file (~/.bash_history)
shopt -s histappend

# colorize grep
if echo hello|grep --color=auto 1 >/dev/null 2>&1; then
	export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
fi

PROMPT_COMMAND='history -a'

export PATH=$PATH:$HOME/.npm-packages/bin


# Add bash aliases
if [ -f ~/.bash_alias ]; then
	source ~/.bash_alias
fi

eval "$(direnv hook bash)"

# virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh
