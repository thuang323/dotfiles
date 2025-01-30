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

xinu_start() {
xinu_connect() {
    machine=$1
    expected_output="connection '$machine', class 'quark', host 'xinuserver.cs.purdue.edu'"
    
    expect -c "
    set timeout 60
    # exp_internal 1
    spawn cs-console $machine
    expect \"$expected_output\"

    send \"\x00\"
    expect \"(command-mode) \"
    send \"d\"
    expect \"file: \"
    send \"xinu.xbin\r\"

    expect  \"cp-download complete\r\n\r\n\r\"
    sleep 1
    send \"\x00\"
    expect \"(command-mode) \"
    send \"p\"
    expect \"boot menu options.\r\n\"
    send \"\r\"

    interact
  "
}

status_output=$(cs-status -c quark)

for i in {185..195}; do
    machine="galileo$i"

    if echo "$status_output" | grep -qE "$machine.*user= +time"; then
        echo "$machine is free, attempting to connect..."
        xinu_connect "$machine"
        break;
    else
        echo "$machine is occupied or not available."
    fi
done
}
