#!/bin/bash
# Re-attach a screen session while saving out SSH vars
# Author unknown - not my work - and appears via a bunch
#   of different authors onlin

if [ -n "$SSH_CLIENT" ]; then
  mkdir -p "$HOME/.screen"

  # Variables to save
  SSHVARS="SSH_CLIENT SSH_TTY SSH_AUTH_SOCK SSH_CONNECTION DISPLAY"

  for x in ${SSHVARS} ; do
    (eval echo $x=\$$x) | sed  's/=/="/
s/$/"/
s/^/export /'
  done 1> "$HOME/.screen/session-variables"
fi

exec screen -d -R -A


