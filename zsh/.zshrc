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


# User configuration
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


export PATH="/usr/local/opt/openjdk/bin:$PATH"
export DBUS_SESSION_BUS_ADDRESS='unix:path='$DBUS_LAUNCHD_SESSION_BUS_SOCKET
export PATH=/usr/local/anaconda3/bin:$PATH


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"

# my alias
alias ff="source ~/.script/find_files.sh"  # find my target files under home in specific directory
alias fuf="source ~/.script/find_under_files.sh"  # find all files under current directory
alias fd="source ~/.script/find_directory.sh"  # find all directory under home in specific directory
alias fud="source ~/.script/find_under_directory.sh"  # find all directory under current directory
alias initgradle="~/.script/init_gradle.sh"
alias vi="nvim"
alias g++="g++-13"
alias gcc="gcc-13"
alias clang++="clang++ --std=c++20" 
alias ta="tmux attach"
alias tn="tmux new"
alias tls="tmux ls"
alias ts="source ~/.script/tmux/tmux_sessionizer.sh"


# python environment
alias python="python3"
alias pip="pip3"
alias lsconda="conda env list"
alias rmconda="source ~/.script/rmconda.sh"
alias initconda="source ~/.script/initconda.sh"
# >>> conda initialize >>>
#
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

