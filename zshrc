# -*- mode: Shell-script -*-
# oh-my-zshのパスを指定する
ZSH=$HOME/.zsh.d/plugins/oh-my-zsh

# oh-my-zshのテーマを使用する
# 他のテーマは
# oh-my-zsh/themes/
# にある。
ZSH_THEME="ys"

## for my exec path
export PATH=$PATH:$HOME/bin

# haskellのライブラリ管理
export PATH=$PATH:$HOME/.cabal/bin

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
