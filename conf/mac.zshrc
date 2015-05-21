# -*- mode: Shell-script -*-
# oh-my-zshのプラグインを指定
plugins=(git ruby bundler gem rails brew thor)

## git editor
export GIT_EDITOR=/usr/local/bin/emacsclient
export HOMEBREW_EDITOR=/usr/local/bin/emacsclient

## nodebrewの設定
export PATH=$HOME/.nodebrew/current/bin:$PATH
if [[ -d "$HOME/.nodebrew/completions/zsh" ]]; then
    fpath=("$HOME/.nodebrew/completions/zsh" $fpath)
fi

# completionの再読み込み
autoload -Uz compinit
compinit -U

# mac(FreeBSD)の時は明示的に拡張正規表現を使用する
alias sed='sed -E'
