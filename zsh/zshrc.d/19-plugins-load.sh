if ! zplug check --verbose; then
  printf "Install zsh plugins? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load
