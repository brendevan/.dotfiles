#!/bin/bash

# Gitbash (currently not working due to administrator permission errors)
alias gitbash-update-aliases='curl -o "/c/Program Files/Git/etc/profile.d/aliases.sh" https://raw.githubusercontent.com/brendevan/.dotfiles/main/scripts/aliases.sh'

# Docker development environment (dockerdev)
alias ddev-init='if [ -d ~/.dockerdev ]; then echo "ddev already initialised at ~/.dockerdev"; else git clone https://github.com/brendevan/.dockerdev ~/.dockerdev; fi'

alias ddev-update='git -C ~/.dockerdev pull'

alias ddev-build='docker build ~/.dockerdev -t ddev'



# Docker 
alias docker-wipe='docker system prune -a --volumes'



# Git