
# checks all submodules under the current directory for remote changes
function gitremstat() {
  echo 'Checking remote status (all local submodules)' 
  git remote update 
  git submodule foreach git status | egrep "behind|diverged" -B 3 | grep Entering | sed 's/Entering /Remote changes:/'
}

# checks all submodules under the current directory for "detached HEAD"
function gitdetscan() {
  echo 'Scanning for detached HEAD (all local submodules)'
  git submodule foreach git branch | grep "detached" -B1 | grep Entering | sed 's/Entering /Detached:/'
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
