# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

########################################
# General
########################################

# Integrate FZF with terminal color scheme
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
    --color=bg:-1,bg+:8
    --color=fg:-1,fg+:-1
    --color=hl:2,hl+:2
    --color=prompt:2
    --color=pointer:4
    --color=gutter:-1
    --color=marker:11
    --color=spinner:6
    --color=border:8'

# VI mode
bindkey -v

# Local scripts
path+=/home/loki/bin

# Python packages
path+=/home/loki/.local/bin


########################################
# Aliases
########################################

# Alias to add color to sdcv
alias sdcv='sdcv --color'

# Alias to sync using vdirsyncer
alias vs='vdirsyncer sync'

# Suffix aliases
alias -s md=nvim
alias -s png=imv
alias -s jpg=imv
alias -s gmi=nvim

########################################
# Color Man Pages
########################################
export LESS_TERMCAP_mb=$'\E[1;34m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;34m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;35m'    # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

########################################
# Syntax Highlighting
########################################

# Declaring the variable 
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=white,bold'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=white,bold'

# Setup fzf with keybindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Setup starship prompt
eval "$(starship init zsh)"
