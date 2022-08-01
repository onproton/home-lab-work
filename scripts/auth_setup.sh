#########################################################
# Script to set up a newly installed ubuntu server with #
# keys for login and permissions to sudo                #
# This script sdhould be run as root                    #
#########################################################
# Version 1.0 | Eliza Danyi | 8.11.2022                 #
#########################################################

## Set variables for intended user
export user_id='havok2'


## Add public key to autorized keys and ensure permissions are correct
mkdir -p /home/$user_id/.ssh/ && chmod 700 /home/$user_id/.ssh && touch /home/$user_id/.ssh/authorized_keys && chmod 600 /home/$user_id/.ssh/authorized_keys && curl https://raw.githubusercontent.com/onproton/home-lab-work/main/scripts/resources/emd_ed25519.pub >> /home/$user_id/.ssh/authorized_keys && chown -R $user_id:$user_id /home/$user_id/ 

## Set users using keys and not passwords up to sudo without a password in sudoers
echo ''$user_id' ALL=(ALL) NOPASSWD: ALL' | sudo EDITOR='tee -a' visudo

## Change the default sshd_config for openssh access
## Create a backup of the current config file for reference
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bck
### Turn off password authentication, root login
sudo curl https://raw.githubusercontent.com/onproton/home-lab-work/main/scripts/resources/sshd_config_default > /etc/ssh/sshd_config

