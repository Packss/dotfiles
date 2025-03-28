# If you come from bash you might have to change your $PATH.
export PATH=$HOME/intelFPGA_lite/20.1/modelsim_ase/bin:$HOME/intelFPGA_lite/20.1/quartus/bin/:$HOME/.local/bin:/usr/local/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bira"
zstyle :omz:plugins:eza icons 'true'
zstyle :omz:plugins:eza dirs-first 'true'

plugins=(
    git
    archlinux
    zsh-autosuggestions
    #zsh-autocomplete
    #zsh-completions
    zsh-syntax-highlighting
    zsh-interactive-cd
    eza
    command-not-found
    z
)

source $ZSH/oh-my-zsh.sh

# Check archlinux plugin commands here
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/archlinux

# Display Pokemon-colorscripts
# Project page: https://gitlab.com/phoneybadger/pokemon-colorscripts#on-other-distros-and-macos
pokemon-colorscripts --no-title -r

# fastfetch. Will be disabled if above colorscript was chosen to install
#fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

# Set-up icons for files/folders in terminal
#alias ls='eza -a --icons'
#alias ll='eza -al --icons'
#alias lt='eza -a --tree --level=1 --icons'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)
source $HOME/.config/zshfuncs.zshrc

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

export QSYS_ROOTDIR="/home/enzo/intelFPGA_lite/23.1std/quartus/sopc_builder/bin"
