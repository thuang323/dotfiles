# for ssh usage

# this file is processed on each interactive invocation of bash

# avoid problems with scp -- don't process the rest of the file if non-interactive
[[ $- != *i* ]] && return

# increase history size
HISTSIZE=50000
HISTFILESIZE=50000


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# add to path
export EDITOR=nvim
export PATH="$HOME/usr/bin:$PATH"
export PATH=${PATH}:/p/xinu/bin

eval "$(starship init bash)"

# aliases
alias mail=mailx
alias vi="nvim"
alias ta="tmux attach"
alias tn="tmux new"
alias tls="tmux ls"
alias ts="~/.script/tmux/tmux_sessionizer.sh"
alias sd="source ~/.script/find_directory.sh"         # find all directory under home in specific directory
alias sud="source ~/.script/find_under_directory.sh"  # find all directory under current directory

