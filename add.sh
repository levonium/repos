source _config.sh

add_repository()
{
  git_dir=".git"

  if [ -d "$git_dir" ]; then

    cwd=`pwd`

    if [ `repository_exists_in_list $cwd` -gt 0 ]; then
      echo "❌ Directory is already in the list."
    else
      append_repository_to_list $cwd
    fi
  else

    echo "❌ Not a git repository."
  fi
}

# accepts the directory path => current working directory
# appends it to the list
append_repository_to_list()
{
  echo "$1" >> $REPOSITORY_LIST
  echo 👏  Repository added to repositories list - "$1"
}

# accepts the directory path => current working directory
# checks if it exists (1) in the list or not (0)
repository_exists_in_list()
{
  list=$REPOSITORY_LIST
  contents=`cat $list`

  if [[ $contents == *"$1"* ]]; then
    echo 1
  else
    echo 0
  fi
}

add_repository
