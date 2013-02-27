# zsh config dir
Z=~/.zsh/

# oh-my-zsh configurations
ZSH=$Z/oh-my-zsh
ZSH_THEME="agnoster"
plugins=(git mercurial)
source $ZSH/oh-my-zsh.sh

# my configurations
source $Z/environment.zsh
source $Z/aliases.zsh
source $Z/functions.zsh
