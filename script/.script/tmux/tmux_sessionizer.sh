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
  if [[ $HOME = "/Users/taylorhuang" ]]; then
    selected=$({
      echo ~/;
      echo ~/Downloads/;
      echo ~/Desktop/;
      echo ~/resume/;
      echo ~/test/;
      echo ~/dotfiles/;
      echo ~/.config/nvim/;
      find ~/Purdue -maxdepth 3 -type d;
      find ~/coding -maxdepth 2 -type d \( "${EXCLUDE_ARGS[@]:0:${#EXCLUDE_ARGS[@]}-1}" \) -prune -o -type d -print;
      find ~/Notes/cs_notes -maxdepth 1 -type d;
      # find ~/coding -maxdepth 2 -type d;
      # find ~/dotfiles -mindepth 1 -maxdepth 3 -type d;
      # find ~/dotfiles -mindepth 1 -maxdepth 3 -type d \( "${EXCLUDE_ARGS[@]:0:${#EXCLUDE_ARGS[@]}-1}" \) -prune -o -type d -print;
    } | fzf)
  else
    selected=$({
      echo ~/;
      echo ~/Downloads/;
      echo ~/dotfiles/;
      echo ~/.config/nvim/;
      echo ~/cs240/;
      echo ~/cs250/;
      echo ~/cs252/;
      echo ~/cs373/;
      echo ~/cs408/;
      echo ~/cs440/;
      echo ~/cs354/;
    } | fzf)
  fi
fi

if [[ -z $selected ]]; then
  exit 0
fi

# selected_name=$(basename "$selected" | tr . _)
# get last two directories in path
# selected_name=$(basename "$(dirname "$selected")")/$(basename "$selected")
selected_name=$(basename "$selected")

if [[ $selected_name = "taylorhuang" ]]; then
  selected_name="home"
fi

# if tmux is not attached, create session or attach to session
if [[ -z $TMUX ]]; then
  tmux new-session -A -s "$selected_name" -c "$selected"

# if tmux is attached and session doesn't exist, create session
elif ! tmux has-session -t=$selected_name 2> /dev/null; then
  tmux new-session -ds "$selected_name" -c "$selected"
fi

# replace . with _ in selected_name
selected_name=${selected_name//./_}

# if tmux is attached, switch to session
tmux switch-client -t "$selected_name"
