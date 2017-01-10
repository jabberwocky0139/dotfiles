 ## rmでゴミ箱に入れる
alias rm='rmtrash'

## gitのbranch名出す
function git_branch
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
end

## promptの変更
# 左prompt
# function fish_prompt 
#     echo (prompt_pwd) ">< *>  "
# end
# 右prompt
function fish_right_prompt
    echo (git_branch)
end


## cd後にls 
function cd 
    builtin cd $argv; and ls
end


alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias wd='cd /home/jabberwocky/Dropbox/College'
alias gh='cd /home/jabberwocky/Dropbox/github'
alias doc='cd /home/jabberwocky/Documents'
alias Jupyter='jupyter notebook'

set -gx PYENV_ROOT $HOME/.pyenv $PYENV_ROOT
set -gx PATH $PYENV_ROOT/bin $PATH
set -gx PATH /opt/emacs/bin $PATH
## export PATH="$PYENV_ROOT/bin:$PATH"
status --is-interactive; and . (pyenv init -|psub)
set -gx PATH $PYENV_ROOT/versions/anaconda3-4.1.1/bin/ $PATH
## export PATH="$PYENV_ROOT/versions/anaconda3-4.4.1/bin/:$PATH"

