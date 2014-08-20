Ansible role for hardening Ubuntu servers 
===============================================
This playbook is based on Linode documentation.

https://library.linode.com/securing-your-server

Disclaimer
----------
Even if this script does some security related configuration I don't guarantee
that your server will be secure after running it. You have ensure this yourself.
Read the license!

Provides
--------
* Configuration described on https://library.linode.com/securing-your-server
* Logwatch monitoring
* Ansible inventory file template (./hosts)
* Empty SSH related files for adding your keys
  - authorized_keys
  - id_rsa
  - id_rsa.pub
  - known_hosts
* Editable settings including (./group_vars/servers)
  - System user name
  - Password for the user
  - Admin email
  - SSH port
  - Fail2Ban - maxretry, bantime

Requires
------------
* Ansible (tested on 1.6)
  - http://docs.ansible.com/intro_installation.html
* Ubuntu server (tested on vanilla 12.04 LTS)

Usage
-------------
1. Clone the repository
2. Cd to the cloned folder
3. Enter your servers's IP/IPs to the ./hosts file
4. Change the settings on ./group_vars/servers
5. Cd to ./roles/jiv_e.secureubuntu/files/ssh
6. Run ssh-keygen -f ./id_rsa to create ssh keys for your server
7. Add your own public ssh key to the authorized_keys file to allow ssh without
   password
   ```
   $ cat ~/.ssh/id_rsa.pub >> ./authorized_keys
   ```
8. You may add some known_hosts if you want
9. Cd to the repository root and run
   ```
   $ ansible-playbook -i hosts play.yml -c paramiko -k
   ```
   - Note: You may need to install paramiko for this. E.g.
   ```
   $ sudo pip install paramiko
   ```

10. Wait for the script to run and after that you can login in with SSH
   ```
   $ ssh <username>@<server IP> -p <port number>
   ```

Settings
---------------------
See the file ./group_vars/servers for more information.
