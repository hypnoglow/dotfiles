#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# define variables

DOTFILES_DIR=`dirname $( readlink -f ${BASH_SOURCE[0]} )`
backupDir=~/.dotfiles~
files=$DOTFILES_DIR/src/*

PULL=true

for i in "$@"
do
case $i in
    -c|--no-pull)
      PULL=false
    ;;
    *)
    ;;
esac
done

if [ $PULL = true ] ; then
    echo -n "Self updating... "
    (cd ${DOTFILES_DIR} && git pull -q)
    echo "done."
fi

# create backupDir in homedir

echo "Creating $backupDir for backup of any existing dotfiles in ~"
mkdir -p $backupDir

# change to the dotfiles directory

echo "Changing to the $DOTFILES_DIR directory"
cd $DOTFILES_DIR

# move any existing dotfiles (or symlinks) in homedir to backupDir, then create symlinks 

echo "Installation started."
for file in $files; do
    filename=`basename $file`

    # dirs, prefixed with double underline should be symlinked resursively
    if [[ ${filename} == __* ]] ; then
        filename=`echo $filename | sed s/__//`
        cp -sRf ${file}/* $HOME/.${filename}
        
        continue
    fi

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
echo "Installation finished."