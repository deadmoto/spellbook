#!/usr/bin/env sh
# Wireshark Server startup script for Oracle Cloud Infrastructure.

echo Install packages
dnf install oraclelinux-developer-release-el8
dnf config-manager --disable ol8_developer
dnf config-manager --enable ol8_developer_UEKR6
dnf config-manager --save --setopt=ol8_developer_UEKR6.includepkgs='wireguard-tools*'
dnf install -y wireguard-tools

echo Enable NAT
echo "net.ipv4.ip_forward=1" > /etc/sysctl.conf
sysctl -p

echo Enable IP masquerade
firewall-offline-cmd --zone=public --add-masquerade

echo Enable Wireguard UDP port 51820
firewall-offline-cmd --zone=public --add-port=51820/udp

echo Apply firewalld settings
systemctl restart firewalld

echo Retrieve OCI metadata
IFACE=$(ip -o -4 route show to default | awk '{print $5}' | head -n 1)
SERVER_PRIVATE_KEY=$(curl -H "Authorization: Bearer Oracle" -L http://169.254.169.254/opc/v2/instance/freeformTags/SERVER_PRIVATE_KEY)

echo Set up Wireguard
echo "[Interface]
PrivateKey          = ${SERVER_PRIVATE_KEY}
Address             = 172.16.0.1/12
ListenPort          = 51820
SaveConfig          = false
PostUp              = iptables -I FORWARD -i %i -j ACCEPT
PostUp              = iptables -t nat -A POSTROUTING -o ${IFACE} -j MASQUERADE
PostDown            = iptables -D FORWARD -i %i -j ACCEPT
PostDown            = iptables -t nat -D POSTROUTING -o ${IFACE} -j MASQUERADE

[Peer]
PublicKey           = /76JDUA3eavXCB/RBBq/fyCfr2OcxJ2F8bLJedE6AE0=
AllowedIPs          = 172.16.0.2/32
PersistentKeepAlive = 15

[Peer]
PublicKey           = 4BCI3Ccmay2TDpG4zptRRP+gnwhSWnBtPd1y8s95FkQ=
AllowedIPs          = 172.16.0.3/32
PersistentKeepAlive = 15

[Peer]
PublicKey           = sgSrFqKozGbN8MtE5MtOw6lUpHESllmbFQSE8lA41hg=
AllowedIPs          = 172.16.0.4/32
PersistentKeepAlive = 15

[Peer]
PublicKey           = oM+QpKxE86p1VQEoioGOxBhPhUkqg3BdM8vCaoRUXBU=
AllowedIPs          = 172.16.0.5/32
PersistentKeepAlive = 15
" > /etc/wireguard/wg0.conf
chmod 600 /etc/wireguard/wg0.conf
systemctl enable wg-quick@wg0
wg-quick up wg0

echo Bootstrap complete!
