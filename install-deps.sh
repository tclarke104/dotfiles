#!/bin/bash

# install ubuntu dependencies
sudo apt-get install i3 i3status dmenu i3lock feh conky rofi compton zsh vim

# make zsh default shell
chsh -s $(which zsh)

# install oh my zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | zsh

#install dunstify deps
sudo apt-get install libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev libnotify-dev
cd /tmp
git clone https://github.com/dunst-project/dunst.git
make dunstify

mkdir ~/.local/bin
cp -vs $(pwd)/dunstify ~/.local/bin/