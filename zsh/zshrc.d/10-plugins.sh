#
# ZSH Plugins
#

[[ -d ~/.zplug ]] || {
    git clone https://github.com/zplug/zplug ${ZPLUG_HOME:-"${HOME}/.zplug"}
}

source ~/.zplug/init.zsh

if ! zplug check --verbose; then
  printf "Install zsh plugins? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load
