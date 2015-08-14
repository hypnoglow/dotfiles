#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# define variables

DOTFILES_DIR=`dirname $( readlink -f ${BASH_SOURCE[0]} )`
backupDir=~/.dotfiles~
files=$DOTFILES_DIR/src/*
DO_UPDATE=true
VERBOSE_FLAG=""

# allow bash to find .dotfiles
if ! shopt -q dotglob ; then
    shopt -s dotglob
fi

# process params

for i in "$@"
do
case $i in
    --update=no*)
        DO_UPDATE=false
    ;;
    -v|--verbose)
        VERBOSE_FLAG="-v"
    ;;
    *)
    ;;
esac
done

if [ $DO_UPDATE = true ] ; then
    echo -n "Self updating... "
    git pull --quiet --recurse-submodules
    git submodule update --quiet --init --recursive
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
        rm $VERBOSE_FLAG $HOME/$FILENAME
    fi

    if [ -e ~/$FILENAME ]; then
       mv -f $VERBOSE_FLAG ~/$FILENAME $backupDir
    fi

    ln -sf $VERBOSE_FLAG $file ~/$FILENAME
done
echo "Installation finished."