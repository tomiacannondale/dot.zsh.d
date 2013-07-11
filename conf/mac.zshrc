# -*- mode: Shell-script -*-
# パスの設定
export PATH=/usr/local/bin:$PATH:/usr/texbin

# ### for coffee-script
export PATH=$PATH:~/node_modules/coffee-script/bin

# for nvm
source ~/.nvm/nvm.sh
nvm use "v0.5.0"
# only use whn have installed nvm.
# if [[ -f ~/.nvm/nvm.sh ]]; then
#   source ~/.nvm/nvm.sh

#   if which nvm >/dev/null 2>&1 ;then
#     _nodejs_use_version="v0.5.0"
#     if nvm ls | grep -F -e "${_nodejs_use_version}" >/dev/null 2>&1 ;then
#       nvm use "${_nodejs_use_version}" >/dev/null
#     fi
#     unset _nodejs_use_version
#   fi
# fi

# oh-my-zshのプラグインを指定
plugins=(git ruby bundler gem rails3 brew thor)

# zshを読み込み
source $ZSH/oh-my-zsh.sh

## git editor
export GIT_EDITOR=/usr/local/Cellar/emacs-japanese/24.3/bin/emacsclient
