# Git status checker

Checks `git status` for all repositories defined in a list and displays the results if there are any local changes left.

This is useful when you work on multiple projects during the day and at the end want to check if all the changes are saved/committed/pushed.

```bash
# clone/copy this `repos` directory (e.g. ~/code)
cp -r repos ~/code

# if it's different than `~/code/repos` adjust it in `config.sh`
REPOSITORIES_DIR=~/code/repos

# create the list file
touch _list

# make 3 files executable
cd ~/code/repos
chmod +x add.sh check.sh list.sh

# include the `_config.sh` file into `.zshrc`
# it'll include the directory in PATH and register 3 aliases
source ~/code/repos/_config.sh

# add a directory/repository to the list
addrepo

# list all repositories
listrepos

# check statuses
checkrepos
```
