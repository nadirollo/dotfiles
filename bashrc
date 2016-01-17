if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/workspace/knife-bash-autocomplete/knife_autocomplete.sh ]; then
  source ~/workspace/knife-bash-autocomplete/knife_autocomplete.sh
fi

export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
export GREP_OPTIONS='--color=auto'
alias dog='pygmentize -g'
export PERSONAL_BIN=~/workspace/bin/
export PATH=$PERSONAL_BIN:$PATH
