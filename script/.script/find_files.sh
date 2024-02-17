find_file=$({
               # find ~/Downloads -type f;
               # find ~/Documents -type f;
               find ~/Purdue -type f;
               find ~/Desktop -type f;
               find ~/coding -type f;
               find ~/dotfiles -type f;
               find ~/Notes -type f;
             } | fzf --height=90%)

if [[ -z $find_file ]]; then # check if the file name is an empty string, such as, ctrl-c will cause an empty string
  return
fi


dir_name=$(dirname $find_file) # get the directory name of the found file

if [[ -d $dir_name ]]; then  # checking if it is not a valid directory name
  cd ~
  cd $dir_name
else
  return
fi
