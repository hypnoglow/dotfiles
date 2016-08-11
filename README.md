# .files

These are mine dotfiles. \o/ :metal:

If you barely understand what it is, or if you want an in-depth tutorial about organizing your dotfiles,
see [this post](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789#.j9vtwid73) as an example.

This targets ArchLinux/Manjaro systems, but almost all things are compatible with other Linux system or at least
easy adaptable to it. Feel free to take anything from this.

## Installation

Installation is done via [dotbro](https://github.com/hypnoglow/dotbro).  
See that repository for an easy way to install dotfiles.

Installation commands:

    export $GOPATH="$HOME/go"
    export $DOTFILES_ROOT="$HOME/sources/hypnoglow/dotfiles"
    go get github.com/hypnoglow/dotbro
    git clone https://github.com/hypnoglow/dotfiles "$DOTFILES_ROOT"
    ~/go/bin/dotbro -c $DOTFIELS_ROOT/dotbro.toml


