# -*- mode: Shell-script -*-

### autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

## git editor
export GIT_EDITOR=/Applications/Emacs.app/Contents/MacOS/bin/emacsclient
export HOMEBREW_EDITOR=/Applications/Emacs.app/Contents/MacOS/bin/emacsclient
# mysql2のインストールでコケた
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/

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
