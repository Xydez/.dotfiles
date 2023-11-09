function ssh --wraps '/bin/ssh' --description 'alias ssh=\'TERM=xterm-256color /bin/ssh\''
  TERM=xterm-256color /bin/ssh $argv
end
