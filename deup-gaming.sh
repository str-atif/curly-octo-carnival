#!/bin/bash

# Refuse to start an open root shell: require credentials from env vars
: "${TERMINAL_USER:?Set TERMINAL_USER in Render environment variables}"
: "${TERMINAL_PASSWORD:?Set TERMINAL_PASSWORD in Render environment variables}"

exec /usr/local/bin/gotty \
  --permit-write \
  --reconnect \
  --port "${PORT:-8080}" \
  --credential "${TERMINAL_USER}:${TERMINAL_PASSWORD}" \
  /bin/bash
