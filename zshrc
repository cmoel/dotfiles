set_path () {
  orig_path=$PATH

  PATH="$HOME/.bin"
  PATH="$PATH:/usr/local/bin:/usr/local/sbin"
  PATH="$PATH:/usr/local/opt/mysql-client/bin"
  PATH="$PATH:$orig_path"
  export PATH
}
set_path

set_prompt () {
  autoload -U colors && colors
  newline=$'\n'

  current_time="%D{%H:%M:%S}"
  user_at_host="$fg[green]%n$reset_color@$fg[cyan]%m$reset_color"
  ppwd="$fg[magenta]%~$reset_color"
  separator=$newline
  PROMPT="$current_time $user_at_host:$ppwd $separator$ "
  export PROMPT
}
set_prompt

setup-ssh() {
  ssh-add -q --apple-use-keychain "$HOME/.ssh/id_rsa"
  ssh-add -q --apple-use-keychain "$HOME/.ssh/pco_servers"
}
setup-ssh

###########
# aliases #
###########

# Command/Application aliases
alias ..="cd .."
alias ...="cd ../.."
alias la="ls -A"
alias ll="ls -lAGh"
alias vi="vim"
alias vim="nvim"

############
# finalize #
############

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# use emacs key bindings
bindkey -e

export EDITOR="vi"
export LESS="-M"
export SAM_CLI_TELEMETRY=0
export CHECKPOINT_DISABLE=1
export NODE_PATH="$NODE_PATH:/usr/local/lib/node_modules"

eval "$($HOME/Code/pco/bin/pco init -)"
