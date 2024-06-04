find_file=$({
  # find ~/Downloads -type f;
  # find ~/Documents -type f;
  find ~/Purdue -type f;
  find ~/Desktop -type f;
  find ~/coding -type f;
  find ~/dotfiles -type f;
  find ~/Notes -type f;
} | fzf --height=90%)

# check if the file name is an empty string, such as, ctrl-c will cause an empty string
if [[ -z $find_file ]]; then
  exit 0
fi


dir_name=$(dirname $find_file) # get the directory name of the found file

if [[ -d $dir_name ]]; then  # checking if it is not a valid directory name
  cd "$dir_name"
else
  exit 0
fi
