#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

########################################
# Core
########################################

# Integrate FZF with terminal color scheme
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='
    --exact
    --reverse
    --no-bold
    --prompt=❯\ 
    --color=16
    --color=bg:-1,bg+:8
    --color=fg:-1,fg+:-1
    --color=hl:2,hl+:2
    --color=prompt:5
    --color=pointer:6
    --color=marker:11
    --color=spinner:6
    --color=info:6'

# Set neovim as my default text editor
export EDITOR=nvim

########################################
# Aliases
########################################

# Download videos as mp3
alias mp3='youtube-dl -x --audio-format=mp3' 

# Check if icon is available in Papirus
alias icon='ls /home/loki/.icons/Papirus/64x64/apps/ | grep' 

# Backup system
alias backup='rsync --archive --delete \
	~/.config \
	~/.gitconfig \
	~/.gnupg \
	~/.nanorc \
	~/.ncmpcpp \
	~/.password-store \
	~/.ssh \
	~/.task \
	~/.taskrc \
	~/.zprezto \
	~/.zshrc \
	~/Backups \
	~/bin \
	~/Documents \
	~/Downloads \
	~/Music \
	~/Sync \
	~/Pictures \
	/mnt/veracrypt1/'

# Open files with the .md extension automatically with Vim
alias -s md=nvim 

########################################
# Shell Functions
########################################

# Install/update Papirus
papirus-update () {
cd ~/Projects/papirus-icon-theme
git pull -q upstream master
rsync -av Papirus Papirus-Adapta ~/.icons/
cd
echo "Papirus has been updated!"
return
}

########################################
# Color Man Pages
########################################
export LESS_TERMCAP_mb=$'\E[1;34m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;34m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;36m'    # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
