# -*- mode: Shell-script -*-
#== PATHの設定
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#== エイリアス
alias open='cygstart'

#== その他
export GIT_PAGER="nkf -w | less"
export SVN_EDITOR="vi"
