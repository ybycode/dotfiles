# to manage ssh-agent (needs keychain to be installed):
# eval $(keychain --eval --agents ssh -Q --quiet ~/.ssh/id_rsa)

# to use gpg-agent in place of ssh-agent:
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent
# using yubikey-agent instead:
# export SSH_AUTH_SOCK=/run/user/1000/yubikey-agent/yubikey-agent.sock

# Force tmux to assume the terminal supports 256 colours:
alias tmux="tmux -2"

export EDITOR="nvim"
# use Neovim instead of vim:
alias vim="nvim"

# rsync options for local, fast copy. Coming from
# https://superuser.com/a/1361692:
alias rsync_local="rsync -avAXEWSlHh --no-compress --info=progress2"

# use sops with a barebone nvim to avoid leaks through undos:
alias sops="EDITOR='nvim -u NONE' && sops"

# avoid "Error opening terminal: rxvt-unicode" on remote servers:
# see (https://forums.gentoo.org/viewtopic-t-733895-start-0.html)
alias ssh="TERM=linux ssh"

alias hearts="echo :green_heart: :blue_heart: :purple_heart: :yellow_heart: :heart: | xclip"

# autocompletion for kubectl:
# source <(kubectl completion zsh)
# also aliased as 'k':
# alias k=kubectl
# source <(kubectl completion zsh | sed 's/kubectl/k/g')

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/bin:$HOME/.scripts:$PATH"

# pass (https://www.passwordstore.org/) is used as the backend for aws-vault:
export AWS_VAULT_BACKEND=pass
