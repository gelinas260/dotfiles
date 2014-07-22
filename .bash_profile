export CLICOLOR=1
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/Users/zmattor/Downloads/gcc-arm-none-eabi-4_8-2014q2/bin:$PATH"

alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias vim='/usr/local/Cellar/vim/7.4.335/bin/vim'
alias tmux="TERM=screen-256color-bce tmux"
alias ec2='ssh -i ~/.ssh/ZackMac.pem ubuntu@ec2-54-226-121-215.compute-1.amazonaws.com'
alias ga='git add . --all'
alias gc='git commit'

export PATH=/usr/local/bin:$PATH
