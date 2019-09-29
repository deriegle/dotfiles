if [ -f $HOME/.bash_aliases ]; then
	. $HOME/.bash_aliases
fi

if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi

export GIT_EDITOR=nvim
export PATH="$PATH:$HOME/code/flutter/bin"
