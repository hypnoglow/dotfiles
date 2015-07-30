#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# define variables

dotfilesDir=~/dotfiles
backupDir=~/.dotfiles~
files=$(ls -A | grep "^\." | grep -v ".git")

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
    echo "Moving any existing $file from ~ to $backupDir"
	[ -e ~/$file ] && mv ~/$file $backupDir
    echo "Creating symlink to dotfile's $file in home directory"
    ln -s $dotfilesDir/$file ~/$file
done
echo "...done."