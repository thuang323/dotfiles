# Define the directories to exclude in an array
EXCLUDE_DIRS=('*/.git' '*/.undodir' '*/node_modules' '*/.next')

EXCLUDE_ARGS=()
for dir in "${EXCLUDE_DIRS[@]}"; do
  EXCLUDE_ARGS+=(-path "$dir" -o)
done

if [[ $HOME = "/Users/taylorhuang" ]]; then
  dir_name=$({
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
    # find ~/dotfiles -mindepth 1 -maxdepth 3 -type d \( "${EXCLUDE_ARGS[@]:0:${#EXCLUDE_ARGS[@]}-1}" \) -prune -o -type d -print;
  } | fzf --height=90%)
else
  dir_name=$({
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
  } | fzf --height=90%)
fi


if [[ -z $dir_name ]]; then
  return
fi

cd "$dir_name"
