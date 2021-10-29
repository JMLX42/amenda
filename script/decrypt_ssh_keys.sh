#!/bin/bash

if [ -z "${ANSIBLE_VAULT_PASSWORD_FILE}" ]; then
    >&2 echo "error: ANSIBLE_VAULT_PASSWORD_FILE must be set (https://docs.ansible.com/ansible/latest/user_guide/vault.html#setting-a-default-password-source)"
    exit 1
fi

# We assume:
# - All encrypted keys have the `.enc` extension (cf `encrypt_ssh_keys.sh`).
for ENC_SSH_KEY in $(ls key | grep '.enc$'); do
    SSH_KEY=${ENC_SSH_KEY%.enc}
    if [ -f ./key/${SSH_KEY} ] && [ "$1" != "--force" ]; then
        >&2 echo "warning: file ./key/${SSH_KEY} already exists, skipping"
    else
        ansible-vault decrypt \
            --output ./key/${SSH_KEY} \
            ./key/${ENC_SSH_KEY}
    fi
done
