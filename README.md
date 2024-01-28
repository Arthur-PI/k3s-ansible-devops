## System requirements

Execute this script to ensure system requirements
```bash
chmod +x setup.sh
bash setup.sh
```

### VMs requirements

All managed nodes in inventory must have:
- Passwordless SSH access (`ssh-copy-id` to all the node beforehand)
- The user `ansible-admin` must exist on and have admin permissions under `sudo`
- The password for the `ansible-admin` user must be the same across all the VMs

## Usage

First copy the sample inventory to `inventory.yml`.

```bash
cp inventory-sample.yml inventory.yml
```

Second edit the inventory file to match your cluster setup. For example:
```bash
k3s_cluster:
  children:
    server:
      hosts:
        192.16.35.11:
    agent:
      hosts:
        192.16.35.12:
        192.16.35.13:
```

If needed, you can also edit `vars` section at the bottom to match your environment.

Start provisioning of the cluster using the following command:

```bash
ansible-playbook playbook/site.yml -i inventory.yml -K
```
