#########################################################
# Script to set up a newly installed ubuntu server with #
# tools that I use regularly.                           #
# This script sdhould be run as the intended user       #
# after running auth setup script as root               #
#########################################################
# Version 1.0 | Eliza Danyi | 8.11.2022                 #
#########################################################
#! /bin/bash

# Install utility packages
sudo apt install -y vim htop curl wget nmap tcptraceroute traceroute bash-completion git open-vm-tools net-tools zsh neofetch openssh-server

# Set up Oh My ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" <<< 'y'

# Copy .zshrc configuration file data
curl https://raw.githubusercontent.com/onproton/home-lab-work/main/scripts/resources/.zshrc_ubuntu > ~/.zshrc


# Install K8s packages and extensions - ref:
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management
## Update the apt package index and install packages needed to use the Kubernetes apt repository
sudo apt-get update
sudo apt-get install -y ca-certificates curl
## Download the Google Cloud public signing key:
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
## Add the Kubernetes apt repository
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
## Update apt package index with the new repository and install kubectl
sudo apt-get update
sudo apt-get install -y kubectl