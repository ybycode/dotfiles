# to manage ssh-agent (needs keychain to be installed):
# eval $(keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa)

# to use gpg-agent in place of ssh-agent:
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

source $ZSH/oh-my-zsh.sh

plugins=(pass)

# Force tmux to assume the terminal supports 256 colours:
alias tmux="tmux -2"

export EDITOR="nvim"
# use Neovim instead of vim:
alias vim="nvim"
# use sops with a barebone nvim to avoid leaks through undos:
alias sops="EDITOR='nvim -u NONE' && sops"

# avoid "Error opening terminal: rxvt-unicode" on remote servers:
# see (https://forums.gentoo.org/viewtopic-t-733895-start-0.html)
alias ssh="TERM=linux ssh"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# autocompletion for kubectl:
source <(kubectl completion zsh)
# also aliased as 'k':
alias k=kubectl
source <(kubectl completion zsh | sed 's/kubectl/k/g')

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

export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# pass (https://www.passwordstore.org/) is used as the backend for aws-vault:
export AWS_VAULT_BACKEND=pass

# https://direnv.net
# eval "$(direnv hook zsh)"

# cd to the last visited directory if its address was saved:
cd_last_dir
