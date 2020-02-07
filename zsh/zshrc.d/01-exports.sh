export BAT_THEME="OneHalfLight" # https://github.com/sharkdp/bat
export PURE_PROMPT_SYMBOL="λ" # https://github.com/sindresorhus/pure

export KUBECONFIG="$HOME/.kube/config"

export SOURCES_ROOT="${HOME}/sources"
export DOTFILES_ROOT="${HOME}/sources/github.com/hypnoglow/dotfiles"
export EDITOR=vim

# https://github.com/jonmosco/kube-ps1
kube_ps1_precmd() {
    PROMPT='$(kube_ps1)'$PROMPT
}
if [ "${KUBE_PS1_SHELL}" = "zsh" ]; then
    KUBE_PS1_SUFFIX=") " # Add space to separate prompt symbol
    if type -f starship &> /dev/null; then
        precmd_functions+=(kube_ps1_precmd)
    else
        PROMPT='$(kube_ps1)'$PROMPT
    fi
fi
