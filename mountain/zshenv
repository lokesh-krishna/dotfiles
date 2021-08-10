# Defines environment variables.

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

# User environment variables
# XDG Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Editor and viewers
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

# Make QT use Wayland
export QT_QPA_PLATFORM=wayland
export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"

# etesync-dav 
export ETESYNC_URL=https://low-key.me:9000

# FZF settings
export FZF_DEFAULT_OPTS='
    --exact
    --reverse
    --border=rounded
    --cycle
    --height=50%
    --info=hidden
    --prompt=❯\ 
    --pointer=➜
    --color=16
    --color=bg:-1,bg+:5
    --color=fg:-1,fg+:0
    --color=hl:5,hl+:0
    --color=prompt:2
    --color=pointer:5
    --color=gutter:-1
    --color=marker:11
    --color=spinner:6
    --color=border:8'

# Buku colors
export BUKU_COLORS='hMhhK'

# pfetch information 
export PF_INFO="ascii title os kernel uptime pkgs memory editor palette"

# Prevent loading ranger's config twice
export RANGER_LOAD_DEFAULT_RC="FALSE"
