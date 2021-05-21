#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

SSH_USER=${SSH_USER:-$USER}
SSH_HOSTNAME=${SSH_HOSTNAME:-'forum.amenda.fr'}
SSH_PRIV_KEY=${SSH_PRIV_KEY:-'./key/forum.amenda.fr'}

scp -r \
    -i ${SSH_PRIV_KEY} \
    ${SSH_USER}@${SSH_HOSTNAME}:/var/discourse/shared/standalone/uploads/default/ \
    ./provisioning/roles/amenda.forum/files/uploads/
