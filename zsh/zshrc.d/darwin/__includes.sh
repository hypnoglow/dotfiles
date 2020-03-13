# https://github.com/jonmosco/kube-ps1
if [ -f /usr/local/opt/kube-ps1/share/kube-ps1.sh ] ; then
    . /usr/local/opt/kube-ps1/share/kube-ps1.sh
else
    echo "kube-ps1 is not installed."
fi

# https://github.com/asdf-vm/asdf (installed with brew)
# NOTE: more correct would be $(brew --prefix asdf) instead of "/usr/local/opt/asdf",
# but brew is tooooooooo slow.
if type -f asdf &> /dev/null && [ -f "/usr/local/opt/asdf/asdf.sh" ]; then
    . /usr/local/opt/asdf/asdf.sh
    . /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

gcloud_completion="/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"
if [ -e "$gcloud_completion" ]; then
    source "$gcloud_completion"
fi
