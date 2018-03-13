#
# ZSH Plugins
#

[[ -d ~/.zplug ]] || {
    git clone https://github.com/zplug/zplug ${ZPLUG_HOME:-"${HOME}/.zplug"}
}

source ~/.zplug/init.zsh
