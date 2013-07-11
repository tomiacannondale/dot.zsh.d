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

# 環境変数ENVとemacsのENVをあわせる
perl -wle \
    'do { print qq/(setenv "$_" "$ENV{$_}")/ if exists $ENV{$_} } for @ARGV' \
    PATH > ~/.emacs.d/elisp/shellenv.el

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

## auto-fu.zsh
# http://blog.glidenote.com/blog/2012/04/07/auto-fu.zsh/
# https://github.com/hchbaw/auto-fu.zsh
if [ -f ~/.zsh.d/plugins/auto-fu.zsh/auto-fu.zsh ]; then
    source ~/.zsh.d/plugins/auto-fu.zsh/auto-fu.zsh
    function zle-line-init () {
        auto-fu-init
    }
    zle -N zle-line-init
    zstyle ':completion:*' completer _oldlist _complete
fi

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
