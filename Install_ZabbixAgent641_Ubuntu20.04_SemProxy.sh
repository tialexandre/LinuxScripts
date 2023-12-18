#!/bin/bash 
wget https://repo.zabbix.com/zabbix/6.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.4-1+ubuntu20.04_all.deb
dpkg -i zabbix-release_6.4-1+ubuntu20.04_all.deb
apt update -y
 
 apt install zabbix-agent -y 
 

 
 
echo "LogFile=/var/log/zabbix/zabbix_agentd.log" > /etc/zabbix/zabbix_agentd.conf

echo "LogFileSize=0" >> /etc/zabbix/zabbix_agentd.conf

echo "PidFile=/run/zabbix/zabbix_agentd.pid" >> /etc/zabbix/zabbix_agentd.conf

echo "Server=10.3.1.102" >> /etc/zabbix/zabbix_agentd.conf

echo "ServerActive=10.3.1.102" >> /etc/zabbix/zabbix_agentd.conf

echo "Hostname=${HOSTNAME}" >> /etc/zabbix/zabbix_agentd.conf

echo "Include=/etc/zabbix/zabbix_agentd.d/*.conf" >> /etc/zabbix/zabbix_agentd.conf


systemctl restart zabbix-agent
systemctl enable zabbix-agent 
