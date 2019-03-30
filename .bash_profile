# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

if [ -d "${HOME}/bin" ] ; then
  PATH="${PATH}:${HOME}/bin"
  PATH="${PATH}:/usr/lib/ssh"
fi

# history settings
HISTSIZE=10000
HISTTIMEFORMAT='%Y-%m-%d %T '

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi
