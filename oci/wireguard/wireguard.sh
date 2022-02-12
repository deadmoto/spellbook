#!/usr/bin/env sh
# Wireshark Server startup script for Oracle Cloud Infrastructure.

echo Install packages
yum install -y wireguard-tools qrencode

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
PublicKey           = tm0PZh/BuDljypmI64q4UteIFQHDzEZKzj8Q+Z1i7DE=
AllowedIPs          = 172.16.0.2/32
PersistentKeepAlive = 15

[Peer]
PublicKey           = tAmavq1yhh06gK8OOuk54mFHwkKapRVMHZLDHNErkWo=
AllowedIPs          = 172.16.0.3/32
PersistentKeepAlive = 15
" > /etc/wireguard/wg0.conf
chmod 600 /etc/wireguard/wg0.conf
systemctl enable wg-quick@wg0
wg-quick up wg0

echo Set up NAT
echo "net.ipv4.ip_forward=1" > /etc/sysctl.conf
sysctl -p

echo Configure Firewall
firewall-offline-cmd --zone=public --add-port=51820/udp
systemctl restart firewalld
echo Bootstrap complete!
