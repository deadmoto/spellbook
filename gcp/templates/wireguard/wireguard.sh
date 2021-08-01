#!/usr/bin/env sh
# Wireshark Server startup script for Google Cloud Platform.
#
# To execute the script again SSH into the VM and run the following command:
# sudo google_metadata_script_runner startup
#
# To view the output of the script run the following command:
# sudo journalctl -u google-startup-scripts.service

echo Install GCP agent
curl -sSO https://dl.google.com/cloudagents/add-monitoring-agent-repo.sh
bash add-monitoring-agent-repo.sh --also-install

echo Install packages
apt update
apt -y install wireguard qrencode linux-headers-$(uname -r)

echo Retrieve GCP metadata
IFACE=$(ip -o -4 route show to default | awk '{print $5}')
SERVER_IP=$(curl http://metadata/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip -H "Metadata-Flavor: Google")
SERVER_PRIVATE_KEY=$(curl http://metadata.google.internal/computeMetadata/v1/instance/attributes/SERVER_PRIVATE_KEY -H "Metadata-Flavor: Google")
SERVER_PUBLIC_KEY=$(echo ${SERVER_PRIVATE_KEY} | wg pubkey)

CLIENT_IP=$(curl http://metadata.google.internal/computeMetadata/v1/instance/attributes/CLIENT_IP -H "Metadata-Flavor: Google")
CLIENT_PRIVATE_KEY=$(curl http://metadata.google.internal/computeMetadata/v1/instance/attributes/CLIENT_PRIVATE_KEY -H "Metadata-Flavor: Google")
CLIENT_PUBLIC_KEY=$(echo ${CLIENT_PRIVATE_KEY} | wg pubkey)

echo Set up Wireguard
echo "
[Interface]
PrivateKey          = ${SERVER_PRIVATE_KEY}
Address             = 172.16.0.1/12
ListenPort          = 51820
SaveConfig          = false
PostUp              = iptables -A FORWARD -i %i -j ACCEPT
PostUp              = iptables -t nat -A POSTROUTING -o ${IFACE} -j MASQUERADE
PostUp              = ip rule add to 169.254.169.254 table main
PostDown            = iptables -D FORWARD -i %i -j ACCEPT
PostDown            = iptables -t nat -D POSTROUTING -o ${IFACE} -j MASQUERADE
PostDown            = ip rule del to 169.254.169.254 table main

[Peer]
PublicKey           = ${CLIENT_PUBLIC_KEY}
AllowedIPs          = 172.16.0.2/32
PersistentKeepAlive = 15
" > /etc/wireguard/wg0.conf
chmod 600 /etc/wireguard/wg0.conf
systemctl enable wg-quick@wg0
wg-quick up wg0

echo Set up NAT
echo "net.ipv4.ip_forward=1" > /etc/sysctl.conf
sysctl -p

# Client config
echo "
[Interface]
PrivateKey          = ${CLIENT_PRIVATE_KEY}
Address             = 172.16.0.2/32
DNS                 = 8.8.8.8, 8.8.4.4

[Peer]
PublicKey           = ${SERVER_PUBLIC_KEY}
Endpoint            = ${SERVER_IP}:51820
AllowedIPs          = 0.0.0.0/0
" > /etc/wireguard/wg-client.conf

echo Bootstrap complete!
