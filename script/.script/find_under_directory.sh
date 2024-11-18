# Define the directories to exclude in an array
EXCLUDE_DIRS=('*/.git' '*/.undodir' '*/node_modules' '*/.next')

EXCLUDE_ARGS=()
for dir in "${EXCLUDE_DIRS[@]}"; do
  EXCLUDE_ARGS+=(-path "$dir" -o)
done

dir_name=$({
  find $PWD -type d \( "${EXCLUDE_ARGS[@]:0:${#EXCLUDE_ARGS[@]}-1}" \) -prune -o -type d -print;
} | fzf --height=90%)

if [[ -z $dir_name ]]; then
  return
fi

cd "$dir_name"
