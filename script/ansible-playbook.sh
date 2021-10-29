#!/bin/bash
set -o nounset -o pipefail -o errexit

DIR=$(dirname "$0")
DOTENV=${DIR}/../.env

# Load all variables from .env and export them all for Ansible to read
if [ -f ${DOTENV} ]; then
    set -o allexport
    source ${DOTENV}
    set +o allexport
fi

export ANSIBLE_CONFIG="${DIR}/provisioning/ansible.cfg"

# Run Ansible
exec ansible-playbook "$@"
