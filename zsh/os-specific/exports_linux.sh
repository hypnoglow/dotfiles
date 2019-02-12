export PURE_PROMPT_SYMBOL="λ"

[ ! -r "$HOME/.sh/POSIX/pathf.sh" ] && echo "Cannot read ~/.sh/POSIX/pathf.sh" && return 1
. ~/.sh/POSIX/pathf.sh

pathf_prepend "$HOME/.local/bin"
