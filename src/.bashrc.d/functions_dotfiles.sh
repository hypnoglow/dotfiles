# This is an include file for .bashrc

# Functions for dotfiles operating

# Adds file to dotfiles system
function dfl_add {
	# @todo check if already exists or it is a symlink

	FILENAME=""
	RECURSIVE_SYMLINK=""
	VERBOSE="-v"
	DOTFILES_DIR="$HOME/dotfiles/src"
	BACKUP_DIR="$HOME/.dotfiles~"

	while [[ $# > 0 ]]
	do
		case $1 in
			-s)
			RECURSIVE_SYMLINK="__"
			;;
			#-v)
			#VERBOSE="-v"
			#;;
			-q)
			VERBOSE=""
			;;
			-*)
			echo "Error: unknown argument."
			return 1
			;;
			*)
			FILENAME=$1
			break
			;;
		esac
		shift
	done

	if [ ! -e "$FILENAME" ] ; then
		echo "Error: file does not exist."
		return 1
	fi

	if [ ! -f "$FILENAME" ] ; then
		echo "Error: directories are currently not supported."
	fi

	FILEPATH=`readlink -f ${FILENAME}`
	FILEPATH_RELATIVE_TO_HOME=`echo $FILEPATH | sed s:^$HOME\/::`

	echo "Making backup"
	# mkdir -p $(dirname $BACKUP_DIR/$FILEPATH_RELATIVE_TO_HOME)
    #cp -f $VERBOSE $FILEPATH $BACKUP_DIR/$FILEPATH_RELATIVE_TO_HOME
    cp -f $FILEPATH $FILEPATH~

    echo "Moving to dotfiles dir"
    mkdir -p $(dirname $DOTFILES_DIR/${RECURSIVE_SYMLINK}${FILEPATH_RELATIVE_TO_HOME})
    mv -f $VERBOSE $FILEPATH $DOTFILES_DIR/${RECURSIVE_SYMLINK}${FILEPATH_RELATIVE_TO_HOME}

    echo "Making symlink to home dir"
    # @todo correct recursive adding of directories
	if [[ -n "$RECURSIVE_SYMLINK" ]] ; then
		cp -sRf $VERBOSE $DOTFILES_DIR/${RECURSIVE_SYMLINK}${FILEPATH_RELATIVE_TO_HOME} $HOME/$FILEPATH_RELATIVE_TO_HOME
	else
	    ln -sf $VERBOSE $DOTFILES_DIR/$FILEPATH_RELATIVE_TO_HOME $HOME/$FILEPATH_RELATIVE_TO_HOME
	fi
}