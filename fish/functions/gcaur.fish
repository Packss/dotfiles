function gcaur --wraps='git clone https://aur.archlinux.org/' --description 'alias gcaur=git clone https://aur.archlinux.org/'
  git clone "https://aur.archlinux.org/$argv[1]"        
end
