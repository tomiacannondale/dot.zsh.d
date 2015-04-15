# -*- mode: Shell-script -*-
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# oh-my-zshのプラグインを指定
plugins=(git ruby bundler gem rails brew thor)

## git editor
export GIT_EDITOR=/opt/boxen/homebrew/bin/emacsclient
export HOMEBREW_EDITOR=/opt/boxen/homebrew/bin/emacsclient
