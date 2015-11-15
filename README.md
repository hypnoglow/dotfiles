# .files

These are mine dotfiles. \o/ :metal:

If you barely understand what it is, or if you want an in-depth tutorial about organizing your dotfiles, 
see [this blog post](http://www.anishathalye.com/2014/08/03/managing-your-dotfiles/) as an example.

This targets Ubuntu Linux systems, but some things are unix compatible or at least
easy adaptable to it. Feel free to take anything from this.

## Installation

Install-script checks, if there is an existing destination file for each dotfile.  
If it is a symlink, script removes it, otherwise backup will be made into backup_dir (`$HOME/.dotfiles~` by default).  

    cd
    git clone --recursive git@gitlab.com:hypnoglow/dotfiles.git dotfiles
    cd dotfiles
    ./install.sh [-v] [-d] [-u]

**install.sh arguments**:

Argument | Effect
--- | ---
-v , --verbose | Explain what is being done
-d , --dry-run | Show what would be done, without making any changes
-u , --update | Do a self-update

## Updating

Install-script automatically does self-update if `--update` argument specified.  
So the only thing you need to run is:

    cd dotfiles
    ./install.sh -u

To run self-update explicitly, do:

    cd dotfiles
    git checkout master
    git pull origin --recurse-submodules
    git submodule update --init --recursive
    ./install.sh