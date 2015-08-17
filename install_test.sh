#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# define variables

DOTFILES_ROOT=`dirname $( readlink -f ${BASH_SOURCE[0]} )`
DOTFILES=$DOTFILES_ROOT/src/*
BACKUP_DIR=~/.dotfiles~
DO_UPDATE=true
VERBOSE_FLAG=""
MAPPING_DELIMETER="->"

# allow bash to find .dotfiles
#if ! shopt -q dotglob ; then
#    shopt -s dotglob
#fi

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

if [ ! -d $BACKUP_DIR ] ; then
    echo "Creating $BACKUP_DIR for backup of any existing dotfiles in ~"
    mkdir -p $BACKUP_DIR
fi

echo "Installing files"
for FILE in `find $DOTFILES_ROOT/src -maxdepth 1 -mindepth 1 -type f`
do
    FILENAME=`basename $FILE`
    FILEPATH=`readlink -f $FILE`

    # if symlink, delete it
    if [ -h $HOME/$FILENAME ]; then
        rm $VERBOSE_FLAG $HOME/$FILENAME
    fi

    #if exists, backup it
    if [ -e $HOME/$FILENAME ]; then
        mv -f $VERBOSE_FLAG $HOME/$FILENAME $BACKUP_DIR
    fi

    ln -sf $VERBOSE_FLAG $FILEPATH $HOME/$FILENAME
done

echo "Installing directories"
while read line || [[ -n "$line" ]]; do
    DIR_SRC=`echo ${line%$MAPPING_DELIMETER*}`
    DIR_DEST=`echo ${line#*$MAPPING_DELIMETER}`

    if [ ! -d $DOTFILES_ROOT/src/$DIR_SRC ] ; then
        echo "Error: directory $DOTFILES_ROOT/src/$DIR_SRC does not exist"
        continue
    fi

    # if symlink, delete it
    if [ -h $HOME/$DIR_DEST ]; then
        rm $VERBOSE_FLAG $HOME/$DIR_DEST
    fi

    #if exists, backup it
    if [ -e $HOME/$DIR_DEST ]; then
        mv -f $VERBOSE_FLAG $HOME/$DIR_DEST $HOME/$DIR_DEST~
    fi

    ln -sf $VERBOSE_FLAG $DOTFILES_ROOT/src/$DIR_SRC $HOME/$DIR_DEST
done < $DOTFILES_ROOT/mapping

echo "Installation finished."
