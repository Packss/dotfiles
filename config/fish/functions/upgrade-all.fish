function upgrade-all --wraps='pacman -Syu' --wraps='sudo pacman -Syu' --description 'alias upgrade-all=sudo pacman -Syu'
  sudo pacman -Syu $argv; 
end
