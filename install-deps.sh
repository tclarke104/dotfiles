#!/bin/bash

# install ubuntu dependencies
sudo apt-get install i3 i3status dmenu i3lock feh conky rofi compton zsh vim

# make zsh default shell
chsh -s $(which zsh)

# install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | zsh
