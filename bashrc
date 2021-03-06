# aliases, shell variables, and prompt
source "${HOME}/.bash_aliases"
source "${HOME}/.bash_prompt"
source "${HOME}/.bash_shell_variables"

# bash completion for git and tmux
bash_comp="/usr/local/etc/bash_completion.d"
for f in git-completion.bash tmux; do
  [[ -f "${bash_comp}/$f" ]] && source "${bash_comp}/$f"
done

# PATH...
PATH="${HOME}/bin"                                            # First home folder bin
PATH="${PATH}:/Applications/Postgres.app/Contents/Versions/9.4/bin"
PATH="${PATH}:/usr/local/bin:/usr/local/sbin"                 # local stuffs
PATH="${PATH}:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"     # Then add the other default OS X places
export PATH

# CDPATH
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi
export CDPATH=.:~:~/code

function serve {
  ruby -run -e httpd . -p3000
}



# asdf
source /usr/local/opt/asdf/asdf.sh
source /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]]; then
    source "$HOME/.hitch_export_authors"
  fi
}
alias unhitch='hitch -u'

setup-ssh() {
  ssh-add -K "$HOME/.ssh/id_rsa"
}

# Uncomment to persist pair info between terminal instances
hitch
