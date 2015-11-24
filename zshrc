# -*- mode: Shell-script -*-
# zsh/regexのload
zmodload zsh/regex

# oh-my-zshのパスを指定する
ZSH=$HOME/.zsh.d/plugins/oh-my-zsh

# oh-my-zshのテーマを使用する
# 他のテーマは
# oh-my-zsh/themes/
# にある。
ZSH_THEME="ys"

## ビープ音を鳴らさない
setopt no_beep

## grepをカラーに、拡張正規表現にする
alias grep='grep -E --color'

## dfではブロック表示でなくギガ(メガ)バイト表示
alias df='df -h'

## gitでページャーを使わない
alias gnp='git --no-pager'

## ディレクトリ名だけでcd
setopt auto_cd

# 各OSごとの設定を読み込む
case "${OSTYPE}" in
darwin*)
	source ~/.zsh.d/conf/mac.zshrc
	;;
cygwin*)
	source ~/.zsh.d/conf/cygwin.zshrc
	;;
linux*)
	source ~/.zsh.d/conf/linux.zshrc
esac

source $ZSH/oh-my-zsh.sh

# command + rで peco-selected-history
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# historyに重複を登録しない
setopt HIST_IGNORE_ALL_DUPS

# completions
export fpath=($fpath $HOME/.zsh.d/completions)

# PATHの指定
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

## haskellのライブラリ管理
export PATH=$PATH:$HOME/.cabal/bin
## for my exec path
export PATH=$PATH:$HOME/bin
