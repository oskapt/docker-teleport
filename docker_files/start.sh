#!/bin/bash
set -e

: ${TELEPORT_NODENAME:=$(hostname)}
: ${SSH_KEY_FILE:=id_rsa}

if [[ -f /run/secrets/${SSH_KEY_FILE} ]]; then
  chmod 600 /run/secrets/${SSH_KEY_FILE}
fi

exec teleport start --nodename=${TELEPORT_NODENAME}
