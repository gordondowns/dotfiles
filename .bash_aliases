# UPdate EVerything
alias upev='sudo apt update -y && sudo apt full-upgrade -y --fix-missing && sudo apt autoremove -y && sudo apt clean -y && sudo apt autoclean -y'

alias echored='tput setaf 1; echo "$@" ; tput sgr0'
# Kill all mosh-server processes except the one serving the current connection.
# The current server is found by walking up the process tree; inside zellij the
# mosh-server is not an ancestor (the zellij server is detached), so fall back
# to utmp, where actively-connected mosh entries read "<ip> via mosh [pid]" and
# detached ones read just "mosh [pid]".
mosh-kill-others() {
    local keep="" pid comm
    pid=$$
    while [ "$pid" -gt 1 ]; do
        comm=$(ps -o comm= -p "$pid" | tr -d ' ') || break
        [ "$comm" = "mosh-server" ] && { keep=$pid; break; }
        pid=$(ps -o ppid= -p "$pid" | tr -d ' ')
    done
    [ -z "$keep" ] && keep=$(who -u | sed -n 's/.* via mosh \[\([0-9]*\)\].*/\1/p')
    for pid in $(pgrep -x -u "$USER" mosh-server); do
        if echo "$keep" | grep -qx "$pid"; then
            echo "keeping mosh-server $pid (current connection)"
        else
            echo "killing mosh-server $pid"
            kill "$pid"
        fi
    done
}

# Kill all running zellij sessions except the one this shell is inside.
zellij-kill-others() {
    local name
    zellij list-sessions -n | grep -v EXITED | sed 's/ \[Created.*//' |
    while IFS= read -r name; do
        if [ "$name" = "$ZELLIJ_SESSION_NAME" ]; then
            echo "keeping session '$name' (current)"
        else
            echo "killing session '$name'"
            zellij kill-session "$name"
        fi
    done
}
