declare -g __zshrc_mlog_start_time
declare -g __zshrc_mlog_last_time

__zshrc_mlog_os="$(uname -s)"
__zshrc_mlog_date_cmd="date"
if [[ "${__zshrc_mlog_os}" == "Darwin" ]] && command -v gdate >/dev/null 2>&1 ; then
    __zshrc_mlog_date_cmd="gdate"
fi

mlog::start() {
    [[ -z "${MLOG_ENABLED:-}" ]] && return
    mlog_start_time=$(command ${__zshrc_mlog_date_cmd} +%s.%N)
    mlog_last_time=$mlog_start_time
}

mlog::print() {
    [[ -z "${MLOG_ENABLED:-}" ]] && return
    local total=$(echo "$(command ${__zshrc_mlog_date_cmd} +%s.%N) - $mlog_start_time" | bc)
    local last=$(echo "$(command ${__zshrc_mlog_date_cmd} +%s.%N) - $mlog_last_time" | bc)
    echo "[mlog] total=$total last=$last $@"
    mlog_last_time=$(command ${__zshrc_mlog_date_cmd} +%s.%N)
}

mlog::cleanup() {
    unset mlog_start_time
    unset mlog_last_time
    unset __zshrc_os
    unset __zshrc_date_cmd
    unset -f mlog::start
    unset -f mlog::print
    unset -f mlog::cleanup
}
