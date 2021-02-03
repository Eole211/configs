# Defined in - @ line 1
function gbr --wraps='git branch --sort=-committerdate' --description 'alias gbr=git branch --sort=-committerdate'
  git branch --sort=-committerdate $argv;
end
