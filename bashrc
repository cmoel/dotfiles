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
ANDROID_HOME="${HOME}/Library/Android/sdk"
PATH="${HOME}/bin"                                            # First home folder bin
PATH="${PATH}:/usr/local/bin:/usr/local/sbin"                 # local stuffs
PATH="${PATH}:/Applications/Xcode.app/Contents/Developer/usr/bin"
PATH="${PATH}:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin"     # Then add the other default OS X places
PATH="${PATH}:${ANDROID_HOME}/emulator"
PATH="${PATH}:${ANDROID_HOME}/tools"
PATH="${PATH}:${ANDROID_HOME}/tools/bin"
PATH="${PATH}:${ANDROID_HOME}/platform-tools"
export PATH
export ANDROID_HOME

# CDPATH
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi
export CDPATH=.:~:~/Code

eval "$($HOME/Code/pco/bin/pco init -)"

setup-ssh() {
  ssh-add -q -K "$HOME/.ssh/id_rsa"
  ssh-add -q -K "$HOME/.ssh/pco_servers"
}
