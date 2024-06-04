#!/bin/bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
  selected=$({
    echo ~/;
    find ~/Purdue -type d;
    find ~/resume -type d;
    find ~/coding -type d;
    find ~/dotfiles -type d;
    find ~/Notes -type d;
  } | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
selected_name=$(echo "$selected_name" | tr ' ' '_')
tmux_running=$(pgrep tmux)

if [[ $selected_name = "taylorhuang" ]]; then
  selected_name="home"
fi

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s "$selected_name" -c "$selected"
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected"
fi

tmux switch-client -t "$selected_name"
