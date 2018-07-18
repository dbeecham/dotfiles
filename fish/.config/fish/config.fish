set fish_greeting ""

set PATH $HOME/.nix-profile/bin $HOME/.nix-profile/sbin /usr/local/bin $HOME/.cabal/bin $PATH $HOME/bin/
set PATH /opt/ghc-mod/dist/build/ghc-mod /opt/ghc-mod/dist/build/ghc-modi/ $PATH 

set -x EDITOR /usr/bin/nvim

function chpwd --on-variable PWD
    status --is-command-substitution; and return
    ls
end

function fish_prompt --description "Write out the prompt"
	# Just calculate this once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_hostname
		set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
	end

    if test "$IN_NIX_SHELL" -eq 1
        printf "(nix) "
    end

	set -l color_cwd
	set -l suffix
	switch $USER
	case root toor
		if set -q fish_color_cwd_root
			set color_cwd $fish_color_cwd_root
		else
			set color_cwd $fish_color_cwd
		end
		set suffix '#'
	case '*'
		set color_cwd $fish_color_cwd
		set suffix '>'
	end

	echo -n -s "$USER" @ "$__fish_prompt_hostname" ' ' (set_color $color_cwd) (prompt_pwd) (set_color normal) "$suffix "
end

set -xU LESS_TERMCAP_mb (printf "\e[01;31m")      # begin blinking
set -xU LESS_TERMCAP_md (printf "\e[01;31m")      # begin bold
set -xU LESS_TERMCAP_me (printf "\e[0m")          # end mode
set -xU LESS_TERMCAP_se (printf "\e[0m")          # end standout-mode
set -xU LESS_TERMCAP_so (printf "\e[01;44;33m")   # begin standout-mode - info box
set -xU LESS_TERMCAP_ue (printf "\e[0m")          # end underline
set -xU LESS_TERMCAP_us (printf "\e[01;32m")      # begin underline

set -xg DARK (cat ~/.dark)

set -xg LOCALE_ARCHIVE /nix/store/4yhkx5xr14q3phjdqds3rhckrw4107xx-glibc-locales-2.21/lib/locale/locale-archive
set -xg NIX_PATH "nixpkgs=/home/dbe/.nix-defexpr/channels/nixpkgs"
set -xg SSL_CERT_FILE /etc/ssl/certs/ca-certificates.crt
