#!/bin/zsh

remove talos_config_files_from_pves_ml3_devops() {
ansible machines \
  --inventory inventories/ML3/hosts.yml \
  --become \
  --module-name ansible.builtin.shell \
  --args 'set -eu
base=/var/lib/vz/snippets
for file in devops_controlplane.yaml devops_worker.yaml devops_talosconfig devops_kubeconfig; do
  path="$base/$file"
  if [ -e "$path" ]; then
    chattr -i "$path" 2>/dev/null || true
    chmod u+w "$path" 2>/dev/null || true
    rm --force "$path"
  fi
done'
}

# Function to remove SSH keys for kubernetes cluster nodes
remove_maestros_ssh_keys() {
    # Prompt for the domain
    echo -n "Enter the domain: "
    read domain

    # Check if domain is provided
    if [ -z "$domain" ]; then
        echo "Error: Domain is required"
        return 1
    fi

    # Run the ssh-keygen commands
    echo "Removing SSH keys for domain: $domain"
    ssh-keygen -R "maestro01.$domain" 2>/dev/null
    ssh-keygen -R "maestro02.$domain" 2>/dev/null
    ssh-keygen -R "maestro03.$domain" 2>/dev/null

    echo "SSH key removal process completed for domain: $domain"
}

# To use this function directly, you can call:
# remove_maestros_ssh_keys
#


remove_pves_ssh_keys() {
    # Prompt for the domain
    echo -n "Enter the domain: "
    read domain

    # Check if domain is provided
    if [ -z "$domain" ]; then
        echo "Error: Domain is required"
        return 1
    fi

    # Run the ssh-keygen commands
    echo "Removing SSH keys for domain: $domain"
    ssh-keygen -R "pve1.$domain" 2>/dev/null
    ssh-keygen -R "pve2.$domain" 2>/dev/null
    ssh-keygen -R "pve3.$domain" 2>/dev/null

    echo "SSH key removal process completed for domain: $domain"
}

# To use this function directly, you can call:
# remove_pves_ssh_keys%

