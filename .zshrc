Z=~/.zsh/

source $Z/environment.zsh
source $Z/aliases.zsh
source $Z/functions.zsh

if (( C == 256 )); then
#   source $Z/ls_colors_256.zsh
    source $Z/prompt_256.zsh
elif (( C == 8 )); then
    source $Z/prompt_8.zsh
else
#   source $Z/prompt_default.zsh
fi
