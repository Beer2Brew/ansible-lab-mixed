#!/bin/bash
###################################################################
#Script Name	: ansble-lab-setup.sh
#Description	: Setup the Ansible Tower lab server
#Args         : None
#Author       : James Cox
#Email        : jpaulcox@hotmail.com
#GitHub Repo  : https://github.com/jpaulcox/ansible-lab-mixed
###################################################################

sudo apt-get update
#sudo apt-get upgrade -y
echo "+++++++++++++++++++++++++++++++++++ Starting Presetup +++++++++++++++++++++++++++++++++++++"

sudo apt install -y nano

echo "+++++++++++++++++++++++++++++++++++ Starting Get Ansible Setup Files +++++++++++++++++++++++++++++++++++++"
# This is to get teh matching setup folder to do the restore of the backed up lab tower. 
curl  -O https://releases.ansible.com/ansible-tower/setup/ansible-tower-setup-3.8.5-1.tar.gz
tar -xzvf ansible-tower-setup-3.8.5-1.tar.gz -C /tmp
mkdir /tmp/ansible-tower-setup-3.8.5-1/tower-backup

# Initial backup
/tmp/ansible-tower-setup-3.8.5-1/setup.sh '-e backup_dest=/tmp/ansible-tower-setup-3.8.5-1/tower-backup' -b

# Restore from lab backup
/tmp/ansible-tower-setup-3.8.5-1/setup.sh '-e restore_backup_file=/vagrant/tower/tower-backup-2021-12-28-02:34:35.tar.gz' -r





