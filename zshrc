# -*- mode: Shell-script -*-
## zplug
### インストール
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

### zplugの読み込み
source ~/.zplug/init.zsh

### プラグインの読み込み
zplug "mafredri/zsh-async", "on:sindresorhus/pure"
zplug "sindresorhus/pure"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug $HOME/.zsh.d/functions, from:local

### 未インストールのものをインストール
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi
zplug load

## path
### anyenvのpath
export PATH="$HOME/.anyenv/bin:$PATH"
export PATH=$PATH:$HOME/bin

### completion用のfpaht(大体lnして終わるからバージョン管理から無視したい)
export FPATH=$FPATH:$HOME/.zsh.d/completions

## history
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
# historyに重複を登録しない
setopt HIST_IGNORE_ALL_DUPS
# window間でhistoryを共有
setopt SHARE_HISTORY

## misc
### cdの履歴を管理
###     `cd -[TAB]'
setopt auto_pushd

### コマンドを間違えた時候補を表示
setopt correct

### 補完時にビープ音を鳴らさない
setopt nolistbeep

### ビープ音を鳴らさない
setopt no_beep

### 補完時大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'

## aliases
### grepをカラーに、拡張正規表現にする
alias grep='grep -E --color'

### git
alias g=git

### gitでページャーを使わない
alias gnp='git --no-pager'

### bundle exec
alias be="bundle exec"

### grepをカラーに、拡張正規表現にする
alias grep='grep -E --color'

### dfではブロック表示でなくギガ(メガ)バイト表示
alias df='df -h'

### lsをカラー表示
alias ls='ls -G'

### jq + lessでjqのカラーを引き継ぐ
alias jq='jq -C'

### LESSの設定
# * シンタックスハイライト
# * 1画面で収まる時はcat的に表示する
# * カラーエスケープシーケンスをちゃんと扱う
# * 検索時現在フォーカスしているものだけを反転させる
# * 検索時ヒットした語を8行目に持ってくる
export LESS='-R --no-init --quit-if-one-screen --RAW-CONTROL-CHARS -gj8'

## autoload

## competionの構築
autoload -U promptinit && promptinit

## 各種pluginの追加設定
### anyenv
eval "$(anyenv init -)"

### peco-select-history
zle -N peco-select-history
bindkey '^r' peco-select-history

## 各OSごとの設定を読み込む
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
