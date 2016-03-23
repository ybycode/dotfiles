# zsh install
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="avit"
plugins=(git)
source $ZSH/oh-my-zsh.sh
# zsh install end

# to manage ssh-agent (needs keychain to be installed):
eval $(keychain --eval --agents ssh -Q --quiet id_rsa)

# GOLANG settings:
export GOPATH=$HOME/code/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

export EDITOR='vim'

# Force tmux to assume the terminal supports 256 colours:
alias tmux="tmux -2"

# avoid "Error opening terminal: rxvt-unicode" on remote servers:
# see (https://forums.gentoo.org/viewtopic-t-733895-start-0.html)
alias ssh="TERM=linux ssh"
