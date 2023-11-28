# Source aliases from dotfiles/.bash_aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# ZSH on startup
if [ -t 1 ]; then
  exec zsh
fi