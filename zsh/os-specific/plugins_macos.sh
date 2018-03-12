# Fish shell feature.
if [ "$TERM" != "linux" ]; then
    zplug "zsh-users/zsh-autosuggestions"
fi

zplug "djui/alias-tips", defer:3

if ! zplug check --verbose; then
  printf "Install zsh plugins? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load
