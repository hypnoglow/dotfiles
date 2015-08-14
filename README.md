# .files

These are mine dotfiles. ^^  
Take what you want, but know what you take.

It targets Ubuntu Linux systems, but most things are unix-compatible.

## Installation

Install script checks, if there is an existing destination file for each dotfile.  
If it is a symlink, script removes it, otherwise backup it to backup_dir ("~/.dotfiles~" by default).
    
    cd
    git clone --recursive git@gitlab.com:hypnoglow/dotfiles.git dotfiles
    cd dotfiles
    chmod +x install.sh
    ./install.sh

## Updating

Install script automatically does self-update by default, if no `--no-pull` specified.  
So the only thing you need to run is:

    cd dotfiles
    ./install.sh

To run self-update explicitly, do:

    cd dotfiles
    git pull origin --recurse-submodules
    git submodule update --init --recursive
    ./install.sh