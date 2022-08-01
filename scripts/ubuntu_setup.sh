#########################################################
# Script to set up a newly installed ubuntu server with #
# tools that I use regularly.                           #
# This script sdhould be run as the intended 'dev' user #
#########################################################
# Version 1.0 | Eliza Danyi | 8.11.2022                 #
#########################################################

## Install utility packages
apt install vim htop curl wget nmap tcptraceroute traceroute bash-completion git open-vm-tools net-tools zsh neofetch

## Set up Oh My ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Copy .zshrc configuration file data
