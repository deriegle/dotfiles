if [ -f $HOME/.bash_aliases ]; then
	. $HOME/.bash_aliases
fi

if [ -f $HOME/.bashrc ]; then
  . $HOME/.bashrc
fi

export GIT_EDITOR=nvim
export EDITOR=nvim
export REACT_EDITOR=none

export PATH="/user/local/sbin:$PATH"
export PATH="$PATH:$HOME/code/depot_tools" # Chrome depot tools
export PATH="$PATH:$HOME/code/flutter/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH:$HOME/.composer/vendor/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Custom BASH prompt
command -v brew 2>&1 > /dev/null
BREW_INSTALLED=$?
if [ $BREW_INSTALLED -eq 0 ]; then
  if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
    __GIT_PROMPT_DIR="/usr/local/opt/bash-git-prompt/share"
    PROMPT_USER_AND_HOST='\[\033[01;32m\]'
    PROMPT_PWD='\[\033[01;34m\]\W\[\033[00m\]'
    GIT_PROMPT_START="${PROMPT_PWD}"
    GIT_PROMPT_END='\n$ '
    source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
  fi
fi
