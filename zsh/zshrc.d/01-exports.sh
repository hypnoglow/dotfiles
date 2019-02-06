export BAT_THEME="OneHalfLight" # https://github.com/sharkdp/bat

export KUBECONFIG="$HOME/.kube/config"
for conf in $HOME/.kube/conf.d/* ; do
    [ ! -f "$conf" ] && continue
    export KUBECONFIG=$KUBECONFIG:$conf
done

