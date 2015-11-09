# .files

These are mine dotfiles. \o/  

If you barely understand what it is, or if you want an in-depth tutorial about organizing your dotfiles, 
see [this blog post](http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/).

This targets Ubuntu Linux systems, but some things are unix compatible or at least
easy adaptable to it. Feel free to take anything from this.

## Installation

Install script checks, if there is an existing destination file for each dotfile.  
If it is a symlink, script removes it, otherwise backups it to backup_dir ("~/.dotfiles~" by default).  

    cd
    git clone --recursive git@gitlab.com:hypnoglow/dotfiles.git dotfiles
    cd dotfiles
    chmod +x install.sh
    ./install.sh [-v] [-d] [-n]

install.sh arguments:

Argument | Effect
--- | ---
-v , --verbose | Explain what is being done
-d , --dry-run | Show what would be done, without making any changes
-n , --update-no | Dont' do self-update

## Updating

Install script automatically does self-update by default, if no `--update=no` argument specified.  
So the only thing you need to run is:

    cd dotfiles
    ./install.sh

To run self-update explicitly, do:

    cd dotfiles
    git pull origin --recurse-submodules
    git submodule update --init --recursive
    ./install.sh