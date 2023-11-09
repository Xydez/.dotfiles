function todos --description 'find todos in the current project'
  rg -I 'TODO: [\w ]+' | sed 's/^.*TODO: \([A-ZÅÄÖa-zåäö ]\+\).*/- \1/g'
end
