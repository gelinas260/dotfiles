echo "Welcome to Tim's terminal :)"

export CLICOLOR=1

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# get current branch in git repo
function parse_git_branch() {
  BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ ! "${BRANCH}" == "" ]
  then
    STAT=`parse_git_dirty`
    echo "[${BRANCH}${STAT}]"
  else
    echo ""
  fi
}

# programs
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias tmux="TERM=screen-256color-bce tmux"
alias redis="redis-server /usr/local/etc/redis.conf"
alias ngrok-rails="ngrok http -subdomain=tim 3000"
alias ngrok-ember="ngrok http -subdomain=tim 4201"

# ssh
alias irc='mosh tim@irc.gelinas260.com $REMOTE "tmux a"'

# git
alias ga='git add . --all'
alias gc='git commit'

# rails
alias rs='rails server'
alias rc='rails console'
alias es='ember server --proxy http://localhost:3000'
#alias nw='/Applications/nwjs.app/Contents/MacOS/nwjs .'

# heroku


# set paths
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"
export DISABLE_SPRING=1

# init rbenv
eval "$(rbenv init -)"

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
