#!/bin/bash

# get directory of dotfiles
SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
BACKUPPATH="$HOME/dotfiles.backup"

function backup_and_symlink {
    cp -L $2 $BACKUPPATH
    ln -sf $1 $2
}

# Make backup dir
rm -rf $BACKUPPATH
mkdir -p $BACKUPPATH

# create directories for symlinks
mkdir -p $HOME/.config/i3 $HOME/.config/i3status $HOME/.config/compton $HOME/.config/startup

# symlink dotfiles
backup_and_symlink $SCRIPTPATH/i3/config $HOME/.config/i3/config
backup_and_symlink $SCRIPTPATH/i3status/config $HOME/.config/i3status/config
backup_and_symlink $SCRIPTPATH/compton/compton.conf $HOME/.config/compton/compton.conf
backup_and_symlink $SCRIPTPATH/vim/.vimrc $HOME/.vimrc
backup_and_symlink $SCRIPTPATH/gtk-3.0/settings.ini $HOME/.config/gtk-3.0/settings.ini
backup_and_symlink $SCRIPTPATH/gtk-3.0/gtk.css $HOME/.config/gtk-3.0/gtk.css

#symlink background
backup_and_symlink $SCRIPTPATH/background.jpg $HOME/background.jpg

# symlink startup scripts
cp -Lr $HOME/.config/startup $BACKUPPATH/startup
rm -rf $HOME/.config/startup
ln -sfn $SCRIPTPATH/startup $HOME/.config 
