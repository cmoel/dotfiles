alias rehash='source $HOME/.bash_profile'
alias ebrc="open $HOME/.bashrc"

# Command/Application aliases
alias ..='cd ..'
alias ...='cd ../..'
alias la='ls -A'
alias ll='ls -lAGh'
alias vi='vim'

# Code location aliases
alias code='cd $HOME/code && pwd && ls -lAGh'

# Project aliases
alias bi='cd $HOME/code && cd bi'
alias wima='cd $HOME/code && cd wima'

# Git aliases
alias g='git'
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gp='git push'
alias gl='git pull'
alias gpo='git push origin'
alias gaa='git add -A .'
alias gcm='git commit -m '
alias gcam='git commit -am '
alias grm='git status | grep deleted | awk "{print \$3}" | xargs git rm'
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'

# Ruby/Rails helper aliases
alias b='bundle'
alias be="bundle exec $1"
alias bu='bundle update'
alias rake='bundle exec rake'
