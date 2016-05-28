
# checks the remote status of all submodules under the current directory
# outputs the names of the submodules that have remote changes
function gitremstat() {
  echo 'Checking remote status (all submodules)' 
  git remote update 
  git submodule foreach git status | egrep "behind|diverged" -B 3 | grep Entering | sed 's/Entering /Remote changes:/'
}

# pushes all commits under the current directory (main module, and all submodules)
function gitpushrec() {
  git push --recurse-submodules=on-demand
}

# pulls in the changes in a local submodule (pass name as argument)
function gitsubpull() {
  if [ -z "$1" ]; then
    echo "Please provide a submodule name" 
  elif [ ! -d "$1" ]; then
    echo "Not a local directory: $1"
  else
    cd $1
    git pull	
    cd ..
  fi
}
