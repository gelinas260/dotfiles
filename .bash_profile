echo "Welcome to Zack's terminal :)"

export CLICOLOR=1

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# programs
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias vim='/usr/local/Cellar/vim/7.4.335/bin/vim'
alias tmux="TERM=screen-256color-bce tmux"
alias redis="redis-server /usr/local/etc/redis.conf"

# ssh
alias ec2='ssh -i ~/.ssh/ZackMac.pem ubuntu@ec2-54-226-121-215.compute-1.amazonaws.com'
alias omttllc='ssh omttllcc@box1053.bluehost.com'
alias irc='ssh zmattor@irc.zmattor.me -t "tmux a"'

# git
alias ga='git add . --all'
alias gc='git commit'

# rails
alias rs='rails server'
alias rc='rails console'
alias es='ember server --proxy http://localhost:3000'

alias nw='/Applications/nwjs.app/Contents/MacOS/nwjs .'

# heroku


# set paths
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"

# init rbenv
eval "$(rbenv init -)"

export NVM_DIR="/Users/zmattor/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

get_tmux_cwd() {
  local env_name=$(tmux display -p "TMUXPWD_#D" | tr -d %)
  local env_val=$(tmux show-environment | grep --color=never "$env_name")
  # The version below is still quite new for tmux. Uncomment this in the future :-)
  #local env_val=$(tmux show-environment "$env_name" 2>&1)

  if [[ ! $env_val =~ "unknown variable" ]]; then
    local tmux_pwd=$(echo "$env_val" | sed 's/^.*=//')
    echo "$tmux_pwd"
  fi
}
