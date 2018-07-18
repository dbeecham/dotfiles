source ~/.zsh/zplug/init.zsh

zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"
zplug "urbainvaes/fzf-marks"
zplug "Tarrasch/zsh-functional"
zplug "zsh-users/zsh-autosuggestions"
zplug "ytet5uy4/fzf-widgets"

# this plugin is apparently pretty buggy - so I disabled it.
#zplug "chisui/zsh-nix-shell"

zplug "hcgraf/zsh-sudo"
zplug "clvv/fasd"
# antigen theme fishy

zplug load
