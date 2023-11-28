# =======================================
#               Miscellaneous
# =======================================
alias r='radian'
alias R='R'

# =======================================
#               dockerdev
# =======================================
# INITIALIZE: Clone dockerdev repo into ~/.dockerdev if it doesn;t already exist
alias ddev-init='
  if [ -d ~/.dockerdev ]
    then echo "ddev already initialised at ~/.dockerdev"
    else git clone https://github.com/brendevan/.dockerdev ~/.dockerdev
  fi
'
# UPDATE: Update ~/.dockerdev by pulling git repo
alias ddev-update='git -C ~/.dockerdev pull'

# BUILD: Build the ddev Docker image
alias ddev-build='docker build ~/.dockerdev -t ddev'

# RUN: Run the ddev Docker container (unless one is already running)
alias ddev-run='
  DDEV_PREVIOUS=$(docker ps -a | grep "ddev" | awk "{print \$1}")
  if [ ! -z $DDEV_PREVIOUS ]
    then echo "STOP: A ddev container already exists!" && echo "Replace it with a new one by calling ddev-rerun"
    else docker run -it --name ddev ddev
  fi
'
# RERUN: Stop and remove all previously created ddev containers and rerun
alias ddev-rerun='
  DDEV_RUNNING=$(docker ps | grep "ddev")
  if [ ! -z $DDEV_RUNNING ]
    then echo "Stopping running ddev container" && docker stop ddev
  fi
  DDEV_STOPPED=$(docker ps -a | grep "ddev" | awk "{print \$1}")
  if [ ! -z $DDEV_STOPPED ]
    then echo "Removing previous ddev container" && docker rm ddev
    else echo "No previously created ddev container found - create one with ddev-run"
  fi
  docker run -it --name ddev ddev
'
# PURIFY: Delete all other Docker containers, images, volumes and networks 
#         (i.e. delete all non-ddev-associated Docker stuff )
#   - Volumes and networks not yet "purified" as they are not yet setup for ddev
alias ddev-purify='
  CONTAINERS=$(docker ps -a | grep -vE "ddev" | awk "NR > 1 {print \$1}")
  if [ -z "$CONTAINERS" ]
    then echo "No containers to purify"
    else echo "Stopping containers..." && docker stop $CONTAINERS && echo "Wiping containers..." && docker rm -v $CONTAINERS
  fi
  IMAGES=$(docker ps -a | grep -vE "ddev" | awk "NR > 1 {print \$1}")
  if [ -z $IMAGES ]
    then echo "No images to purify"
    else echo "Wiping images:" && docker rmi -f $IMAGES
  fi
'

# =======================================
#               Docker
# =======================================
# STATUS: a wrapper for `docker system df` which shows the current Docker disk usage
alias docker-status='docker system df'

# WIPE: Delete everything:
#   - stop & remove all containers
#   - remove all images
#   - remove all volumes 
#   - remove all networks other than the default (named 'bridge', 'host' and 'none'**)
#   - remove all build cache
# ** Unsure if 'none' default network is named 'none' or has no name?
alias docker-wipe='
  CONTAINERS=$(docker ps -aq)
  if [ -z "$CONTAINERS" ]
    then echo "No containers to wipe"
    else echo "Stopping containers..." && docker stop $CONTAINERS && echo "Wiping containers..." && docker rm -v $CONTAINERS
  fi 
  IMAGES=$(docker images -aq)
  if [ -z $IMAGES ]
    then echo "No images to wipe"
    else echo "Wiping images:" && docker rmi $IMAGES
  fi
  docker system prune --force
'
alias docker-wipe-volumes='
  VOLUMES=$(docker volume ls -q)
  if [ -z $VOLUMES ]
    then echo "No volumes to wipe"
    else echo "Wiping volumes..." && docker volume rm $VOLUMES
  fi
  docker system prune --force --volumes
'
alias docker-wipe-networks='
  NETWORKS=$(docker network ls | grep -vE "bridge|host|none" | awk "NR > 1 {print \$1}")
  if [ -z $NETWORKS ]
    then echo "No networks to wipe"
    else echo "Wiping networks..." && docker network rm $NETWORKS
  fi
'
