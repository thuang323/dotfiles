# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
zstyle ':omz:update' mode auto      # update automatically without asking

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 90

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# toggleterm autosuggestions fg color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#7b8496"


# increase history size
export HISTSIZE=20000
export SAVEHIST=20000

# User configuration
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export EDITOR=nvim

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)
eval "$(starship init zsh)"

# my alias
alias sf="source ~/.script/find_files.sh"  # find my target files under home in specific directory
alias suf="source ~/.script/find_under_files.sh"  # find all files under current directory
alias sd="source ~/.script/find_directory.sh"  # find all directory under home in specific directory
alias sud="source ~/.script/find_under_directory.sh"  # find all directory under current directory
alias vi="nvim"
alias g++="g++-13"
alias gcc="gcc-13"
alias clang++="clang++ --std=c++20" 
alias ta="tmux attach"
alias tn="tmux new"
alias tls="tmux ls"
alias ts="~/.script/tmux/tmux_sessionizer.sh"
alias install_sketchybar="~/.script/install_sketchybar.sh"

# conda alias
alias lsconda="conda env list"
alias rmconda="source ~/.script/rmconda.sh"
alias initconda="source ~/.script/initconda.sh"

# school alias
alias cs381_template="~/.script/school/cs381_template.sh"
alias cs361_template="~/.script/school/cs361_template.sh"


# ssh
function ssh_data()
{
    export TERM="xterm-256color"
    ssh huan1840@data.cs.purdue.edu
}


function ssh_xinu()
{
    export TERM="xterm-256color"
    ssh huan1840@xinu18.cs.purdue.edu
}

function ssh_scholar()
{
    export TERM="xterm-256color"
    ssh huan1840@scholar.rcac.purdue.edu
}

function ssh_pod()
{
    export TERM="xterm-256color"
    ssh huan1840@pod0-0.cs.purdue.edu
}

function ssh_426()
{
    export TERM="xterm-256color"
    ssh -p 2222 cs426@127.0.0.1
}
