#!/bin/bash

# Run awx custom configration playbook
ansible-playbook playbook/awx/playbook-config-awx.yml -i inventory/geeky-server-build/hosts.ini  --ask-vault-password
