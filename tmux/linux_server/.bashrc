# .bashrc
export LC_CTYPE=C
export TMOUT=0
IGNOREEOF=100

# User specific aliases and functions
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# tmux configration
alias exit='texit'
alias logout='texit'

function texit(){
  if [[ -n "$TMUX" ]] ; then
    tmux run "mkdir -p ~/.tmux/logs/\$(date +%Y%m%d);tmux capture-pane -S -1000000; tmux show-buffer > \${HOME}/.tmux/logs/\$(date +%Y%m%d)/\$(date +%Y%m%d-%H%M%S)-#S-#I.#P.log" \; display-message "Logging ..."
    builtin exit
  else
    builtin exit
  fi
}

PECO=/usr/sbin/peco
if [[ ! $TMUX ]]; then
  ID=`tmux list-sessions`
  if [[ -z "$ID" ]]; then
    echo -n session_name:
    read session_name
    tmux new-session -s $session_name
  fi
  message="New Session"
  ID="${message}:\n$ID"
  ID="`echo -e "$ID" | $PECO | cut -d: -f1`"
  if [[ "$ID" = "${message}" ]]; then
    echo -n session_name:
    read session_name
    tmux new-session -s $session_name
  elif [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID"
  fi
fi
