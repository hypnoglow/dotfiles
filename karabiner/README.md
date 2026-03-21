# karabiner

Karabiner-Elements saves its configuration atomically: it writes data to a temporary file and then uses `rename(2)` to replace the target — this destroys the symlink and replaces it with a regular file. Therefore, the symlink is set on the entire `~/.config/karabiner` directory: the `rename` operation happens inside it and does not affect the directory symlink itself.
