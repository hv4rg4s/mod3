#! /bin/bash
#by hvargas 
#create user 
sudo useradd -m -s /bin/bash hvargas && sudo usermod -aG sudo,adm hvargas
#global update
sudo apt update -y 
#list updates
sudo apt list --upgradable
#install curl
sudo apt install curl -y
#install lighttpd 
sudo apt install lighttpd -y
#install mariadb
sudo apt install mariadb-server -y
#install nmap 
sudo apt install nmap -y
#download vulscan script
cd /home/hvargas && git clone https://github.com/scipag/vulscan.git
# install docker for openvas
apt update -y
apt  install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt update
apt install -y docker-ce
usermod -aG docker hvargas
# Install docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
#docker run openvas 
#docker run -d -p 443:443 --name openvas-duoc atomicorp/openvas
#stop and disable services
sudo systemctl stop apparmor cron iscsid ebtables lighttpd kmod lxcfs procps rsyslog
/etc/init.d/iscsid stop
sudo systemctl stop iscsid.socket && sudo systemctl disable iscsid.socket
sudo systemctl stop iscsid
sudo systemctl stop iscsid.service && sudo systemctl disable iscsid.service
sudo systemctl disable apparmor cron iscsid ebtables lighttpd kmod lxcfs procps rsyslog
#kernel-ubuntu version + hostname
uname -a
#install Clamav
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install clamav clamav-daemon -y
#update virusdb
sudo freshclam
#scan dir /home
sudo clamscan -r /home

