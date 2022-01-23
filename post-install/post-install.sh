#!/bin/bash

# Install dependencies
ansible-galaxy collection install awx.awx

# Run anible master playbook
ansible-playbook site.yml -i inventory/geeky-server-build/hosts.ini
