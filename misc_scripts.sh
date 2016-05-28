
# echo the passed argument in red color for better visibility
function echor() {
  echo -e "\x1B[1;31m$1\x1B[0m"
}

# outputs the biggest files/directories at the current path
function bigfiles() {
  echo
  du -sh * | gsort -h -r | head -n 10
  echo
}

# outputs the list of configured SSH hosts 
function ssh-list() {
  echo 'List of configured SSH hosts (~/.ssh/config):'
  cat ~/.ssh/config | grep 'Host '
}



