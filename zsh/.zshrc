source ~/.zsh/setup.zsh
source ~/.zsh/environment.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/plug/zsh-histdb/sqlite-history.zsh
source ~/.zsh/themes/myfishy.zsh-theme

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ -n "${commands[fzf-share]}" ]; then
    FZF_SHARE="$(fzf-share)"
    source "${FZF_SHARE}/key-bindings.zsh"
    source "${FZF_SHARE}/completion.zsh"
fi

eval "$(direnv hook zsh)"

# unalias d

if test -f ${HOME}/.config/broot/launcher/bash/br; then
    source ${HOME}/.config/broot/launcher/bash/br
fi
