# -*- mode: Shell-script -*-
# for rbenv
# rbenvのパスの設定はこっちに書かないとemacsとかでうまく動かない。
if [ -d ${HOME}/.rbenv  ] ; then
    export PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
fi
export PATH=/usr/local/sbin:$PATH
