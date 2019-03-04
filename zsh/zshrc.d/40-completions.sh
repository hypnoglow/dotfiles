# Completions

aws_completion="/usr/local/bin/aws_zsh_completer.sh"
if [ -e "$aws_completion" ]; then
    source "$aws_completion"
fi

gcloud_completion="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
if [ -e "$gcloud_completion" ]; then
    source "$gcloud_completion"
fi

if type -f kubectl &> /dev/null; then
    source <(kubectl completion zsh)
fi

if type -f helm &> /dev/null; then
    source <(helm completion zsh)
fi

if [ -x "$(which minikube 2>/dev/null)" ]; then
    source <(minikube completion zsh)
fi

if type -f stern &> /dev/null; then
    source <(stern --completion=zsh)
fi
