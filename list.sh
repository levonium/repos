source _config.sh

# prints out the repositories list
list_repositories()
{
  count=0

  while read repo
  do
    ((count++))

    if [ $count -lt 10 ]; then
      echo $count ' -' $repo
    else
      echo $count '-' $repo
    fi

  done < $REPOSITORY_LIST
}

list_repositories
