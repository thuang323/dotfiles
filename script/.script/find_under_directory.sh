dir_name=$({
  find $PWD -type d;
} | fzf --height=90%)

if [[ -z $dir_name ]]; then
  exit 0
fi

cd "$dir_name"
