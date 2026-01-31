#!/bin/bash
# Resize disk from 20GB to 50GB ###
sudo growpart /dev/nvme0n1 4

# Resize Physical Volume
sudo pvresize /dev/nvme0n1p4

# Extend Logical Volumes
sudo lvextend -L +10G /dev/RootVG/rootVol
sudo lvextend -L +10G /dev/RootVG/varVol
sudo lvextend -l +100%FREE /dev/RootVG/varTmpVol

# Grow filesystems (XFS)
sudo xfs_growfs /
sudo xfs_growfs /var
sudo xfs_growfs /var/tmp

# Java Installation ###
sudo yum install -y java-21-openjdk

# Terraform Installation ###
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum install -y terraform

# Node.js Installation ###
sudo dnf module disable nodejs -y
sudo dnf module enable nodejs:20 -y
sudo dnf install -y nodejs
sudo yum install -y zip

# Docker Installation ###
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin

sudo usermod -aG docker ec2-user
sudo systemctl enable docker
sudo systemctl start docker

# Helm Installation ###
# curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
# chmod +x get_helm.sh
# sudo ./get_helm.sh

curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod +x get_helm.sh
sudo ./get_helm.sh
helm version


# df -h
# lsblk
# vgs
# lvs
# docker --version
# terraform --version
# node -v
# helm version
