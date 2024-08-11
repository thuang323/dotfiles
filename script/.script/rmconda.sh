# usage 
if [[ $# -ne 1 ]]; then
  echo "usage: rmconda [env_name]"
  return
fi

conda env remove -y -n "$1"
