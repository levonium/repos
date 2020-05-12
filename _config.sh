# The repositories directory
REPOSITORIES_DIR=~/code/repos

# The repositories list
REPOSITORY_LIST=$REPOSITORIES_DIR/_list

# Include the directory in the PATH
export PATH=$REPOSITORIES_DIR:$PATH

# Register aliases
alias checkrepos="$REPOSITORIES_DIR/check.sh"
alias listrepos="$REPOSITORIES_DIR/list.sh"
alias addrepo="$REPOSITORIES_DIR/add.sh"
