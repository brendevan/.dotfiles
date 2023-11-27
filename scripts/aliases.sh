#!/bin/bash

# Docker development environment (dockerdev)
alias ddev-init='if [ -d ~/.dockerdev ]; then echo "ddev already initialised at ~/.dockerdev"; else git clone https://github.com/brendevan/.dockerdev ~/.dockerdev; fi'

alias ddev-update='git -C ~/.dockerdev pull'

alias ddev-build='docker build ~/.dockerdev -t ddev'
