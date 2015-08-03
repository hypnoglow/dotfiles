#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# define variables

dotfilesDir=~/dotfiles
backupDir=~/.dotfiles~
files=$(ls src/)

# create backupDir in homedir

echo "Creating $backupDir for backup of any existing dotfiles in ~"
mkdir -p $backupDir
echo "...done."

# change to the dotfiles directory

echo "Changing to the $dotfilesDir directory"
cd $dotfilesDir
echo "...done."

# move any existing dotfiles (or symlinks) in homedir to backupDir, then create symlinks 

echo "Installing..."
for file in $files; do
    if [ -h ~/.$file ]; then
        echo "~/.$file is a symlink, deleting it."
        rm ~/.$file
    fi

    if [ -e ~/.$file ]; then
       echo "Moving existing .$file from ~/ to $backupDir"
       mv -f ~/.$file $backupDir
   fi

   echo "Creating symlink to dotfile's $file in home directory"
   ln -s $dotfilesDir/src/$file ~/.$file
done
echo "...done."