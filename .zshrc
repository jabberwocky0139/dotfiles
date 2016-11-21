# Created by newuser for 5.0.5

#色付け
autoload -Uz colors
colors
##ls色付け
alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

##プロンプトの設定
PROMPT='%n:%~$ '
#RPROMPT='[%d]'
## 補完機能の強化
autoload -U compinit
compinit
## 補完候補一覧でファイルの種別をマーク表示
setopt list_types
## Emacsライクキーバインド設定
bindkey -e
## 色を使う
setopt prompt_subst
## 補完候補のカーソル選択を有効に
zstyle ':completion:*:default' menu select=1
## 補完候補の色づけ
eval `dircolors`
export ZLS_COLORS=$LS_COLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
## ヒストリを共有
setopt share_history
## 補完候補を詰めて表示
setopt list_packed
# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

#Gitのブランチを表示
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn
# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'

#set alias
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias wd='cd /home/jabberwocky/Dropbox/College'
alias gh='cd /home/jabberwocky/Dropbox/github'
alias doc='cd /home/jabberwocky/Documents'
alias Jupyter='jupyter notebook'
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export PATH="$PYENV_ROOT/versions/anaconda3-2.5.0/bin/:$PATH"
export PATH="/opt/emacs/bin:$PATH"

#source ~/bin/activate
