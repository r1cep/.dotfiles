# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# History Options
#
# Don't put duplicate lines in the history.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
#
# Ignore some controlling instructions
# HISTIGNORE is a colon-delimited list of patterns which should be excluded.
# The '&' is a special pattern which suppresses duplicate entries.
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit'
# export HISTIGNORE=$'[ \t]*:&:[fb]g:exit:ls' # Ignore the ls command as well
#
# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"

# Aliases
#
# Some people use a different file for aliases
# if [ -f "${HOME}/.bash_aliases" ]; then
#   source "${HOME}/.bash_aliases"
# fi

# User specific aliases and functions
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto --show-control-chars'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# Interactive operation...
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
if type 'colordiff' > /dev/null 2>&1; then
    alias diff='colordiff -u'
else
    alias diff='diff -u'
fi

# Umask
#
# /etc/profile sets 022, removing write perms to group + others.
# Set a more restrictive umask: i.e. no exec perms for others:
# umask 027
# Paranoid: neither group nor others have any perms:
# umask 077

# Git settings
#
# Git prompt settings.
gitps1=":"
if [ -f "${HOME}/.dotfiles/bin/git-prompt.sh" ]; then
    source "${HOME}/.dotfiles/bin/git-prompt.sh"
    gitps1="__git_ps1"
    GIT_PS1_SHOWDIRTYSTATE=true
    GIT_PS1_SHOWUNTRACKEDFILES=true
    GIT_PS1_SHOWSTASHSTATE=true
    GIT_PS1_SHOWUPSTREAM=auto
fi
#
# Git completion settings.
if [ -f "${HOME}/.dotfiles/bin/git-completion.bash" ]; then
    source "${HOME}/.dotfiles/bin/git-completion.bash"
fi

# gh completion settings.
if type "gh" > /dev/null 2>&1
then
    eval "$(gh completion -s bash)"
fi

# https://hackmd.io/@badging/wsl2#Troubleshooting-PATH
#PATH=$(echo "$PATH" | sed -e 's/:\/mnt.*//g')

# .bashrc for interactive terminal
[ -z "$PS1" ] && return
#export TERM=xterm-256color

# .bashrc PS1 custom view
PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[35m\]$MSYSTEM\[\e[0m\] \[\e[33m\]\w\[\e[35m\]$(${gitps1})'$'\n\[\e[0m\]$ '

# Genie settings
if [[ ! -v INSIDE_GENIE ]]; then
    exec /usr/bin/genie -s
fi

# fish settings
exec fish
