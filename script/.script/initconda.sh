# usage 
if [[ $# -ne 2 ]]; then
  echo "usage: initconda [env_name] [python_version]"
  return
fi

conda create -y -n "$1" python="$2"
