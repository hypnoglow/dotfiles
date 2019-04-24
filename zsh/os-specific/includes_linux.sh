# Includes and plugins that are connected from source.

# https://github.com/jonmosco/kube-ps1
if [ ! -d "${HOME}/sources/github.com/jonmosco/kube-ps1" ]; then
    git clone --branch v0.7.0 https://github.com/jonmosco/kube-ps1.git ${HOME}/sources/github.com/jonmosco/kube-ps1
fi
. "${HOME}/sources/github.com/jonmosco/kube-ps1/kube-ps1.sh"