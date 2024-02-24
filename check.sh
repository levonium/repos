source _config.sh

# checks statuses for all repositories in the list
# and prints out the results
check_repositories()
{
  echo "Checking repositories list ..."
  echo ""

  up_to_date_repo_count=0
  not_up_to_date_repo_count=0

  while read repo
  do
    cd $repo

    status=`check_repository`

    if [ "$status" != "OK" ]; then
      echo "❌  $repo - \033[33;31m $status \033[33;00m"
      ((not_up_to_date_repo_count++))
    else
      ((up_to_date_repo_count++))
    fi
  done < $REPOSITORY_LIST

  print_results $up_to_date_repo_count $not_up_to_date_repo_count
}

# accepts up_to_date_repo_count and not_up_to_date_repo_count
# and prints out the results about counts
print_results()
{
  echo ""

  if [ $2 -eq 0 ]; then

    if [ $1 -eq 0 ]; then
      echo "💁  Repositories list is empty"
      return
    else
      echo "💁  All ($1) repositories are up to date"
    fi
  else

    echo "💁  In total:"

    if [ $2 -eq 1 ]; then
      echo "Only 1 repository has some local changes."
    else
      echo "$2 repositories have some local changes."
    fi

    echo "Up to date repositories: $1"
  fi

  echo "- run listrepos to see the list"
}

# checks repository status for each repo in the list
# and returns "OK" or "STATUS" if it's not up to date
check_repository()
{
  is_new_repository=`check_git_status "No commits yet"`
  has_local_changes=`check_git_status "ahead of"`
  has_untracked_files=`check_git_status "Untracked files"`
  has_unstaged_changes=`check_git_status "Changes not staged"`

  # remote_changes=`check_git_status "behind"`
  # up_to_date=`check_git_status "up to date"`

  if [ $is_new_repository -gt 0 ]; then
    echo "Heey, a new repository"
  elif [ $has_local_changes -gt 0 ]; then
    echo "This repo is ahead of its remote"
  elif [ $has_untracked_files -gt 0 ]; then
    echo "There are untracked files in this repo"
  elif [ $has_unstaged_changes -gt 0 ]; then
    echo "There are changes not staged in this repo"
  else
    echo "OK"
  fi
}

# accepts a string, status for repositories
#  and checks if it exists (1) in the output
# of running `git status` or not (0)
check_git_status()
{
  status=`git status | grep "$1"`

  # ${#status} will get the length of `status`
  if [ ${#status} -gt 0 ]; then
    echo 1
  else
    echo 0
  fi
}

check_repositories
