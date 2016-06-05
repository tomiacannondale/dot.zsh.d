# -*- mode: Shell-script -*-
# oh-my-zshのプラグインを指定
plugins=(git ruby bundler gem rails brew thor)

## git editor
export GIT_EDITOR=/usr/local/bin/emacsclient
export HOMEBREW_EDITOR=/usr/local/bin/emacsclient

# completionの再読み込み
autoload -Uz compinit
compinit -U

# mac(FreeBSD)の時は明示的に拡張正規表現を使用する
alias sed='sed -E'

# According to the brew of comments
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# rabbitmqをhomebrewでインストールするとここに入る
export PATH=/usr/local/sbin:$PATH
