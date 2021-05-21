#!/bin/bash
set -o nounset -o pipefail -o errexit

DOTENV=$(dirname "$0")/../.env

# Load all variables from .env and export them all for Ansible to read
if [ -f ${DOTENV} ]; then
    set -o allexport
    source ${DOTENV}
    set +o allexport
fi

# Run Ansible
exec ansible-playbook "$@"
