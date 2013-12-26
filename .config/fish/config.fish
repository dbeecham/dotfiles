set fish_greeting ""

function ls
	/bin/ls --color -F --group-directories-first $argv
end

function cd
	builtin cd $argv
	ls
end
