# zsh

## Completions

> [!NOTE]
> On macOS many software installed via "brew" (e.g. kubectl, helm) already
> provides completions, check `echo $fpath` directories (e.g. `ls /opt/homebrew/share/zsh/site-functions`).

> [!WARNING]
> Don't use this pattern:
> `source <(kubectl completion zsh)`
> This is VERY slow.

Example for `kubectl`:

```
mkdir -p ~/.zsh/completions
kubectl completion zsh > ~/.zsh/completions/_kubectl
# optional, creates _kubectl.zwc
zcompile ~/.zsh/completions/_kubectl

fpath=("$HOME/.zsh/completions" $fpath)
```
