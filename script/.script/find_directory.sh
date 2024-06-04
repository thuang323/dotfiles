dir_name=$({
  echo ~/;
  find ~/Purdue -type d;
  find ~/resume -type d;
  find ~/coding -type d;
  find ~/dotfiles -type d;
  find ~/Notes -type d;
} | fzf --height=90%)


if [[ -z $dir_name ]]; then
  exit 0
fi

cd "$dir_name"
