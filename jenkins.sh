# #!/bin/bash

# #resize disk from 20GB to 50GB
# growpart /dev/nvme0n1 4

# lvextend -L +10G /dev/RootVG/rootVol
# lvextend -L +10G /dev/mapper/RootVG-varVol
# lvextend -l +100%FREE /dev/mapper/RootVG-varTmpVol

# xfs_growfs /
# xfs_growfs /var/tmp
# xfs_growfs /var


# curl -o /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
# rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
# sudo yum install fontconfig java-21-openjdk -y
# sudo yum install jenkins -y
# sudo systemctl daemon-reload
# sudo systemctl enable jenkins
# sudo systemctl start jenkins

#!/bin/bash
#set -e

### Resize disk from 20GB to 50GB ###
sudo growpart /dev/nvme0n1 4

# Resize physical volume so LVM can see new space
sudo pvresize /dev/nvme0n1p4

# Extend logical volumes
sudo lvextend -L +10G /dev/RootVG/rootVol
sudo lvextend -L +10G /dev/RootVG/varVol
sudo lvextend -l +100%FREE /dev/RootVG/varTmpVol

# Grow XFS filesystems
sudo xfs_growfs /
sudo xfs_growfs /var
sudo xfs_growfs /var/tmp

### Jenkins Installation ###
sudo rm -f /etc/yum.repos.d/jenkins.repo

sudo curl -L -o /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

sudo yum clean all
sudo yum makecache
sudo yum install -y fontconfig java-21-openjdk

sudo yum install -y jenkins
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins

# df -h
# lsblk
# lvs
# systemctl status jenkins
