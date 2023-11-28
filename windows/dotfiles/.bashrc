# Fix windows text mangling (https://dev.to/equiman/zsh-on-windows-without-wsl-4ah9)
/c/Windows/System32/chcp.com 65001 > /dev/null 2>&1

# Source aliases from dotfiles/.bash_aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# ZSH on startup
# if [ -t 1 ]; then
#   exec zsh
# fi
