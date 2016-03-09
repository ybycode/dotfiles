# zsh install
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="avit"
plugins=(git)
source $ZSH/oh-my-zsh.sh
# zsh install end

# GTK2 theme (needs gtk-theme-arc from AUR):
#export GTK2_RC_FILES=/usr/share/themes/Arc/gtk-2.0/gtkrc

# to manage ssh-agent (needs keychain to be installed):
#eval $(keychain --eval --agents ssh -Q --quiet id_rsa)

export PATH="~/.gem/ruby/2.1.0/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/vendor_perl:/usr/bin/core_perl"

# GOLANG settings:
export GOPATH=$HOME/code/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

export EDITOR='nvim'

# virtualenvwrapper stuff
# (see http://virtualenvwrapper.readthedocs.org/en/latest/install.html)
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code/python
source /usr/bin/virtualenvwrapper.sh

# Force tmux to assume the terminal supports 256 colours:
alias tmux="tmux -2"
