# Completions

aws_completion="/usr/local/bin/aws_zsh_completer.sh"
if [ -e "$aws_completion" ]; then
    source "$aws_completion"
fi
unset aws_completion

gcloud_completion="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
if [ -e "$gcloud_completion" ]; then
    source "$gcloud_completion"
fi
gcloud_completion="/opt/google-cloud-sdk/completion.zsh.inc"
if [ -e "$gcloud_completion" ]; then
    source "$gcloud_completion"
fi
unset gcloud_completion

if type -f kubectl &> /dev/null; then
    source <(kubectl completion zsh)
fi

if type -f helm &> /dev/null; then
    # Temporary fix.
    # See: https://github.com/helm/helm/issues/5046#issuecomment-463576351
    #source <(helm completion zsh)
    source <(helm completion zsh | sed -E 's/\["(.+)"\]/\[\1\]/g')
fi

if [ -x "$(which minikube 2>/dev/null)" ]; then
    source <(minikube completion zsh)
fi

if type -f stern &> /dev/null; then
    source <(stern --completion=zsh)
fi

if type -f kitty &> /dev/null; then
    kitty + complete setup zsh | source /dev/stdin
fi

if type -f golangci-lint &> /dev/null; then
    golangci-lint completion zsh | source /dev/stdin
fi
