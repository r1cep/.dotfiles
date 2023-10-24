# XDG Base Directory Specification
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"

# Editor
set -gx EDITOR nvim

## Neovim
abbr -a vim "nvim"
abbr -a vimdiff "nvim -d "

# Aliaces
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias sed="gsed"

## History
abbr -a history " history --show-time='%Y-%m-%d %T '"

# fzf
set -gx FZF_LEGACY_KEYBINDINGS 0

# Volta
set -gx VOLTA_HOME "$XDG_DATA_HOME/volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# Homebrew
if test -f /opt/homebrew/bin/brew; and status is-interactive
    fish_add_path /opt/homebrew/bin
    eval (/opt/homebrew/bin/brew shellenv)
end

# ghq
set -gx GHQ_ROOT "$XDG_DATA_HOME/ghq"

# Rust
set -gx RUSTUP_HOME "$XDG_DATA_HOME/rustup"
set -gx CARGO_HOME "$XDG_DATA_HOME/cargo"
set -gx PATH "$CARGO_HOME/bin" $PATH

# Rust utilities
#abbr -a cat "bat"
#abbr -a ls "exa"
#abbr -a find "fd"
#abbr -a ps "procs"
#abbr -a grep "rg"
#abbr -a sed "sd"

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/fish/__tabtab.fish ]; and . ~/.config/tabtab/fish/__tabtab.fish; or true

# Starship
set -gx STARSHIP_CONFIG "$XDG_CONFIG_HOME/starship/starship.toml"
set -gx STARSHIP_CACHE "$XDG_CACHE_HOME/starship"
starship init fish | source
