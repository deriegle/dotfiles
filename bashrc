if [ -f $HOME/.bash_aliases ]; then
	. $HOME/.bash_aliases
fi

if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi

export GIT_EDITOR=nvim
export EDITOR=nvim

export PATH="/user/local/sbin:$PATH"
export PATH="$PATH:$HOME/code/flutter/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
