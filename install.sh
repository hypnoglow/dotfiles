#!/bin/bash
# This script installs all dotfiles by symlinking them to $HOME directory.
################################################################################

# define params
DO_UPDATE=true
VERBOSE_FLAG=""
DRY_RUN=false

# process params
for param in "$@"
do
case $param in
    -n|--update=no*)
        DO_UPDATE=false
    ;;
    -v|--verbose)
        VERBOSE_FLAG="-v"
    ;;
    -d|--dry-run)
        DRY_RUN=true
    ;;
    *)
    ;;
esac
done

# self-update if need
if [ $DO_UPDATE = true ] ; then
    if ! type -P gits > /dev/null ; then
        echo "Git is not installed - not doing an update"
    else
        echo -n "Self updating... "
        git pull --quiet --recurse-submodules
        git submodule update --quiet --init --recursive
        echo "done."
    fi
fi

# create backup dir if need
mkdir -p $VERBOSE_FLAG $BACKUP_DIR

# determine path variables
DOTFILES_ROOT=`dirname $( readlink -f ${BASH_SOURCE[0]} )`
DOTFILES_SRC="src"
BACKUP_DIR=~/.dotfiles~

# All regular files in $DOTFILES_SRC directory
# should be symlinked directly to $HOME
echo "Installing files"
for FILE in `find $DOTFILES_ROOT/$DOTFILES_SRC -maxdepth 1 -mindepth 1 -type f`
do
    FILENAME=`basename $FILE`
    FILEPATH=`readlink -f $FILE`

    # if symlink - delete it; elseif exists - backup
    if [ -h $HOME/$FILENAME ] ; then
        if [ $DRY_RUN = true ] ; then
            echo "Removing $HOME/$FILENAME"
        else
            rm $VERBOSE_FLAG $HOME/$FILENAME
        fi
    elif [ -e $HOME/$FILENAME ] ; then
        if [ $DRY_RUN = true ] ; then
            echo "Moving $HOME/$FILENAME to $BACKUP_DIR"
        else
            mv -f $VERBOSE_FLAG $HOME/$FILENAME $BACKUP_DIR
        fi
    fi

    if [ $DRY_RUN = true ] ; then
        echo "Symlinking $HOME/$FILENAME -> $FILEPATH"
    else
        ln -sf $VERBOSE_FLAG $FILEPATH $HOME/$FILENAME
    fi
done

# define variables needed for further processing
MAPPING_DELIMETER="->"

# All directories in $DOTFILES_SRC directory
# should be symlinked to $HOME relatively,
# according to the rules defined in mapper file.
echo "Installing directories"
while read line || [[ -n "$line" ]]; do
    DIR_SRC=`echo ${line%$MAPPING_DELIMETER*}`
    DIR_DEST=`echo ${line#*$MAPPING_DELIMETER}`

    if [ ! -d $DOTFILES_ROOT/$DOTFILES_SRC/$DIR_SRC ] ; then
        echo "Error: directory from mapping $DOTFILES_ROOT/$DOTFILES_SRC/$DIR_SRC does not exist"
        continue
    fi

    # if symlink - delete it; elseif exists - backup
    if [ -h $HOME/$DIR_DEST ] ; then
        if [ $DRY_RUN = true ] ; then
            echo "Removing $HOME/$DIR_DEST"
        else
            rm $VERBOSE_FLAG $HOME/$DIR_DEST
        fi
    elif [ -e $HOME/$DIR_DEST ] ; then
        if [ $DRY_RUN = true ] ; then
            echo "Moving $HOME/$DIR_DEST to $BACKUP_DIR/$DIR_DEST"
        else
            [ ! -e `dirname $BACKUP_DIR/$DIR_DEST` ] && mkdir -p `dirname $BACKUP_DIR/$DIR_DEST`
            mv -f $VERBOSE_FLAG $HOME/$DIR_DEST $BACKUP_DIR/$DIR_DEST
        fi
    fi

    if [ $DRY_RUN = true ] ; then
        echo "Symlinking $HOME/$DIR_DEST -> $DOTFILES_ROOT/$DOTFILES_SRC/$DIR_SRC"
    else
        ln -sfn $VERBOSE_FLAG $DOTFILES_ROOT/$DOTFILES_SRC/$DIR_SRC $HOME/$DIR_DEST
    fi
done < $DOTFILES_ROOT/mapping

echo "Installation finished."

exit 0
