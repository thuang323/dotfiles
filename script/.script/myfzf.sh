return_search_file=$({
               find ~/Downloads -type f;
               find ~/Documents -type f;
               find ~/Purdue\ University -type f;
               find ~/Desktop -type f;
               find ~/coding -type f;
               find ~/.dotfiles -type f;
             } | fzf --height=90%)

if [ -z $return_search_file ] # check if the file name is an empty string, such as, ctrl-c will cause an empty string
then
  return
fi


dir_name=$(dirname $return_search_file) # get the directory name of the found file

if [ -d $dir_name ]  # checking if it is not a valid directory name
then
  cd $dir_name
else
  return
fi
