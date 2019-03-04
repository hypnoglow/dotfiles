export BAT_THEME="OneHalfLight" # https://github.com/sharkdp/bat

export KUBECONFIG="$HOME/.kube/config"
if [ -d "$HOME/.kube/conf.d" ] ; then
    for conf in $HOME/.kube/conf.d/* ; do
        [ ! -f "$conf" ] && continue
        export KUBECONFIG=$KUBECONFIG:$conf
    done
    unset conf
fi

export SOURCES_ROOT="${HOME}/sources"
export DOTFILES_ROOT="${HOME}/sources/github.com/hypnoglow/dotfiles"
export EDITOR=vim
