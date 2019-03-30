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
alias ls='ls --color=auto --show-control-chars'
alias ll='ls -l'
alias l='ls -CF'

# Interactive operation...
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# Misc :)
alias less='less -r'                          # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in colour
alias egrep='egrep --color=auto'              # show differences in colour
alias fgrep='fgrep --color=auto'              # show differences in colour
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

# .bashrc for interactive terminal
[ -z "$PS1" ] && return
#export TERM=xterm-256color
printf "\033k$(hostname)\033\\"

# .bashrc PS1 custom view
PS1='\[\e]0;\w\a\]\n\[\e[32m\]\u@\h \[\e[35m\]$MSYSTEM\[\e[0m\] \[\e[33m\]\w\[\e[35m\]$(${gitps1})'$'\n\[\e[0m\]$ '

composer () {
    tty=
    tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --user $(id -u):$(id -g) \
        --volume /etc/passwd:/etc/passwd:ro \
        --volume /etc/group:/etc/group:ro \
        --volume $(pwd):/app \
        composer "$@"
}

vue () {
    tty=
    tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --volume /etc/passwd:/etc/passwd:ro \
        --volume /etc/group:/etc/group:ro \
        --volume "$HOME":"$HOME" \
        --volume "$PWD":/app \
        --user "$(id -u):$(id -g)" \
        vue-cli \
        vue "$@"
}

yarn () {
    tty=
    tty -s && tty=--tty
    docker run \
        $tty \
        --interactive \
        --rm \
        --volume /etc/passwd:/etc/passwd:ro \
        --volume /etc/group:/etc/group:ro \
        --volume "$HOME":"$HOME" \
        --volume "$PWD":/app \
        --user "$(id -u):$(id -g)" \
        vue-cli \
        yarn "$@"
}
