dir_name=$({
  echo ~/;
  echo ~/Downloads/;
  echo ~/Desktop/;
  echo ~/resume/;
  find ~/Purdue -type d;
  find ~/coding -type d;
  find ~/dotfiles -type d;
  find ~/Notes -type d;
} | fzf --height=90%)


if [[ -z $dir_name ]]; then
  return
fi

cd "$dir_name"
