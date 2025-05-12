function ls --wraps='eza --icons' --description 'alias ls=eza --icons'
    if test -e /usr/bin/eza
        eza --icons $argv
    else
        /usr/bin/ls $argv
    end
end
