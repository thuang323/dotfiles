#!/bin/bash

# Define the directories to exclude in an array
EXCLUDE_DIRS=('*/.git' '*/.undodir' '*/node_modules' '*/.next')

EXCLUDE_ARGS=()
for dir in "${EXCLUDE_DIRS[@]}"; do
  EXCLUDE_ARGS+=(-path "$dir" -o)
done


if [[ $# -eq 1 ]]; then
    selected=$1
else
  selected=$({
    echo ~/;
    echo ~/Downloads/;
    echo ~/Desktop/;
    echo ~/resume/;
    echo ~/dotfiles/;
    echo ~/test/;
    find ~/Purdue -maxdepth 3 -type d;
    # find ~/coding -maxdepth 2 -type d;
    # find ~/dotfiles -mindepth 1 -maxdepth 3 -type d;
    find ~/coding -maxdepth 2 -type d \( "${EXCLUDE_ARGS[@]:0:${#EXCLUDE_ARGS[@]}-1}" \) -prune -o -type d -print;
    find ~/dotfiles -mindepth 1 -maxdepth 3 -type d \( "${EXCLUDE_ARGS[@]:0:${#EXCLUDE_ARGS[@]}-1}" \) -prune -o -type d -print;
  } | fzf)
fi

if [[ -z $selected ]]; then
  if [[ -z $TMUX ]]; then
    return
  else
    exit 0
  fi
fi

selected_name=$(basename "$selected" | tr . _)
selected_name=$(echo "$selected_name" | tr ' ' '_')
tmux_running=$(pgrep tmux)

if [[ $selected_name = "taylorhuang" ]]; then
  selected_name="home"
fi

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s "$selected_name" -c "$selected"
  if [[ -z $tmux_running ]]; then
    return
  else
    exit 0
  fi
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected"
fi

tmux switch-client -t "$selected_name"
