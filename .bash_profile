# Env vars that must be set for non-interactive shells too (e.g. mosh-server
# spawning `bash -lc 'zellij attach main'`), since .bashrc returns early for
# non-interactive shells and won't set these.
export VISUAL=/usr/local/bin/nvim
export EDITOR="$VISUAL"
export NVIM_APPNAME=lazyvim

source ~/.bashrc
