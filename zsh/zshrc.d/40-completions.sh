# Completions

aws_completion="/usr/local/bin/aws_zsh_completer.sh"
if [ -e "$aws_completion" ]; then
    source "$aws_completion"
fi
