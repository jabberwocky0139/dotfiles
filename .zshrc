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
alias Python='python3'
#alias python='/usr/bin/python2.7'
alias gh='cd /home/jabberwocky/Dropbox/github'

#キー配置変更
xmodmap .xmodmaprc

#パスの設定
#source /opt/intel/parallel_studio_xe_2016.0.047/compilers_and_libraries_2016/linux/bin/compilervars.sh intel64

PATH=$PATH:/opt/pysh/bin
PATH=$PATH:/usr/include/python3.4m
PATH=$PATH:/usr/lib/llvm-3.5/bin
CPATH=/usr/local/lib/python3.4/dist-packages/PyUblas-2013.1-py3.4-linux-x86_64.egg/pyublas/include/:/usr/include/python3.4:/usr/local/lib/python3.4/dist-packages/numpy/core/include:/usr/lib/llvm-3.5/include:/usr/lib/llvm-3.5/include/llvm:/usr/lib/llvm-3.5/include/llvm-c
export CPATH

#PATH=$PATH:/usr/local/cuda-7.0/bin
#PATH=$PATH:/opt/intel/composer_xe_2015/bin
#LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-7.0/lib64
LD_LIBRARY_PATH=/usr/local/lib:/opt/boost_1_55_0/stage/lib:/usr/local/bin/:/usr/include/python3.4:/usr/lib/llvm-3.5/lib
export LD_LIBRARY_PATH
export PATH
export LLVM_CONFIG=/usr/lib/llvm-3.5/bin/llvm-config


# added by Anaconda3 2.2.0 installer
#export PATH="/home/jabberwocky/anaconda3/bin:$PATH"

#/opt/intel/parallel_studio_xe_2016.0.047/compilers_and_libraries_2016/linux/compiler/include:/opt/intel/parallel_studio_xe_2016.0.047/compilers_and_libraries_2016/linux/tbb/include/tbb:/opt/intel/parallel_studio_xe_2016.0.047/compilers_and_libraries_2016/linux/compiler/lib/intel64:
