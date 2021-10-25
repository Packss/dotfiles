set fish_greeting
set -x EDITOR nano
set PATH $PATH:$HOME/.local/bin

function fish_title
	echo $argv[1]
end
