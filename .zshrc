# to manage ssh-agent (needs keychain to be installed):
eval $(keychain --eval --agents ssh -Q --quiet id_rsa)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:~/code/docker/bin

# RUST properties
export RUST_SRC_PATH=$HOME/code/rust-src/src
export PATH=$PATH:~/.cargo/bin

# GOLANG settings:
export GOPATH=$HOME/code/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# For ruby gems:
export PATH=$PATH:~/.gem/ruby/2.3.0/bin

# Force tmux to assume the terminal supports 256 colours:
alias tmux="tmux -2"

# avoid "Error opening terminal: rxvt-unicode" on remote servers:
# see (https://forums.gentoo.org/viewtopic-t-733895-start-0.html)
alias ssh="TERM=linux ssh"

# Because npm globally installed packages go in my HOME:
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Android
export ANDROID_HOME=$HOME/Android/Sdk
#export PATH="$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools:${PATH}"
