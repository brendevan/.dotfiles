# Fix windows text mangling (https://dev.to/equiman/zsh-on-windows-without-wsl-4ah9)
/c/Windows/System32/chcp.com 65001 > /dev/null 2>&1

# ZSH on startup
if [ -t 1 ]; then
  exec zsh
fi