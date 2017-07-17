# Completions

aws_completion="/usr/local/bin/aws_zsh_completer.sh"
if [ -e "$aws_completion" ]; then
    source "$aws_completion"
fi

gcloud_completion="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
if [ -e "$gcloud_completion" ]; then
    source "$gcloud_completion"
fi
