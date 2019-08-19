# Process Overview

## Assumptions
  - You have a valid domain name registered
  
## 1. Preparing the Windows host
  - Copy the [enable_ansible.ps1][enable_ansible] file onto the host and run it through PowerShell (the script is a wrapper around an offical [Ansible script][ConfigureRemotingForAnsible])

## 2. Populate variables in vars.yml and in hosts
  - Enter the IP address or the domain name of the host into [hosts][hosts]; also enter the username and password of the target user
  - Enter an email in [vars.yml][vars]

## 3. Running the playbook
  - > `ansible-playbook certify_win.yml`

[enable_ansible]: https://github.com/rlazimi-dev/ansible_cert_windows_iis/blob/master/enable_ansible.ps1
[ConfigureRemotingForAnsible]: https://github.com/ansible/ansible/blob/devel/examples/scripts/ConfigureRemotingForAnsible.ps1
[hosts]: https://github.com/rlazimi-dev/ansible_cert_windows_iis/blob/master/hosts
[vars]: https://github.com/rlazimi-dev/ansible_cert_windows_iis/blob/master/vars.ym
