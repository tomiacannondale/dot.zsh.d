# -*- mode: Shell-script -*-
## git editor
export GIT_EDITOR=/usr/local/bin/emacsclient
export HOMEBREW_EDITOR=/usr/local/bin/emacsclient

# mac(FreeBSD)の時は明示的に拡張正規表現を使用する
alias sed='sed -E'

# According to the brew of comments
unalias run-help
autoload run-help
HELPDIR=/usr/local/share/zsh/help

# homebrewでインストールするとここに入るものがある
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/opt/texinfo/bin:$PATH
export PATH=/usr/local/opt/sqlite/bin:$PATH

## lessでシンタックスハイライト
export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'
