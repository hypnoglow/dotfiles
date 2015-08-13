#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# define variables

DOTFILES_DIR=`dirname $( readlink -f ${BASH_SOURCE[0]} )`
backupDir=~/.dotfiles~
files=$DOTFILES_DIR/src/*
PULL=true

# allow bash to find .dotfiles
if ! shopt -q dotglob ; then
	shopt -s dotglob
fi

# process params

for i in "$@"
do
case $i in
    --no-pull)
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

if [ ! -d $backupDir ] ; then 
	echo "Creating $backupDir for backup of any existing dotfiles in ~"
	mkdir -p $backupDir	
fi

echo "Changing to the $DOTFILES_DIR directory"
cd $DOTFILES_DIR

# move any existing dotfiles (or symlinks) in homedir to backupDir, then create symlinks 

echo "Installation started."
for file in $files; do
    FILENAME=`basename $file`

    # dirs, prefixed with double underline should be symlinked resursively
    if [[ ${FILENAME} == __* ]] ; then
        FILENAME=`echo $FILENAME | sed s/__//`
        cp -sRf ${file}/* $HOME/${FILENAME}
        
        continue
    fi

    if [ -h $HOME/$FILENAME ]; then
        echo "~/$FILENAME is a symlink, deleting it"
        rm $HOME/$FILENAME
    fi

    if [ -e ~/$FILENAME ]; then
       echo "Moving existing ~/$FILENAME to $backupDir"
       mv -f ~/$FILENAME $backupDir
   fi

   echo "Creating symlink to dotfile's $FILENAME in home directory"
   ln -sfv $file ~/$FILENAME
done
echo "Installation finished."