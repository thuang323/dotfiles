file_name=$({
  find $PWD -type f;
} | fzf --height=90%)

if [[ -z $file_name ]] # check if the file name is an empty string, such as, ctrl-c will cause an empty string
then
  return
fi


dir_name=$(dirname $file_name) # get the directory name of the found file

if [[ -d $dir_name ]]  # checking if it is not a valid directory name
then
  cd $dir_name
else
  return
fi
