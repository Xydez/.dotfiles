function clearh --description 'clears the screen and the history buffer'
  printf '\033[2J\033[3J\033[1;1H'
end
