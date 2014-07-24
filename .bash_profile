export CLICOLOR=1

alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias vim='/usr/local/Cellar/vim/7.4.335/bin/vim'
alias tmux="TERM=screen-256color-bce tmux"
alias ec2='ssh -i ~/.ssh/ZackMac.pem ubuntu@ec2-54-226-121-215.compute-1.amazonaws.com'

# git
alias ga='git add . --all'
alias gc='git commit'

# rails
alias rs='rails server'
alias rc='rails console'

# set paths
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"

# init rbenv
eval "$(rbenv init -)"
