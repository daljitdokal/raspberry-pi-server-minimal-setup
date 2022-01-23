## K3s Ansible Playbook

Build a Kubernetes cluster using Ansible with k3s. The goal is easily install a Kubernetes cluster on machines running:

- [X] Debian
- [X] Ubuntu
- [X] CentOS

on processor architecture:

- [X] x64
- [X] arm64
- [X] armhf

## System requirements

Deployment environment must have Ansible 2.4.0+
Master and nodes must have passwordless SSH access

## Usage

First create a new directory based on the `sample` directory within the `inventory` directory:

```bash
cp -R inventory/sample inventory/geeky-server-build
```

Second, edit `inventory/geeky-server-build/hosts.ini` to match the system information gathered above. For example:

```bash
[master]
192.168.0.202

[k3s_cluster:children]
master
```

If needed, you can also edit `inventory/geeky-server-build/group_vars/all.yml` to match your environment.

Start provisioning of the cluster using the following command:

```bash
./run.sh
```

## Install `k3s` and `awx`
This script will execute the palybook.
```bash
./step1-post-install.sh
```
Wait for 30-40 minutes to fully complete the process.

## Configure and schedule `awx` job
### Daily mysql database backup from remote server

Edit 'global_vars/example_awx_config_vars.yaml' to pass the required values:
```bash
cp global_vars/example_awx_config_vars.yaml global_vars/awx_config_vars.yaml
```

This script will execute the palybook.
```bash
./step2-post-install-config.sh
```
Wait for 1-2 minutes to fully complete the process.




