# XDG Base Directory Specification
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"

# Editor
set -gx EDITOR nvim

# Aliaces
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

abbr -a history " history --show-time='%Y-%m-%d %T '"

# fzf
set -gx FZF_LEGACY_KEYBINDINGS 0

# Volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# Starship
set -gx STARSHIP_CONFIG "$XDG_CONFIG_HOME/starship/starship.toml"
set -gx STARSHIP_CACHE "$XDG_CACHE_HOME/.cache/starship"
starship init fish | source
