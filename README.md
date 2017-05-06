# .files

My dotfiles. \o/ :metal:

If you barely understand what it is, or if you want an in-depth tutorial about organizing your dotfiles,
see [this post](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789#.j9vtwid73) as an example.

These dotfiles target both macOS and ArchLinux/Manjaro systems - things that I use either in one of them or in both are specified in `dotbro-macOS.toml` and `dotbro-linux.toml`.

Note that many of included config files are compatible with other operation systems (or at least
easy adaptable to it). For example, Atom is available on Linux, macOS and Windows, and
its configuration files are universal for all these systems.

Feel free to take anything from this.

## First Time Installation

Installation is done via [dotbro](https://github.com/hypnoglow/dotbro).  
See that repository for an easy way to install dotfiles.

*Note that I export DOTFILES_ROOT one time during installation for convenience so my dotbro config can use this variable.
For further needs, the DOTFILES_ROOT variable is exported
during shell login (see [here](https://github.com/hypnoglow/dotfiles/blob/master/shell/profile.d/exports.sh#L77)).*

### ArchLinux

    # install dotbro
    yaourt -S dotbro --noconfirm

    export DOTFILES_ROOT="$HOME/sources/hypnoglow/dotfiles"
    git clone https://github.com/hypnoglow/dotfiles "$DOTFILES_ROOT"
    dotbro -c $DOTFILES_ROOT/dotbro-linux.toml

### macOS

    # Install dotbro.
    go get -v -t github.com/hypnoglow/dotbro
    # Assuming $GOPATH/bin is not in PATH
    # because dotfiles are not installed yet ;)
    export GOPATH=$HOME/go
    PATH=$GOPATH/bin:$PATH

    export DOTFILES_ROOT="$HOME/sources/hypnoglow/dotfiles"
    git clone https://github.com/hypnoglow/dotfiles "$DOTFILES_ROOT"
    dotbro -c $DOTFILES_ROOT/dotbro-macOS.toml
