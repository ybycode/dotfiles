# to manage ssh-agent (needs keychain to be installed):
eval $(keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:~/code/docker/bin

# RUST properties
export RUST_SRC_PATH=$HOME/code/rust-src/src
export PATH=$PATH:~/.cargo/bin

export PATH=$PATH:~/go/bin

# Force tmux to assume the terminal supports 256 colours:
alias tmux="tmux -2"

# use Neovim instead of vim:
alias vim="nvim"

export EDITOR="nvim"

# avoid "Error opening terminal: rxvt-unicode" on remote servers:
# see (https://forums.gentoo.org/viewtopic-t-733895-start-0.html)
alias ssh="TERM=linux ssh"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# Android
export ANDROID_HOME=$HOME/Android/Sdk
#export PATH="$HOME/Android/Sdk/tools:$HOME/Android/Sdk/platform-tools:${PATH}"

# autocompletion for kubectl:
source <(kubectl completion zsh)
# also aliased as 'k':
alias k=kubectl
source <(kubectl completion zsh | sed 's/kubectl/k/g')

export PATH=$PATH:$HOME/.yarn/bin

function _cd_save_cwd () {
  # runs the cd command and saves the resulting CWD in a file.
  # the \ allows to use the original cd command and avoid recursion with the
  # alias
  \cd $1 && echo `pwd` > ~/.last_dir
}

function cd_last_dir () {
  # if the ~/.last_dir file exists and contains the name of a directory that
  # exists, then cd to it.
  if [[ -e ~/.last_dir ]]
  then
    last_dir=`cat ~/.last_dir`
    [[ -d "$last_dir" ]] && cd $last_dir
  fi
}

alias cd="_cd_save_cwd"

# cd to the last visited directory if its address was saved:
cd_last_dir
