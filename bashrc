# aliases, shell variables, and prompt
set shell=$SHELL
source "${HOME}/.bash_aliases"
source "${HOME}/.bash_prompt"
source "${HOME}/.bash_shell_variables"

# bash completion for git and tmux
bash_comp="/usr/local/etc/bash_completion.d"
for f in git-completion.bash tmux; do
  [[ -f "${bash_comp}/$f" ]] && source "${bash_comp}/$f"
done

# PATH...
export GOPATH="${HOME}/code/go"
PATH="${HOME}/bin"                                            # First home folder bin
PATH="${PATH}:/Applications/Postgres.app/Contents/Versions/9.3/bin"
PATH="${PATH}:${GOPATH}/bin"
PATH="${PATH}:/usr/local/bin:/usr/local/sbin"                 # local stuffs
PATH="${PATH}:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"     # Then add the other default OS X places
export PATH

# CDPATH
export CDPATH=".:${HOME}/code/grok"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

function serve {
  ruby -run -e httpd . -p3000
}

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
