This is mine dotfiles. ^^

# Installation

Install script checks, if there is an existing destination file for each dotfile.
If it is a symlink, script removes it, otherwise backup it to backup_dir ("~/.dotfiles~" by default).
    
    cd
    git clone --recursive git@gitlab.com:hypnoglow/dotfiles.git dotfiles
    cd dotfiles
    chmod +x install.sh
    ./install.sh

# Updating

    cd dotfiles
    git pull origin
    git submodule update --init --recursive
    ./install.sh