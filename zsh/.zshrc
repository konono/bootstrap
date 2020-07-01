### ENV
#source $ZPLUG_HOME/init.zsh
source ~/.zsh_env
source /usr/local/opt/zplug/init.zsh
source ~/secret.env
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export ZPLUG_HOME=/usr/local/opt/zplug
export MANPATH="/usr/local/man:$MANPATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
export HISTFILE=${HOME}/.zsh_history # 履歴ファイルの保存先
export HISTSIZE=10000 # メモリに保存される履歴の件数
export SAVEHIST=10000000 # 履歴ファイルに保存される履歴の件数
export ZPLUG_LOG_LOAD_SUCCESS=false
export ZPLUG_LOG_LOAD_FAILURE=false
export SHELL=/usr/local/bin/zsh

### zplug config
zplug 'zsh-users/zaw'
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:3
zplug "b4b4r07/enhancd", use:init.sh
zplug "rupa/z", use:"*.sh"
zplug "plugins/git", from:oh-my-zsh
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf, use:"*darwin*amd64*"
zplug "junegunn/fzf", as:command, use:bin/fzf-tmux
zplug "junegunn/fzf", use:shell/key-bindings.zsh
zplug "junegunn/fzf", use:shell/completion.zsh
zplug "mafredri/zsh-async", from:github
## Theme configurations
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
#zplug "zsh/nearcolor"

#zplug "themes/cloud", from:oh-my-zsh
#zstyle ':oh-my-zsh:themes' theme 'cloud'
#zplug "themes/gentoo", from:oh-my-zsh
#zstyle ':oh-my-zsh:themes' theme 'gentoo'


# 未インストール項目をインストールする
#if ! zplug check --verbose; then
#    printf "Install? [y/N]: "
#    if read -q; then
#        echo; zplug install
#    fi
#fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
#zplug load --verbose # debug mode
#
zplug load

# Colors can be changed by using zstyle with a pattern of the form :prompt:pure:$color_name and style color. The color names, their default, and what part they affect are:
#
# execution_time (yellow) - The execution time of the last command when exceeding PURE_CMD_MAX_EXEC_TIME.
# git:arrow (cyan) - For PURE_GIT_UP_ARROW and PURE_GIT_DOWN_ARROW.
# git:branch (242) - The name of the current branch when in a Git repository.
# git:branch:cached (red) - The name of the current branch when the data isn't fresh.
# host (242) - The hostname when on a remote machine.
# path (blue) - The current path, for example, PWD.
# prompt:error (red) - The PURE_PROMPT_SYMBOL when the previous command has failed.
# prompt:success (magenta) - The PURE_PROMPT_SYMBOL when the previous command has succeded.
# user (242) - The username when on remote machine.
# user:root (default) - The username when the user is root.
# virtualenv (242) - The name of the Python virtualenv when in use.
# The following diagram shows where each color is applied on the prompt:
#
# ┌───────────────────────────────────────────── path
# │          ┌────────────────────────────────── git:branch
# │          │       ┌────────────────────────── git:arrow
# │          │       │        ┌───────────────── host
# │          │       │        │
# ~/dev/pure master* ⇡ zaphod@heartofgold 42s
# venv ❯               │                  │
# │    │               │                  └───── execution_time
# │    │               └──────────────────────── user
# │    └──────────────────────────────────────── prompt
# └───────────────────────────────────────────── virtualenv
#
zmodload zsh/nearcolor
zstyle :prompt:pure:path color '#30acec'
#zstyle :prompt:pure:path color '#2b9ad4'

if [ ! -f ~/.zshrc.zwc -o ~/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi

# User configuration
autoload colors && colors

#入力途中の履歴補完を有効化する
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
zmodload zsh/complist                                          # Menu listのbindkeyカスタマイズに必要

## Zplugを使っている場合はZplugが一度呼び出すので、記述の必要なし
## https://github.com/zplug/zplug/issues/24
#autoload -U compinit && compinit

## 保管をインタラクティブに行う
zstyle ':completion:*' menu select=2 interactive
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
#zstyle ':completion:*:default' menu select=2

## 補完候補をキャッシュする。
zstyle ':completion:*' use-cache yes
zstyle ':completion::complete:*' use-cache true
mkdir -p $HOME/.zsh/cache
zstyle ':completion:*' cache-path ~/.zsh/cache
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' keep-prefix
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true

#zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
#zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
#zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
#zstyle ':completion:*:options' description 'yes'
#zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

### 補完方法毎にグループ化する。
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''

### 補完侯補をメニューから選択する。
### 補完候補に色を付ける。
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

### 補完候補がなければより曖昧に候補を探す。
### m:{a-z}={A-Z}: 小文字を大文字に変えたものでも補完する。
### r:|[._-]=*: 「.」「_」「-」の前にワイルドカード「*」があるものとして補完する。
#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
### 文字の途中からも補完の対象にする
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

#zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' recent-dirs-insert both
#zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#' '^_.*$'
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
# Userは補完候補に出さない
zstyle ':completion:*' users
zstyle ':completion:*' parameter

### 補完候補
### _oldlist 前回の補完結果を再利用する。
### _complete: 補完する。
### _match: globを展開しないで候補の一覧から補完する。
### _history: ヒストリのコマンドも補完候補とする。
### _ignored: 補完候補にださないと指定したものも補完候補とする。
### _approximate: 似ている補完候補も補完候補とする。
### _prefix: カーソル以降を無視してカーソル位置までで補完する。
#zstyle ':completion:*' completer _oldlist _complete _match _history _ignored _approximate _prefix
zstyle ':completion:*' completer _complete _ignored _approximate

## 詳細な情報を使わない
zstyle ':completion:*' verbose no

## sudo の時にコマンドを探すパス
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# Ctrl-Wでパスの文字列などをスラッシュ単位でdeleteできる
autoload -U select-word-style
select-word-style bash

# 最後に打った引数をコピー
autoload -Uz smart-insert-last-word
zstyle :insert-last-word match '*([[:alpha:]/\\]?|?[[:alpha:]/\\])*' # [a-zA-Z], /, \ のうち少なくとも1文字を含む長さ2以上の単語
zle -N insert-last-word smart-insert-last-word
bindkey '^[' insert-last-word
# see http://qiita.com/mollifier/items/1a9126b2200bcbaf515f

setopt auto_menu             # タブキーの連打で自動的にメニュー補完
setopt auto_list             # タブキーの連打で自動的にメニュー補完
setopt hist_ignore_dups      # Historyの重複を記録しない
setopt extended_history      # Historyの開始と終了を記録
setopt share_history         # tmuxなどを使っていてもhistoryを共有
setopt menu_complete         # Menuで出てくる候補を補完できるようにする
setopt prompt_subst          # プロンプト表示する度に変数を展開
setopt cdable_vars           # ディレクトリ補完でuserとかGroupを表示させない
setopt auto_param_slash      # ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs             # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt list_types            # 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt auto_menu             # 補完キー連打で順に補完候補を自動で補完
setopt auto_param_keys       # カッコの対応などを自動的に補完
setopt interactive_comments  # コマンドラインでも # 以降をコメントと見なす
setopt magic_equal_subst     # コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt complete_in_word      # 語の途中でもカーソル位置で補完
setopt always_last_prompt    # カーソル位置は保持したままファイル名一覧を順次その場で表示し、終了時に画面から消す
setopt print_eight_bit       # 日本語ファイル名等8ビットを通す
setopt extended_glob         # 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
setopt globdots              # 明確なドットの指定なしで.から始まるファイルをマッチ
setopt auto_cd               # ディレクトリ名を入力するだけでcdできるようにする
setopt ignoreeof             # Ctrl-Dでシェルからログアウトしない
setopt no_beep               # BEEPを鳴らさない

bindkey -e                                                    # Emacs keybind
bindkey -v '^t' peco-ssh                                      # 自作のpecoでsshホストを選択
bindkey -v '^a' beginning-of-line                             # 行頭へ(menuselectでは補完候補の先頭へ)
bindkey -v '^b' backward-char                                 # 1文字左へ(menuselectでは補完候補1つ左へ)
bindkey -v 'b' backward-word                                  # 1文字右へ(menuselectでは補完候補1つ右へ)
bindkey -v '^e' end-of-line                                   # 行末へ(menuselectでは補完候補の最後尾へ)
bindkey -v '^f' forward-char                                  # 1文字右へ(menuselectでは補完候補1つ右へ)
bindkey -v 'f' forward-word                                  # 1文字右へ(menuselectでは補完候補1つ右へ)
bindkey -v '^h' backward-delete-char                          # 1文字削除(menuselectでは絞り込みの1文字削除)
bindkey -v '^i' expand-or-complete                            # 補完開始
bindkey -v "^K" kill-line
bindkey -v '^h' backward-delete-char                          # 1文字削除(menuselectでは絞り込みの1文字削除)
bindkey -v "^?" backward-delete-char                          # 1文字削除(menuselectでは絞り込みの1文字削除)
#bindkey "^f" history-incremental-search-forward   # 普通のリバースサーチ
#bindkey '^r' history-incremental-search-backward  # 普通のリバースサーチ
bindkey "^p" history-beginning-search-backward-end # 後ろだけリバースサーチ
bindkey "^n" history-beginning-search-forward-end  # 後ろだけリバースサーチ
#bindkey '^r' history-substring-search-up          # 打ってからリバースサーチ
#bindkey '^f' history-substring-search-down        # 打ってからリバースサーチ
#bindkey "^I" menu-complete   # 展開する前に補完候補を出させる(Ctrl-iで補完するようにする)
#bindkey "^I" list-expand

bindkey -M menuselect "^?" undo                                # 補完候補をbackspaceでキャンセル
bindkey -M menuselect '^h' backward-delete-char                # 補完候補の文字を削除
#bindkey -M menuselect '^h' backward-char                      # 補完候補1つ左へ
#bindkey -M menuselect '^l' forward-char                       # 補完候補1つ右へ
bindkey -M menuselect '^i' forward-char                        # 補完候補1つ右へ
bindkey -M menuselect '^j' down-line-or-history                # 補完候補1つ下へ
bindkey -M menuselect '^k' up-line-or-history                  # 補完候補1つ上へ
bindkey -M menuselect '^r' history-incremental-search-forward  # 補完候補内インクリメンタルサーチ
bindkey -M menuselect '^r' history-incremental-search-forward  # 補完候補内インクリメンタルサーチ
bindkey -M menuselect '^[[Z' backward-char                     # shift+tabで候補を逆順で選択
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char
#bindkey -M menuselect '^g' .send-break                        # send-break2回分の効果
#bindkey -M menuselect '^j' .accept-line                       # accept-line2回分の効果
#bindkey -M menuselect '^k' accept-and-infer-next-history      # 次の補完メニューを表示する
#bindkey -M menuselect '^n' down-line-or-history               # 補完候補1つ下へ
#bindkey -M menuselect '^p' up-line-or-history                 # 補完候補1つ上へ
#bindkey -M menuselect '^r' history-incremental-search-forward # 補完候補内インクリメンタルサーチ

# ctrl-y でcd ../を打つ
function cd-up { zle push-line && LBUFFER='builtin cd ..' && zle accept-line }
zle -N cd-up
bindkey "^o" cd-up

function cd-home { zle push-line && LBUFFER='builtin cd ~/' && zle accept-line }
zle -N cd-home
bindkey "^y" cd-home

### Alias
alias docker='sudo docker'
alias dstart='(){ docker run -it -d $1 /bin/bash }'
alias drm='docker ps -q -f status=exited|xargs sudo docker rm'
alias dps='docker ps --all'
alias da="docker ps -q -f status=running|awk 'NR==1'"
alias gob='go build -gcflags "-N -l"'
alias lxc='sudo lxc'
alias enc='openssl enc -aes-256-cbc -in $1 -out $1.enc'
alias dec='openssl enc -aes-256-cbc -d -in $1.enc -out $1'
alias ll="gls -alh --color=auto"
alias less='less -r -SX' # lessで見た時にエスケープシーケンスなどを綺麗に取る
alias rf='mv -i -t /tmp/' # 誤って消すの対策
alias gip="egrep -o '([1-2]?[0-9]{0,2}\.){3,3}[1-2]?[0-9]{0,2}'" # grep ip address 
alias dateyy="date '+%Y%m%d%H%M%S'"
alias ssh-config-update="cat ~/.ssh/conf.d/common-config ~/.ssh/conf.d/*.conf > ~/.ssh/config"
alias vi='nvim'
alias vim='nvim'
alias nvf='nvim -d'
alias sudo='sudo ' # magic
alias zpluginstall='zplug install && zplug load'
alias exit='texit'
alias sshk="ps -ef |grep rt_kiba |grep -v grep|cut -d' ' -f4 | xargs -I% kill % && sshpass -p ${PASSWORD4R} ssh -o 'StrictHostKeyChecking no' -f -N rt_kiba1"
alias ssht="ps -ef |grep rp_totsuka |grep -v grep|cut -d' ' -f4 | xargs -I% kill % && sshpass -p ${PASSWORD4R} ssh -o 'StrictHostKeyChecking no' -f -N rp_totsuka"
alias sshs="ps -ef |grep rp_sanda |grep -v grep|cut -d' ' -f4 | xargs -I% kill % && sshpass -p ${PASSWORD4R} ssh -o 'StrictHostKeyChecking no' -f -N rp_sanda"
alias tope='sshpass -p Rakuten ssh -o "StrictHostKeyChecking no" Rakuten@localhost -p 10022'
alias kope='sshpass -p centos ssh -o "StrictHostKeyChecking no" root@localhost -p 20022'
alias sope='sshpass -p clouddept ssh -o "StrictHostKeyChecking no" clouddept@localhost -p 10023'
alias vd='/opt/cisco/anyconnect/bin/vpn disconnect'
alias sed='gsed'


xmodmap ~/.Xmodmap 2> /dev/null
#xkbcomp -I $HOME/.xkb ~/.xkb/keymap/mykbd $DISPLAY 2> /dev/null

function peco-ssh () {
  local selected_host=$(awk '
  tolower($1)=="host" {
    for (i=2; i<=NF; i++) {
      if ($i !~ "[*?]") {
        print $i
      }
    }
  }
  ' ~/.ssh/config | sort | peco --query "$LBUFFER")
  if [ -n "$selected_host" ]; then
    BUFFER="ssh ${selected_host}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-ssh

function grvim(){
  # Init vars
  file=""
  line=""

  res="`ggrep --color=auto -rI -n "$1" |peco`"
  file="$(awk -F: -v t="$res" 'BEGIN{split(t, a); print a[1]}')"
  line="$(awk -F: -v t="$res" 'BEGIN{split(t, a); print a[2]}')"
  if [ -n "$file" ] && [ -n "$line" ]; then
    nvim -c $line $file
  else
    echo "...Canceled"
  fi
}

function texit(){
  if [[ -n "$TMUX" ]] ; then
    tmux run "mkdir -p ~/.tmux/logs/\$(date +%Y%m%d);tmux capture-pane -S -1000000; tmux show-buffer > \${HOME}/.tmux/logs/\$(date +%Y%m%d)/\$(date +%Y%m%d-%H%M%S)-#S-#I.#P.log" \; display-message "Logging ..."
    builtin exit
  else
    builtin exit
  fi
}
function svp(){
  expect -c '
  set PASSWORD ${env(PASSWORD4R)}
  set USER ${env(SUSER4R)}
  set IP ${env(SIP4R)}
  set timeout 20
  
  spawn "/opt/cisco/anyconnect/bin/vpn"
  expect "VPN>" { send "connect ${IP}\r" }
  expect "*Anyway*" { send "y\r" }
  expect "*sername*" { send "${USER}\r" }
  expect "*assword*" { send "${PASSWORD}\r" }
  expect "state: Connected" { send "exit\r" }
  interact
  '
}


function tvp(){
  expect -c '
  set PASSWORD ${env(PASSWORD4R)}
  set USER ${env(TUSER4R)}
  set IP ${env(TIP4R)}
  set timeout 20
  
  spawn "/opt/cisco/anyconnect/bin/vpn"
  expect "VPN>" { send "connect ${IP}\r" }
  expect "*Anyway*" { send "y\r" }
  expect "*sername*" { send "${USER}\r" }
  expect "*assword*" { send "${PASSWORD}\r" }
  expect "state: Connected" { send "exit\r" }
  interact
  '
}

function kvp(){
  expect -c '
  set PASSWORD ${env(PASSWORD4R)}
  set USER ${env(KUSER4R)}
  set IP ${env(KIP4R)}
  set timeout 20
  
  spawn "/opt/cisco/anyconnect/bin/vpn"
  expect "VPN>" { send "connect ${IP}\r" }
  expect "*Anyway*" { send "y\r" }
  expect "*sername*" { send "${USER}\r" }
  expect "*assword*" { send "${PASSWORD}\r" }
  expect "state: Connected" { send "exit\r" }
  interact
  '
}

function td() {
  td=`date +%Y%m%d%S`
}

in_container() {
  container="$1"
  shift # command: the rest
  if [ -z "$*" ] ; then
    docker exec -it "$container" env PS1="$container $PS1" env TERM="$TERM" /bin/bash
  else
    docker exec "$container" env TERM="$TERM" "$@"
  fi
}

# Workaround for https://github.com/robbyrussell/oh-my-zsh/issues/7094
if [ "$_Z_NO_RESOLVE_SYMLINKS" ]; then
    _z_precmd() {
        (_z --add "${PWD:a}" &)
		: $RANDOM
    }
else
    _z_precmd() {
        (_z --add "${PWD:A}" &)
		: $RANDOM
    }
fi

function tmux-remake-socket () {
    if [ ! $TMUX ]; then
        return
    fi
    tmux_socket_file=`echo $TMUX|awk -F, '{print $1}'`
    if [ ! -S $tmux_socket_file ]; then
        mkdir -m700 `dirname $tmux_socket_file` 2> /dev/null
        killall -SIGUSR1 tmux
    else
        echo tmux unix domain socket exists! nothing to do.
    fi
    unset tmux_socket_file
}


# Profiling option
# if (which zprof > /dev/null) ;then
#   zprof | less
# fi


PECO=/usr/local/bin/peco
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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/yyamashi/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/yyamashi/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
eval "$(rbenv init -)"

## Set path for pyenv
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
