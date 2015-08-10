#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# define variables

dotfilesDir=~/dotfiles
backupDir=~/.dotfiles~
files=$dotfilesDir/src/*

# create backupDir in homedir

echo "Creating $backupDir for backup of any existing dotfiles in ~"
mkdir -p $backupDir

# change to the dotfiles directory

echo "Changing to the $dotfilesDir directory"
cd $dotfilesDir

# move any existing dotfiles (or symlinks) in homedir to backupDir, then create symlinks 

echo "Installing..."
for file in $files; do
    filename=`basename $file`

    if [ -h ~/.$filename ]; then
        echo "~/.$filename is a symlink, deleting it."
        rm ~/.$filename
    fi

    if [ -e ~/.$filename ]; then
       echo "Moving existing ~/.$filename to $backupDir"
       mv -f ~/.$filename $backupDir
   fi

   echo "Creating symlink to dotfile's $filename in home directory"
   ln -s $file ~/.$filename
done
echo "...done."