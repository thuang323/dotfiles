dir_name=$({
  find $PWD -type d;
} | fzf --height=90%)

if [[ -z $dir_name ]]; then
  return
fi

cd "$dir_name"
