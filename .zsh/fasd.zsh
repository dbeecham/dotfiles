alias a='fasd -a'
alias s='fasd -si'
alias sd='fasd -sid'
alias sf='fasd -sif'
alias d='fasd -d'
alias f='fasd -f'
# function to execute built-in cd
fasd_cd() {
  if [ $# -le 1 ]; then
    fasd "$@"
  else
    local _fasd_ret="$(fasd -e 'printf %s' "$@")"
    [ -z "$_fasd_ret" ] && return
    [ -d "$_fasd_ret" ] && cd "$_fasd_ret" || printf %s\n "$_fasd_ret"
  fi
}
alias z='fasd_cd -d'
alias zz='fasd_cd -d -i'

# add zsh hook
_fasd_preexec() {
  { eval "fasd --proc $(fasd --sanitize $2)"; } >> "/dev/null" 2>&1
}
autoload -Uz add-zsh-hook
add-zsh-hook preexec _fasd_preexec

# zsh command mode completion
_fasd_zsh_cmd_complete() {
  local compl
  read -c compl
  (( $+compstate )) && compstate[insert]=menu # no expand if compsys loaded
  reply=(${(f)"$(fasd --complete "$compl")"})
}

# enable command mode completion
compctl -U -K _fasd_zsh_cmd_complete -V fasd -x 'C[-1,-*e],s[-]n[1,e]' -c - \
  'c[-1,-A][-1,-D]' -f -- fasd fasd_cd

