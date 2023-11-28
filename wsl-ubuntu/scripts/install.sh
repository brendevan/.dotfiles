
# Install linux programs
sudo apt update -y  && sudo apt install -y \
  curl                                    \
  git                                     \
  zsh                                     \
  zsh-syntax-highlighting                 \
  zsh-autosuggestions

# Install oh-my-zsh
yes | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
